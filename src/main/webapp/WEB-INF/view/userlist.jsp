<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
 <head>
 <style>
 .modify {
   position: absolute;
   top: 106px;
   left:500px;
 }
 </style>
 </head>
 <body>

  <h1>User Management</h1>
  <table class="new">
      <tr>
          <td><input type="text" placeholder="user_name" name="user_name" value="" /></td>
          <td><input type="text" placeholder="user_ID" name="user_login" value="" /></td>
          <td><input type="text" placeholder="user_password" name="user_password" value="" /></td>
          <td><input type="text" placeholder="user_email" name="user_email" value="" /></td>
          <td>
               <select name="menu_id">
                    <option value="">User Type</option>
                        <c:forEach items = "${userList}" var = "data">
                            <option value="${data.user_type}">${data.user_type}</option>
                        </c:forEach>
                </select>
          </td>
          <td>
            <button class="btn-user-save">Add User</button>
          </td>
      </tr>
  </table>

   <hr/>
   <h2>List user </h2>
    <ul class="users-list">
        <c:forEach items="${userList}" var="demo">
               <li data-id="${demo.user_id}">${demo.user_id} / ${demo.user_login} / ${demo.user_password} / ${demo.user_email} / ${demo.user_type} </li>
        </c:forEach>
   </ul>

  <div class="modify">
  <h2>Modification</h2>
  <table>
      <tr>
          <td>
            <input type="hidden" name="user_id" value=""/>
            <input type="text" placeholder="user_name" name="user_name" value="" /></td>
      </tr>
      <tr>
          <td><input type="text" placeholder="user_ID" name="user_login" value="" /></td>
      </tr>
      <tr>
          <td><input type="text" placeholder="user_password" name="user_password" value="" /></td>
      </tr>
      <tr>
          <td><input type="text" placeholder="user_email" name="user_email" value="" /></td>
      </tr>
      <tr>
          <td><input type="text" placeholder="user_type" name="user_type" value="" /></td>
      </tr>
      <tr>
          <td>
                <button class="btn-user-save2">Change and save</button>
                <button class="btn-user-delete">Delete</button>
          </td>
      </tr>
  </table>
  </div>

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>

$(document).ready(function () {

  $('[name="user_name"]').val();
  $('[name="user_login"]').val();
  $('[name="user_password"]').val();
  $('[name="user_email"]').val();
  $('[name="user_type"]').val();

  $('.btn-user-save').on('click', function() {

    var dataObj = {
      user_name: $('[name="user_name"]').val(),
      user_login: $('[name="user_login"]').val(),
      user_password: $('[name="user_password"]').val(),
      user_email: $('[name="user_email"]').val(),
      user_type: $('[name="user_type"]').val(),
      };

        debugger

    $.ajax({
      type: "POST",
      url: "./users",
      data: dataObj,
      dataType: "json",  // return
      success: function (response) {
        alert('Registered');
        getuserList();
      }
    });
  }); // 신규 저장 버튼 이벤트


  // 1건 조회
  $(document).on('click','li', function() {
  // $('li').on('click', function() {
    console.log($(this).data('id'));

    $.ajax({
      url: "./users/" + $(this).data('id') ,
      // data: "data",  // url?id=1
      dataType: "json",  // return type
      success: function (response) {
        $('.modify [name="user_id"]').val(response.user_id);
        $('.modify [name="user_name"]').val(response.user_name);
        $('.modify [name="user_login"]').val(response.user_login);
        $('.modify [name="user_password"]').val(response.user_password);
        $('.modify [name="user_email"]').val(response.user_email);
        $('.modify [name="user_type"]').val(response.user_type);
      }
    });
  });

  // 수정
  $('.btn-user-save2').on('click', function() {

    var obj = {
        "user_id": $('.modify [name="user_id"]').val(),
        "user_name": $('.modify [name="user_name"]').val(),
        "user_login": $('.modify [name="user_login"]').val(),
        "user_password": $('.modify [name="user_password"]').val(),
        "user_email": $('.modify [name="user_email"]').val(),
        "user_type": $('.modify [name="user_type"]').val()
    };

    $.ajax({
      type: "PUT",
      url: "./users/" + $('.modify [name="user_id"]').val(),
      data: JSON.stringify(obj),
      contentType: 'application/json',
      dataType: "json", // return type
      success: function (response) {
        debugger
        alert('Modified');
        getuserList();
      }
    });
  });


  // 삭제
  $('.btn-user-delete').on('click', function() {
    $.ajax({
      type: "DELETE",
      url: "./users/" + $('.modify [name="user_id"]').val(),
      contentType: 'application/json',
      dataType: "json",
      success: function (response) {
        alert('Deleted');
        getuserList();
      }
    });
  })

  function getuserList() {
    var str = '';
    $.ajax({
      url: "./users",
      dataType: "json",  // return type
      success: function (response) {
        $.each(response, function (indexInArray, valueOfElement) {
            str += '<li data-id="'+ valueOfElement.user_id + '"> ' + valueOfElement.user_id + ' /' + valueOfElement.user_name + ' /' + valueOfElement.user_login + ' /' + valueOfElement.user_password + ' /' + valueOfElement.user_email + ' /' + valueOfElement.user_type +'</li>';
        });
        $('.users-list').html(str);
      }
    });

  } // getuserList


});  // doc REady

</script>
</body>
</html>