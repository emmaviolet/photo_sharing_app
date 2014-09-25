function setup() {
  $('.account_nav').click(function(ev){
    ev.preventDefault();
    var num = event.target.id;
    showLogin(num);
  });
  $('#usereditinfobutton').click(showUserEdit);
  $('#newalbumbutton').click(showNewAlbumInfo);
  $('#usereditsubmit').click(submitUserInfo);
  $('#new_album_submit').click(submitAlbumInfo);
  $('.cover_photo_option').click(function(ev){
    selectCoverPhoto(event.target);
  });
}

function showLogin(num) {
  $('.displayed_object').each(function(i) {
    var that = this;
    $(this).stop().slideUp("slow", function() {
      $(that).removeClass('displayed_object');
    });
  });
  $('#hidden_login'+num).slideDown("slow").addClass("displayed_object").delay(1000).slideUp("slow", function() {
    $('#hidden_login'+num).removeClass('displayed_object');
  })
}

function showUserEdit() {
  showDropdown('usereditinfo');
}

function showDropdown(element) {
  var showType = document.getElementById(element).style.display;
  if(showType === 'none'){
    $('#'+ element).slideDown("slow").css("display","block");
  } else {
    $('#' + element).slideUp("slow");
    setTimeout(function(){document.getElementById(element).style.display = "none"}, 1000);
  };
}

function submitUserInfo() {
  var userEmail = $('#email').val();
  var userUsername = $('#username').val();
  var userPassword = $('#password').val();
  var userPasswordConfirmation = $('#passwordconfirmation').val();
  var userId = $('#user_id').val();

  $.ajax({
    url: "/users/"+userId+".json",
    type: 'PUT',
    data: { user: {email: userEmail, username: userUsername, password: userPassword, password_confirmation: userPasswordConfirmation } },
    success: function(data) {
      submitSuccess(userUsername);
    },
    error: function() { 
      alert('Error: Your changes are invalid. Please try again.');
    }
  });
}

function submitSuccess(userUsername) {
  showUserEdit();
  $("#user_username").html(userUsername);
  $("#0").html(userUsername);
  $(".notice").html("User info successfully updated.");
  $(".notice").slideDown("fast").delay(5000).slideUp("fast");
}

function showNewAlbumInfo() {
  var showType = document.getElementById('newalbuminfo').style.display;
  if(showType === 'none'){
    $('#newalbuminfo').slideDown().css("display","block");
  } else {
    $('#newalbuminfo').slideUp();
    setTimeout(function(){document.getElementById('newalbuminfo').style.display = "none"}, 1000);
  };
}

function submitAlbumInfo() {
  var albumName = $('#album_name').val();
  var albumDescription = $('#album_description').val();
  var userId = $('#user_id').val();

  $.ajax({
    url: "/albums.json",
    type: 'POST',
    data: { album: {name: albumName, description: albumDescription, user_id: userId} },
    success: function(data) {
      console.log(data);
      newAlbumSuccess(albumName);
    },
    error: function(data) { 
      alert('Error: Your input is invalid. Please try again.');
    }
  });
}

function newAlbumSuccess(albumName) {
  var albumInfo = $('#useralbums').html();
  showNewAlbumInfo();
  var imageUrl = $('#album_image').val();
  var imageTag = "<img src='" + imageUrl + "' width=100px height=100px>";
  $("#useralbumscontainer").html(albumInfo + "<div class='useralbum'>" + imageTag + "<br>" + albumName + "<br><a href=''>Edit</a> | <a href=''>Delete</a></div>");
  $(".notice").html(albumName + " has been added.");
  $(".notice").slideDown("fast").delay(5000).slideUp("fast");
}

function selectCoverPhoto(object) {
  $('.photo_options').each(function(i) {
    this.style.border = "none";
  });
  $('.radio_buttons').each(function(i) {
    this.checked = false;
  });
  var target = $(object).attr("data-id");
  object.style.border = "2px solid black";
  $("#album_cover_photo_id_" + target)[0].checked = true;
}

function clearBorder(object) {
  console.log('success');
}
