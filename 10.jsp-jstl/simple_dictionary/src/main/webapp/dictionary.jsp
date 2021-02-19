<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 1/28/2021
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    Map<String, String> dic = new HashMap<>();
%>
<%
    dic.put("hello", "Xin Chao");
    dic.put("book", "Quyen Vo");
    dic.put("computer", "May Tinhs");
    String search = request.getParameter("txtWord");
    String result = dic.get(search);
    if (result != null) {
        out.println("Word :" + search);
        out.println("Result :" + result);
    } else {
        out.println("not found !");
    }
%>
</body>
</html>
