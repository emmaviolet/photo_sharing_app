console.log('javascript works');

$(document).ready(function() {

  $('#addCommentButton').click(function(e) {
    e.preventDefault();
    $('#addComment').show('slow', function() {
    });
  });

  $('.editCommentButton').click(function(e) {
    e.preventDefault();
    $(this).next('.editComment').show('slow', function() {
    });
  });

});