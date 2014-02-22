$(document).ready ->
  $('#player-sketch-image').load ->
    $canvas = $('#sketch')
    $backgroundImage = $('#player-sketch-image')
    $canvas[0].width = $backgroundImage.width()
    $canvas[0].height = $backgroundImage.height()

    $canvas.css('background-image', "url(#{$backgroundImage[0].src})")

    $.each(['#f00', '#ff0', '#0f0', '#0ff', '#00f', '#f0f', '#000', '#fff'], () ->
      $('#sketch-tools').append("<a href='#sketch' data-color='" + this + "' style='background: " + this + ";'></a> ")
    )

    $('#sketch').sketch() if $('#sketch').size()

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
      console.log binderCanvas.toDataURL()
      $(this).off('submit').submit()
