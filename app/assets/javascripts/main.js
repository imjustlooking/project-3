$(document).on('turbolinks:load', function () {

  $('.flipping').on('click', function() {

    var $card = $(this).closest('.card-container')
    console.log($card)
    if($card.hasClass('hover')){
      $card.removeClass('hover')
    } else {
      $card.addClass('hover')
    }
  })

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
      console.log('Initialization finished. Ready to start')
      for (var key in results) { // to empty the results object
        delete results[key]
      }
      Quagga.start()
    })
  }

  Quagga.onProcessed(function (result) {
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

    Quagga.onDetected(function (result) {
      var code1 = result.codeResult.code
      if (results[code1] === undefined) results[code1] = 1
      else results[code1] += 1

      console.log(results)
      var frequency = Object.values(results)
      var totalScans = frequency.reduce(function (a, b) {
        return a + b
      })
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
      setTimeout(function(){
        $('#barcodeSubmit').click()
        console.log('click')}, 100)

      }
    })

  $('#stopScan').click(function () {
    console.log('stop')
    Quagga.stop()
  })

  $('#startScan').click(function () {
    console.log('start')
    barcodeStart()
  })

  var camSwitch = 0
  if ($('#cam_output').length > 0) {
    console.log('trying to turn on')
    camstart('begin')
    barcodeStart()
    camSwitch = 1
  }
  if (camSwitch === 0 && $('#cam_output').length === 0) {
    console.log('trying to turn off_constraints')
    Quagga.stop()
    stream.getTracks().forEach(function (track) { track.stop() })
  }
  console.log('length is',$('#cam_output').length)
  console.log('camSwitch', camSwitch)
})
