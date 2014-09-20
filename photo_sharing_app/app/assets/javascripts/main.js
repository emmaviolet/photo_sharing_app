function setup() {
  $('#usereditinfobutton').click(showUserEdit);
  $('#usereditsubmit').click(submitUserInfo);
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

function submitUserInfo() {
  var userEmail = $('#email').val();
  var userPassword = $('#password').val();
  var userPasswordConfirmation = $('#passwordconfirmation').val();
  var userId = $('#user_id').val();

  $.ajax({
    url: "/users/"+userId+".json",
    type: 'PUT',
    data: { user: {email: userEmail, password: userPassword, password_confirmation: userPasswordConfirmation } },
    success: submitSuccess(userEmail)
  });
}

function submitSuccess(userEmail) {
  showUserEdit();
  $("#user_email").html(userEmail);
}
