$(document).on('turbolinks:load', function () {
  // whole js file for barcode feature: camera output & quagga API input under stocks show view
  var results = {}
  var video = $('#cam_output')[0]
  var constraints = { video: true }

  function handleSuccess (stream) {
    window.stream = stream // only to make stream available to console, we require this to turn off the camera feed
    video.srcObject = stream
  }

  function handleError (error) {
    console.log('navigator.getUserMedia error: ', error)
  }

  function camstart (a) {
    if (a === 'begin') {
      navigator.mediaDevices.getUserMedia(constraints)
      .then(handleSuccess).catch(handleError)
    }
  }

  function barcodeStart () {
    Quagga.init(
      {
        inputStream: {
          name: 'Live',
          type: 'LiveStream',
          target: '#cam_output'
        },
        decoder: {
          readers: ['ean_reader'],
          config: {}
        }
      },
    function (err) {
      if (err) {
        console.log(err)
        return
      }
      for (var key in results) { // to empty the results object each initialization
        delete results[key]
      }
      Quagga.start()
    })
  }

  Quagga.onProcessed(function (result) { // this is given by default from the API, asks canvas element to plot on-screen the barcode area (visual indicator for users)
    var drawingCtx = Quagga.canvas.ctx.overlay
    var drawingCanvas = Quagga.canvas.dom.overlay

    if (result) {
      if (result.boxes) {
        drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute('width')), parseInt(drawingCanvas.getAttribute('height')))
        result.boxes.filter(function (box) {
          return box !== result.box
        }).forEach(function (box) {
          Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: 'green', lineWidth: 2})
        })
      }

      if (result.box) {
        Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: '#00F', lineWidth: 2})
      }

      if (result.codeResult && result.codeResult.code) {
        Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3})
      }
    }
  })

  Quagga.onDetected(function (result) { // store barcodes in an object 'results'
    var code1 = result.codeResult.code
    if (results[code1] === undefined) results[code1] = 1
    else results[code1] += 1

    var frequency = Object.values(results) // frequency of scanned barcode recorded
    // var totalScans = frequency.reduce(function (a, b) { // could be used to filter for an output w/ X% frequency
    //   return a + b
    // })
    var maxFrequency = Math.max.apply(null, frequency)

    function keyByValue (value) {
      var keyArray = Object.keys(results)
      var valueArray = Object.values(results)
      var valueIndex = valueArray.indexOf(value)

      return keyArray[valueIndex]
    }
    if (maxFrequency > 5) {
      var mostScannedBarcode = keyByValue(maxFrequency)
      $('#barcodeField').val(mostScannedBarcode)
      setTimeout(function () {
        $('#barcodeSubmit').click()
      }, 100)
    }
  })
  // used for Quagga input start and stop, feature can be implemented if necessary
  // $('#stopScan').click(function () {
  //   Quagga.stop()
  // })
  // $('#startScan').click(function () {
  //   barcodeStart()
  // })

  if ($('#cam_output').length > 0) {
    camstart('begin')
    barcodeStart()
  }
  if ($('#cam_output').length === 0) {
    Quagga.stop()
    stream.getTracks().forEach(function (track) { track.stop() })
  }
})
