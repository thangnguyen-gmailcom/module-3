<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codegym.thang.Customer" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</body>
</html>
