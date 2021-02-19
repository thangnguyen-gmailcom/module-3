<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 2/3/2021
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title>Create Users</title>
</head>
<body>
<h2>Create user</h2>
<p>
    <a href='<c:url value="/" />'>Back</a>
</p>

<p>
    <span class="text-success">${message}</span>
</p>
<form action="/createUser"  method="post">
    <div class="form-group">
        <label >Name</label>
        <input type="text" name="name" class="form-control" placeholder="Enter name">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Email</label>
        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Country</label>
        <input type="text" name="country" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>
