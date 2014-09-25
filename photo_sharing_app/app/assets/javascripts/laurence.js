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
    var photoId =  $('#photo_id').val();
    var addCommentText = $('#comment_text').val();
    //userId defined in view
    $.ajax({
      url: '/photos/' + photoId + "/comments.json",
      type: 'POST',
      data: { comment: { text: addCommentText, photo_id: photoId, user_id: userId } }, 
      dataType: "json",
      success: $( "#commentsContainer" ).load( '/photos/' + photoId + '.html #allComments', function() {
        alert( "Comment Added." );
      }),
      // error: $(".notice").html('Error: Your comment cannot be saved. Please try again, without using any special characters.')
    });
  });
  //put comments each loop form into partial
  // render partial on success
  

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

