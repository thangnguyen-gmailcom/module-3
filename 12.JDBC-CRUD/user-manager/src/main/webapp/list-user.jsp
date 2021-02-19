<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 2/3/2021
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title>List User</title>
</head>
<h2 class="text-center">List User</h2>
<p>
    <a href="/createUser">Create User</a>
</p>
<nav class="navbar navbar-light bg-light">
    <form class="form-inline" action="/findByCountry" method="get">
        <input class="form-control mr-sm-2" name="country" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Country</th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <th scope="row">${user.getId()}</th>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="/editUser?id=${user.getId()}">Edit</a></td>
            <td><a href="/deleteUser?id=${user.getId()}" onclick="return confirm('Mi Muon xoa khong')">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>
    <a href="/sortUser">Sort User</a>
</p>
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="?page=${back}" >Previous</a></li>
        <c:forEach begin="${start}" end="${end}" var="i">
            <li class="page-item"><a class="page-link" href="?page=${i}">${i}</a></li>
        </c:forEach>
        <c:if test="${isDotDot}">
            <button type="button" class="page-link">...</button>
        </c:if>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
    </ul>
</nav>
</body>
</html>
