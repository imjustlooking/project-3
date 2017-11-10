console.log('entering main');
$(document).on('turbolinks:load', function () {
  console.log('starting ...');
  $('.stocks.show').ready(function(){
    console.log('success');
    var results = {}
    var video = $('#gum-local')[0]
    var constraints = { audio: false, video: true }

    camstart('begin')
    function camstart (a) {
      if (a === 'begin') {
        navigator.mediaDevices.getUserMedia(constraints)

    .then(function (stream) {
      console.log('activated', stream)
      video.srcObject = stream
    })

    .catch(function (err) {
      console.log(err)
    })
      }
    }

    barcodeStart()
    function barcodeStart () {
      Quagga.init(
        {
          inputStream: {
            name: 'Live',
            type: 'LiveStream',
            target: '#gum-local'
          },
          decoder: {
        // readers : ['ean_reader','ean_8_reader','code_39_reader','code_39_vin_reader','codabar_reader','upc_reader','upc_e_reader','code_128_reader'],
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
      for (var key in results) { // to can empty the results object
        delete results[key]
      }
      Quagga.start()
    })
    }

    Quagga.onProcessed(function (result) {
      var drawingCtx = Quagga.canvas.ctx.overlay,
        drawingCanvas = Quagga.canvas.dom.overlay

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
            // var totalScans = frequency.reduce(function(a, b) {
            //   return a + b
            // })
      var maxFrequency = Math.max.apply(null, frequency)
            // console.log('maxFrequency', maxFrequency)
            // if (maxFrequency > (0.7 * totalScans) && totalScans > 20) {
      var mostScannedBarcode = Object.keys(results).find(key => results[key] === maxFrequency)
      console.log('max', mostScannedBarcode)
      $('#barcodeField').val(mostScannedBarcode)
          // }
    })

    $('#stopScan').click(function () {
      console.log('stop')
      Quagga.stop()
    })

    $('#startScan').click(function () {
      console.log('start')
      barcodeStart()
    })
  })
})
