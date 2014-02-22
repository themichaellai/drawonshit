$(document).ready ->
  $('#sketch').sketch()
  $('#upload').bind 'click', ->
    $canvas = $('#sketch')

    #backgroundImage = new Image()
    #backgroundImage.src = ''

    drawnImage = new Image()
    drawnImage.src = $canvas[0].toDataURL()

    binderCanvas = document.createElement('canvas')
    context = binderCanvas.getContext('2d')
    binderCanvas.width = drawnImage.width
    binderCanvas.height = drawnImage.height
    #context.drawImage(backgroundImage, 0, 0)
    context.drawImage(drawnImage, 0, 0)

    console.log binderCanvas.toDataURL()
