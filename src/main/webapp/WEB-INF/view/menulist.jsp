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
                            <li><a class="nav-link" href="/user.do">User</a></li>
                            <li class="active"><a class="nav-link" href="/menu.do">Menu</a></li>
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

           <h2>Menu List Page</h2>
           <hr/>
  <hr/>
    <table class="new" style="text-align: center; border: 1px solid #dddddd">
        <tr>
            <td>Add New Menu : </td>
            <td><input type="text" placeholder="menu_name" name="menu_name" value="" /></td>
            <td><input type="text" placeholder="menu_price" name="menu_price" value="" /></td>
            <td><input type="text" placeholder="cooking_time" name="cooking_time" value="" /></td>
            <td>
              <button class="btn btn-primary" id="btn-menu-save">Add Menu</button>
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

  // ADD NEW BUTTON EVENT
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
  }); // ADD NEW BUTTON EVENT


  // // CHECK BY ID
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

  // MODIFY
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


  // DELETE
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
        debugger
        $.each(response, function (indexInArray, valueOfElement) {
            str += '<tr>';
            str += '    <td>' + valueOfElement.menu_id + '</td>';
            str += '    <td>' + valueOfElement.menu_name + '</td>';
            str += '    <td>' + valueOfElement.menu_price + '</td>';
            str += '    <td>' + valueOfElement.cooking_time + '</td>';
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