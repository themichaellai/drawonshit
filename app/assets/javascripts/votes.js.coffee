$ ->
  $.ajaxSetup beforeSend: (xhr) ->
    token = $("meta[name=\"csrf-token\"]").attr("content")
    xhr.setRequestHeader "X-CSRF-Token", token  if token
    return
  return

$(document).ready ->
  $(".upvote").click ->
    console.log "upvoted"
    doodleId = getIdFromId this.id
    endpoint = "doodles/"+doodleId+"/upvote.js"
    $.ajax({
      url: endpoint,
      type: "PUT",
      success: (data)->
        updateVotes(data)
      })
  $(".downvote").click ->
    console.log "donwvoted"
    doodleId = getIdFromId this.id
    endpoint = "doodles/"+doodleId+"/downvote.js"
    $.ajax({
      url: endpoint,
      type: "PUT",
      success: (data)->
        console.log("suc")
        updateVotes(data)
      })


getIdFromId = (id) ->
  id.split('-')[2]

updateVotes = (obj) ->
  id = "doodle-"+obj['id']
  up = obj['upvotes']
  down = obj['downvotes']
  
  $("#"+id).find('.score').html(up-down)
