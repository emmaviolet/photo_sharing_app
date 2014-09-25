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
    var formInput = $('#comment_text').val()
    //userId defined in view
    $.ajax({
      url: '/photos/' + photoId + "/comments.json",
      type: 'POST',
      data: { comment: { text: addCommentText, photo_id: photoId, user_id: userId } }, 
      success: function(response) {   
        $('#allComments').append( response );
        $('#addComment').hide('slow', function() {
        });
        $('#comment_text').val("");
      },
      error: function() { 
        alert('Error: Your comment cannot be saved. Please try again.');
      }
    });
  }); 

  $('#allComments').on('click', '.editCommentButton', function() {
    if ($(this).next('.editComment')[0].style.display === 'none'){
      $(this).next('.editComment').show('slow', function() {
      });
    } else {
      $(this).next('.editComment').hide('slow', function() {
      });
    }
  });

});

