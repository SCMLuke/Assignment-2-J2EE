<%--
  Created by IntelliJ IDEA.
  User: somec
  Date: 2024-03-13
  Time: 1:29 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>Order success! You will receive an email shortly with the details.</h1>
<a href="todo-list.jsp">
    <button type="submit" class="btn btn-primary">Store</button>
</a>
</body>
</html>
