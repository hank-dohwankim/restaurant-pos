<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
 <head>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
 </head>
 <style>
      table {text-align: center; border: 1px solid #dddddd}
      thead {background-color: #fafafa; text-align: center;}
 </style>
 </head>
 <body>

    <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="/terminal.do">Restaurant Web POS System</a>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/terminal.do">Terminal</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/order.do">Kitchen</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/ledge.do">Check Out</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="nav-link" href="/user.do">User</a></li>
                        <li><a class="nav-link active" href="/menu.do">Menu</a></li>
                    </ul>
            </nav>
        <br>

  <h1>Menu Management</h1>
  <hr/>
    <table class="new" style="text-align: center; border: 1px solid #dddddd">
        <tr>
            <td>Add New Menu : </td>
            <td><input type="text" placeholder="menu_name" name="menu_name" value="" /></td>
            <td><input type="text" placeholder="menu_price" name="menu_price" value="" /></td>
            <td><input type="text" placeholder="cooking_time" name="cooking_time" value="" /></td>
            <td>
              <button class="btn btn-primary" id="btn-menu-save">Add User</button>
            </td>
        </tr>
    </table>

   <hr/>
   
     <table class="table" style="text-align: center; border: 1px solid #dddddd">
        <thead>
          <tr>
            <th style="background-color: #fafafa; text-align: center;">Menu No.</th>
            <th style="background-color: #fafafa; text-align: center;">Menu Name</th>
            <th style="background-color: #fafafa; text-align: center;">Menu Price</th>
            <th style="background-color: #fafafa; text-align: center;">Cooking Time</th>
          </tr>
        </thead>
        <tbody id="menus-table">
        <c:forEach items="${menuList}" var="demo">
          <tr class = "menuTr">  
            <td data-id="${demo.menu_id}">${demo.menu_id}</td>
            <td data-id="${demo.menu_id}">${demo.menu_name}</td>
            <td data-id="${demo.menu_id}">${demo.menu_price}</td>
            <td data-id="${demo.menu_id}">${demo.cooking_time}</td>
        </tr>
        </c:forEach>
      </tbody>  
    </table>
    <hr/>
   <div class="modify">
      <table>
        <tr>
               <td>Modification :  </td>
                <td>
                  <input style="width:150px" type="hidden" name="menu_id" value=""/>
                <td><input type="text" placeholder="menu_name" name="menu_name" value="" /></td>
                <td><input type="text" placeholder="menu_price" name="menu_price" value="" /></td>
                <td><input type="text" placeholder="cooking_time" name="cooking_time" value="" /></td>
                <td>
                      <button class="btn btn-info" id="btn-menu-save2">Change and save</button>
                      <button class="btn btn-danger" id="btn-menu-delete">Delete</button>
                </td>
            </tr>
        </table>
        </div>

   <hr/>

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>
$(function(){
	$(".menuTr").click(function(){
		var id = $(this).find("td")[0];
    var name = $(this).find("td")[1];
    var price = $(this).find("td")[2];
		var time = $(this).find("td")[3];

        $('.modify [name="menu_id"]').val($(id).text());
        $('.modify [name="menu_name"]').val($(name).text());
        $('.modify [name="menu_price"]').val($(price).text());
        $('.modify [name="cooking_time"]').val($(time).text());
	})
})

$(document).ready(function () {

  $('[name="menu_name"]').val();
  $('[name="menu_price"]').val();
  $('[name="cooking_time"]').val();

  // 신규 저장 버튼 이벤트
  $('#btn-menu-save').on('click', function() {

    var dataObj = {
      menu_name: $('[name="menu_name"]').val(),
      menu_price: $('[name="menu_price"]').val(),
      cooking_time: $('[name="cooking_time"]').val()
      };

      debugger  

    $.ajax({
      type: "POST",
      url: "./menus",
      data: dataObj,
      dataType: "json",  // return
      success: function (response) {
        alert('Registered');
        getmenuList();
      }
    });
  }); // 신규 저장 버튼 이벤트


  // // 1건 조회
  // $(document).on('click','li', function() {
  // // $('li').on('click', function() {
  //   console.log($(this).data('id'));

  //   $.ajax({
  //     url: "./menus/" + $(this).data('id') ,
  //     // data: "data",  // url?id=1
  //     dataType: "json",  // return type
  //     success: function (response) {
  //       $('.modify [name="menu_id"]').val(response.menu_id);
  //       $('.modify [name="menu_name"]').val(response.menu_name);
  //       $('.modify [name="menu_price"]').val(response.menu_price);
  //       $('.modify [name="cooking_time"]').val(response.cooking_time);
  //     }
  //   });
  // });

  // 수정
  $('#btn-menu-save2').on('click', function() {

    var obj = {
        "menu_id": $('.modify [name="menu_id"]').val(),
        "menu_name": $('.modify [name="menu_name"]').val(),
        "menu_price": $('.modify [name="menu_price"]').val(),
        "cooking_time": $('.modify [name="cooking_time"]').val()
    };

    $.ajax({
      type: "PUT",
      url: "./menus/" + $('.modify [name="menu_id"]').val(),
      data: JSON.stringify(obj),
      contentType: 'application/json',
      dataType: "json", // return type
      success: function (response) {
        debugger
        alert('Modified');
        getmenuList();
      }
    });
  });


  // 삭제
  $('#btn-menu-delete').on('click', function() {
    $.ajax({
      type: "DELETE",
      url: "./menus/" + $('.modify [name="menu_id"]').val(),
      contentType: 'application/json',
      dataType: "json",
      success: function (response) {
        alert('Deleted');
        getmenuList();
      }
    });
  })

  function getmenuList() {
    var str = '';
    $.ajax({
      url: "./menus",
      dataType: "json",  // return type
      success: function (response) {
        // $.each(response, function (indexInArray, valueOfElement) {
        //     str += '<li data-id="'+ valueOfElement.menu_id + '"> ' + valueOfElement.menu_id + ' / ' + valueOfElement.menu_name + ' / ' + valueOfElement.menu_price + ' / ' + valueOfElement.cooking_time + '</li>';
        // });
        // $('.menus-list').html(str);
      location.href = "/menu.do";

      }
    });
  } // getmenuList
});  // doc REady

</script>
</body>
</html>