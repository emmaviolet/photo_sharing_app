console.log('javascript works');

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

  $('#addComment').on('submit', function(ev) {
    ev.preventDefault();
    // console.log('default prevented');
    var photoId =  $('#photo_id').val();
    // console.log(photoId);
    var addCommentText = $('#comment_text').val();
    // console.log(addCommentText);
    console.log(userId);
    $.ajax({
      url: '/photos/' + photoId + ".json",
      // type: 'POST',
      // data: { comment: { text: addCommentText } }, 
      // success: $(".notice").html('Comment Added.')
    });
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

