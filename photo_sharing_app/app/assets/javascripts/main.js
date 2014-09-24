function setup() {
  $('#usereditinfobutton').click(showUserEdit);
  $('#newalbumbutton').click(showNewAlbumInfo);
  $('#usereditsubmit').click(submitUserInfo);
  $('#new_album_submit').click(submitAlbumInfo);
  $('#account_nav0').click(showDropdown0);
  $('#account_nav1').click(showDropdown1);
  $('#account_nav2').click(showDropdown2);
  $('#account_nav3').click(showDropdown3);
}

function showUserEdit() {
  var showType = document.getElementById('usereditinfo').style.display;
  if(showType === 'none'){
    $('#usereditinfo').slideDown("slow").css("display","block");
  } else {
    $('#usereditinfo').slideUp("slow");
    setTimeout(function(){document.getElementById('usereditinfo').style.display = "none"}, 1000);
  };
}

function showDropdown0() {
  var showType = document.getElementById('hidden_login0').style.display;
  if(showType === 'none'){
    $('#hidden_login0').slideDown("slow").css("display","block");
  } else {
    $('#hidden_login0').slideUp("slow");
    setTimeout(function(){document.getElementById('hidden_login0').style.display = "none"}, 1000);
  };
}

function showDropdown1() {
  var showType = document.getElementById('hidden_login1').style.display;
  if(showType === 'none'){
    $('#hidden_login1').slideDown("slow").css("display","block");
  } else {
    $('#hidden_login1').slideUp("slow");
    setTimeout(function(){document.getElementById('hidden_login1').style.display = "none"}, 1000);
  };
}

function showDropdown2() {
  var showType = document.getElementById('hidden_login2').style.display;
  if(showType === 'none'){
    $('#hidden_login2').slideDown("slow").css("display","block");
  } else {
    $('#hidden_login2').slideUp("slow");
    setTimeout(function(){document.getElementById('hidden_login2').style.display = "none"}, 1000);
  };
}

function showDropdown3() {
  var showType = document.getElementById('hidden_login3').style.display;
  if(showType === 'none'){
    $('#hidden_login3').slideDown("slow").css("display","block");
  } else {
    $('#hidden_login3').slideUp("slow");
    setTimeout(function(){document.getElementById('hidden_login3').style.display = "none"}, 1000);
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
  var imageTag = "<img src='" + imageUrl + "'";
  $("#useralbums").html(albumInfo + imageTag + albumName);
  $(".notice").html(albumName + " has been added.");
  $(".notice").slideDown("fast").delay(5000).slideUp("fast");
}
