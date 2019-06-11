<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
                pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<title>Restaurant Web Order System</title>
<head></head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
h2{
    padding-top: 100px;
}
</style>
<script>

$(document).ready(function () {
    $('#btnLogin').on('click', function() {

        if( $('[name="username"]').val() == '') {
            alert('Please enter a valid username');
            return;
        }


        if( $('[name="password"]').val() == '') {
            alert('Please enter a valid password');
            return;
        }

        var obj = {
                  'user_login':$('[name="username"]').val(),
                  'user_password':$('[name="password"]').val()
                  };
        $.ajax({
            type: "post",
            url: "/doLogin",
            data: JSON.stringify(obj),
            dataType: "json",                 // 받을때 json 
            contentType: "application/json",  // 넘길때 json
            success: function (response) {
                if(response.message == 'LOGIN') {
                    location.href='./terminal.do';
                } else {
                    if(response.message == 'PASS_NOT_MATCH') { alert('Please check your Username and Password'); }
                    if(response.message == 'ID_NOT_MATCH') { alert('Please check your Username and Password'); }
                    return ;
                }
            }
        });  // ajax
    }); // btnLogin


}); // docready 

</script>
        <div class="row">
            <h2 style="text-align: center">Please Login to get started</h2>
            <div style="width: 30%; margin: 25px auto;">

                    <div class="form-group">
                        <input class="form-control" type="text" name="username" placeholder="username">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password" placeholder="password">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-primary btn-block" id="btnLogin">Login</button>
                    </div>
            </div>
        </div>
    </body>
</html>