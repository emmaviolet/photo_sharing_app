console.log('javascript works');

$(document).ready(function() {
  
  $('#addCommentButton').click(function(e) {
    e.preventDefault();
    $('#addComment').show('slow', function() {
    });
  });
