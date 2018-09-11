function admin_modify_member(userID) {
    $.ajax({
        type: 'POST',
        url: '/getUserInfo',
        data: {userID: userID},
        dataType: 'json',
        success: function (data) {
            // alert(data);
            $('#userIDModal').val(data.userID);
            $('#userNameModal').val(data.userName);
            $('#userNickNameModal').val(data.userNickName);
            $('#userPwdModal').val(data.userPwd);
        }
    })
}