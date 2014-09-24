console.log('javascript works');

// $('#addCommentButton').click(function(e) {
//   e.preventDefault();


$(document).ready(function() {

  $('#addCommentButton').click(function() {
    if ($('#addComment')[0].style.display === 'none'){
      $('#addComment').show('slow', function() {
      });
    } else {
      $('#addComment').hide('slow', function() {
      });
    }
  });

  $('.editCommentButton').click(function() {
    if ($(this).next('.editComment')[0].style.display === 'none'){
      $(this).next('.editComment').show('slow', function() {
      });
    } else {
      $(this).next('.editComment').hide('slow', function() {
      });
    }
  });

});

