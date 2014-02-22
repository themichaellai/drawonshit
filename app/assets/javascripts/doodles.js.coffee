# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#sketch').sketch() if $('#sketch').size()
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
