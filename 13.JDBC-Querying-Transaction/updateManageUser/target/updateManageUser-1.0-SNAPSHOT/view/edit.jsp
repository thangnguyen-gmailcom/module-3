<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 2/4/2021
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Edit User Form</title>
</head>
<body>
<h2>Edit User</h2>
<form action="/view?action=edit" method="post">
    <input type="hidden" name="id" value="${user.getId()}">
    <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" name="name" value="${user.getName()}" class="form-control">
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email</label>
        <input type="email" name="email" value="${user.getEmail()}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <select class="form-select form-select-lg mb-3" name="countryName" aria-label=".form-select-lg example">
        <c:forEach var="country" items="${countrys}">
            <option value="${country.getId()}">${country.getCountryName()}</option>
        </c:forEach>
    </select>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>
