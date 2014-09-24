function setup() {
  $('#account_nav0').click(function(ev){
    ev.preventDefault();
    hiddenLogin(0);
  });
  $('#account_nav1').click(function(ev){
    ev.preventDefault();
    hiddenLogin(1);
  });
  $('#account_nav2').click(function(ev){
    ev.preventDefault();
    hiddenLogin(2);
  });
  $('#account_nav3').click(function(ev){
    ev.preventDefault();
    hiddenLogin(3);
  });
  $('#usereditinfobutton').click(showUserEdit);
  $('#newalbumbutton').click(showNewAlbumInfo);
  $('#usereditsubmit').click(submitUserInfo);
  $('#new_album_submit').click(submitAlbumInfo);
}

function hiddenLogin(num) {
  showDropdown('hidden_login'+num);
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
    success: submitSuccess(userUsername)
  });
}

function submitSuccess(userUsername) {
  showUserEdit();
  $("#user_username").html(userUsername);
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
    url: "/albums",
    type: 'POST',
    data: { album: {name: albumName, description: albumDescription, user_id: userId} },
    success: newAlbumSuccess(albumName)
  });
}

function newAlbumSuccess(albumName) {
  var albumInfo = $('#useralbums').html();
  showNewAlbumInfo();
  var imageUrl = $('#album_image').val();
  var imageTag = "<img src='" + imageUrl + "' width=100px height=100px>";
  $("#useralbums").html(albumInfo + "<div class='useralbum'>" + imageTag + "<br>" + albumName + "<br><a href=''>Edit</a> | <a href=''>Delete</a></div>");
  $(".notice").html(albumName + " has been added.");
  $(".notice").slideDown("fast").delay(5000).slideUp("fast");
}
