$(document).ready ->
  $('#player-sketch-image').load ->
    $canvas = $('#sketch')
    $backgroundImage = $('#player-sketch-image')
    $canvas[0].width = $backgroundImage.width()
    $canvas[0].height = $backgroundImage.height()

    $canvas.css('background-image', "url(#{$backgroundImage[0].src})")

    $('#sketch').sketch()
    $('#doodle-form').on 'submit', (e) ->
      e.preventDefault()
      $canvas = $('#sketch')

      backgroundImage = new Image()
      backgroundImage.src = $('#player-sketch-image')[0].src

      drawnImage = new Image()
      drawnImage.src = $canvas[0].toDataURL()

      binderCanvas = document.createElement('canvas')
      context = binderCanvas.getContext('2d')
      binderCanvas.width = drawnImage.width
      binderCanvas.height = drawnImage.height
      context.drawImage(backgroundImage, 0, 0)
      context.drawImage(drawnImage, 0, 0)

      $('#doodle_image').val(binderCanvas.toDataURL())
      $(this).off('submit').submit()
