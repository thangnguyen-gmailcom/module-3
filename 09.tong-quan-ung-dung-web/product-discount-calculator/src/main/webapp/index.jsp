<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 1/28/2021
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Product Discount Calculator</title>
</head>
<body>
    <h1> Product Discount Calculator</h1>
    <form action = "/display-discount" method = "post">
        <p>Product Description :</p>
        <input type="text" name="txtDesc">
        <br>
        <p>List Price :</p>
        <input type="text" name="txtPrice">
        <br>
        <p>Discount Percent :</p>
        <input type="text" name="txtDiscount">
        <br>
        <input type="submit" value="Calculator">
    </form>
</body>
</html>
