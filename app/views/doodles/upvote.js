console.log("hello");
var id = <%= @doodle.id %>;
console.log("search");
$("#doodle-"+id).find('.upvotes').html(@doodle.votes.up);
$("#doodle-"+id).find('.downvotes').html(@doodle.votes.up);

