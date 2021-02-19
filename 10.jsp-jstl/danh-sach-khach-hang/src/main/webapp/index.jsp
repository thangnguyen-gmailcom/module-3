<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codegym.thang.Customer" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
<%
    ArrayList<Customer> listCustomer = new ArrayList<>();
    listCustomer.add(new Customer("Mai Van Hoan",Date.valueOf("1994-07-29"),"Ha Noi", "https://robohash.org/ackbascb?size=100x100"));
    listCustomer.add(new Customer("Nguyen Van Nam",Date.valueOf("1983-8-2"), "Bac Giang", "https://robohash.org/xcvxcvxcv?size=100x100"));
    listCustomer.add(new Customer("Nguyen Thai Hoa",Date.valueOf("1983-8-2"), "Bac Giang", "https://robohash.org/xcvxcvxcv?size=100x100"));
    listCustomer.add(new Customer("Tran Dang Khoa",Date.valueOf("1983-8-2"), "Bac Giang", "https://robohash.org/xcvxcvxcv?size=100x100"));
    listCustomer.add(new Customer("Nguyen Dinh Thi",Date.valueOf("1983-8-2"), "Bac Giang", "https://robohash.org/xcvxcvxcv?size=100x100"));
%>
<div class="container">
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
    </tr>

<c:forEach items="<%=listCustomer%>" var="txt">
    <tr>
        <td>${txt.name}</td>
        <td>${txt.dayOfBirth}</td>
        <td>${txt.address}</td>
        <td><img src="${txt.image}"></td>
    </tr>
</c:forEach>
</table>
</div>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
