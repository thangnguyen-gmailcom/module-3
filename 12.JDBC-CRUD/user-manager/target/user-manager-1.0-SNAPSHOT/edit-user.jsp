<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 2/3/2021
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<h2>Edit User</h2>
<p>
    <a href="<c:url value="/"/>">Back</a>
</p>
<p class="text-success">${message}</p>
<form action="/editUser" method="post">
    <div class="form-group">
        <label>Name</label>
        <input type="text" name="name" value="${user.getName()}" class="form-control" placeholder="Enter name">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Email</label>
        <input type="email" name="email" value="${user.getEmail()}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Country</label>
        <input type="text" name="country" value="${user.getCountry()}" class="form-control" id="exampleInputPassword1">
    </div>
    <div class="form-group">
        <input type="hidden" name="id" value="${user.getId()}">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</body>
</html>
