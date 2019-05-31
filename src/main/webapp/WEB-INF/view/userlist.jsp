<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User List</title>
</head>
<body>

<h2>Register User</h2>
<table>
  <tr>
    <td><input type="text" placeholder="user_name" name="user_name" value=""/></td>
    <td><input type="text" placeholder="user_ID" name="user_login" value=""/></td>
    <td><input type="text" placeholder="user_password" name="user_password" value=""/></td>
    <td><input type="text" placeholder="user_email" name="user_email" value=""/></td>
    <td><input type="text" placeholder="user_type" name="user_type" value=""/></td>
    <td>
      <button class="btn-user-save">Add New</button>
    </td>
  </tr>
</table>
<hr/>
<h2>User List</h2>
  <ul class="users-list">
   <c:forEach items="${userList}" var="demo">
   <li data-id="${demo.user_id}">${demo.user_name} / ${demo.user_login} / ${demo.user_email} / ${demo.user_type} </li>
   </c:forEach>
  </ul>




<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>
$(document).ready(function () {
  
  // 사용자 신규 저장 
  $('.btn-user-save').on('click', function() {
    debugger;
  });  // 사용자 신규 저장

  function getUserList() {

    var str = '';
    $.ajax({
      url: "./users",
      dataType: "json",
      success: function (response) {
        $.each(response, function (indexInArray, valueOfElement) { 
          str += '<li data-id="'+ valueOfElement.user_id + '"> ' + valueOfElement.user_name + ' /' + valueOfElement.user_login + ' /' + valueOfElement.user_email +' / ' + valueOfElement.user_type +'/ </li>';
        });
        $('.users-list').html(str);
      }
    });
    
  }
});
</script>
</body>
</html>