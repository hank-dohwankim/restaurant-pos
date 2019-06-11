<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
                pageEncoding="utf-8" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <html lang="en">
       <head>
           <title>Restaurant Web Order System</title>
           <meta charset="utf-8">
           <meta name="viewport" content="width=device-width, initial-scale=1">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

               <style>
                    #order_detail_no {width: 200px;}
                    #menu_name {width: 200px;}
                    #order_detail_no {width: 200px;}
                    table {text-align: center; border: 1px solid #dddddd}
                    thead {background-color: #fafafa; text-align: center;}
               </style>
       </head>
       <body>
        <br>
     <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/terminal.do">Terminal</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/order.do">Kitchen</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ledge.do">Ledge<span class="sr-only">(current)</span></a>
                            </li>
                            <c:if test="${sessionScope.user.user_type == 'admin'}">
                            <li class="active"><a class="nav-link" href="/user.do">User</a></li>
                            <li><a class="nav-link" href="/menu.do">Menu</a></li>
                            </c:if>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">

                            <c:if test="${not empty sessionScope.user.user_login}">
                                <li class="active"><a class="nav-link" href="#"><c:out value="${sessionScope.user.user_login}"/></a></li>
                                <li><a class="nav-link" href="/logout">Sign out</a></li>
                            </c:if>
                        </ul>
            </nav>
        <br>

           <h2>User List Page</h2>
           <hr/>
    <container>
      <div style="display:inline">
    <table class="new" style="text-align: center; border: 1px solid #dddddd">
        <tr>
            <td>Add New User : </td>
            <td><input type="text" placeholder="user_name" name="user_name" value="" /></td>
            <td><input type="text" placeholder="user_ID" name="user_login" value="" /></td>
            <td><input type="text" placeholder="user_password" name="user_password" value="" /></td>
            <td><input type="text" placeholder="user_email" name="user_email" value="" /></td>
            <td>
                 <select name="user_type">
                      <option value="">User Type</option>
                      <option value="admin">Admin</option>
                      <option value="waiter">Waiter</option>
                      <option value="chef">Chef</option>                                                                  
                  </select>
            </td>
            <td>
              <button class="btn btn-primary" id="btn-user-save">Add User</button>
            </td>
        </tr>
    </table>
    <hr/>
    <table class="table" style="text-align: center; border: 1px solid #dddddd">
        <thead>
          <tr>
            <th style="background-color: #fafafa; text-align: center;">User No.</th>
            <th style="background-color: #fafafa; text-align: center;">User Name</th>
            <th style="background-color: #fafafa; text-align: center;">User ID</th>
            <th style="background-color: #fafafa; text-align: center;">User Password</th>
            <th style="background-color: #fafafa; text-align: center;">User E-mail</th>
            <th style="background-color: #fafafa; text-align: center;">User Type</th>
          </tr>
        </thead>
        <tbody id="users-table">
        <c:forEach items="${userList}" var="demo">
          <tr class = "userTr">  
            <td data-id="${demo.user_id}">${demo.user_id}</td>
            <td data-id="${demo.user_id}">${demo.user_name}</td>
            <td data-id="${demo.user_id}">${demo.user_login}</td>
            <td data-id="${demo.user_id}">${demo.user_password}</td>
            <td data-id="${demo.user_id}">${demo.user_email}</td>
            <td data-id="${demo.user_id}">${demo.user_type}</td>
          </c:forEach>
        </tr>
      </tbody>  
    </table>
   <%-- <h2>List user </h2>
    <ul class="users-list">
        <c:forEach items="${userList}" var="demo">
               <li data-id="${demo.user_id}">${demo.user_id} / ${demo.user_login} / ${demo.user_password} / ${demo.user_email} / ${demo.user_type} </li>
        </c:forEach>
   </ul> --%>
   <hr/>
    <div class="modify">
      <table>
        <tr>
               <td>Modification :  </td>
                <td>
                  <input style="width:150px" type="hidden" name="user_id" value=""/>
                <td><input style="width:150px" type="text" placeholder="user_name" name="user_name" value="" /></td>
                <td><input style="width:150px" type="text" placeholder="user_ID" name="user_login" value="" /></td>
                <td><input type="text" placeholder="user_password" name="user_password" value="" /></td>
                <td><input type="text" placeholder="user_email" name="user_email" value="" /></td>
                <td>
                 <select name="user_type">
                      <option value="">User Type</option>
                      <option value="admin">Admin</option>
                      <option value="waiter">Waiter</option>
                      <option value="chef">Chef</option>                                                                  
                  </select>
                 </td>
                <td>
                      <button class="btn btn-info" id="btn-user-save2">Change and save</button>
                      <button class="btn btn-danger" id="btn-user-delete">Delete</button>
                </td>
            </tr>
        </table>
        </div>

   <hr/>

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>
$(function(){
	$(".userTr").click(function(){
		var id = $(this).find("td")[0];
    var name = $(this).find("td")[1];
		var login = $(this).find("td")[2];
		var password = $(this).find("td")[3];
		var email = $(this).find("td")[4];
		var type = $(this).find("td")[5];
        $('.modify [name="user_id"]').val($(id).text());
        // $('.modify [name="user_name"]').val($(login).attr("data"));
        $('.modify [name="user_name"]').val($(name).text());
        $('.modify [name="user_login"]').val($(login).text());
        $('.modify [name="user_password"]').val($(password).text());
        $('.modify [name="user_email"]').val($(email).text());
        $('.modify [name="user_type"]').val($(type).text());
	})
})

$(document).ready(function () {

  $('[name="user_name"]').val();
  $('[name="user_login"]').val();
  $('[name="user_password"]').val();
  $('[name="user_email"]').val();
  $('[name="user_type"]').val();

  $('#btn-user-save').on('click', function() {

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
  $('#btn-user-save2').on('click', function() {

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
  $('#btn-user-delete').on('click', function() {
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
        debugger
        $.each(response, function (indexInArray, valueOfElement) {
            str += '<tr>';
            str += '    <td>' + valueOfElement.user_id + '</td>';
            str += '    <td>' + valueOfElement.user_name + '</td>';
            str += '    <td>' + valueOfElement.user_login + '</td>';
            str += '    <td>' + valueOfElement.user_password + '</td>';
            str += '    <td>' + valueOfElement.user_email + '</td>';
            str += '    <td>' + valueOfElement.user_type + '</td>';
            str += '<tr>';
        });
        $('.table > tbody').html(str);
        // location.href = "/user.do";
      }
    });
  } // getuserList


});  // doc REady

</script>
</body>
</html>