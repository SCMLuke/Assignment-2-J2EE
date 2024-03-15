<%@ page import="logged.LoginManager" %><%--
  Created by IntelliJ IDEA.
  User: somec
  Date: 3/12/2024
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: darkslateblue">
        <div>
            <a href="todo-list.jsp" class="navbar-brand"> Oldies Technology Shop</a>
        </div>

        <ul class="navbar-nav navbar-collapse justify-content-end">
            <% if (LoginManager.getLoggedIn() == 0) { %>
                <li><a href="<%= request.getContextPath() %>/login" class="nav-link">Login</a></li>
                <li><a href="<%= request.getContextPath() %>/register" class="nav-link">Signup</a></li>
            <% } else { %>
            <li><a href="<%= request.getContextPath() %>/logout" class="nav-link">Logout</a></li>
            <% } %>
        </ul>
    </nav>
</header>
</body>
</html>
