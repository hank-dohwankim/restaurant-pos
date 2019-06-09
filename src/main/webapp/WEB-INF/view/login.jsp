<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
                pageEncoding="utf-8" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <html lang="en">
       <head></head>
       <body>
       <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
       <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
       <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

                <div class="row">
                   <h1 style="text-align: center">Login</h1>
                   <div style="width: 30%; margin: 25px auto;">
                       <form action="/login" method="post">
                           <div class="form-group">
                               <input class="form-control" type="text" name="username" placeholder="username">
                           </div>
                           <div class="form-group">
                               <input class="form-control" type="password" name="password" placeholder="password">
                           </div>
                           <div class="form-group">
                               <button class="btn btn-lg btn-primary btn-block">Login</button>
                           </div>
                       </form>
                       <a href="/campgrounds">Go Back</a>
                   </div>
                </div>
           </body>
       </html>>