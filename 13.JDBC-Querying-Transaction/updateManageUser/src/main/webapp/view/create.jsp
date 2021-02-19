<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 2/4/2021
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Create Form User</title>
</head>
<body>
<h2 class="text-center"> Create User</h2>
<p>
    <a href="/view">Back to list User</a>
</p>
<p class="text-success">
    ${mess}
</p>
<form action="/view?action=create" method="post">
    <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" name="name" class="form-control">
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email</label>
        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
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
