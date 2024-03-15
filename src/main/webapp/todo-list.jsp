<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="logged.LoginManager" %>
<%@ page import="dao.ItemDao" %>
<%@ page import="dao.ItemDaoImpl" %>
<%@ page import="model.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Store</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <style>
        .card {
            border-radius: 16px;
            padding: 12px;
            margin: 12px;
            color: dimgrey;
        }
        .buttonLink {
            margin: auto;
        }
    </style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container mt-5">



    <%
        ItemDao itemDao = new ItemDaoImpl();
        List<Item> allItems = itemDao.selectAllItems();
        for (Item item : allItems) {
    %>



    <div class="card">
        <h1>
            <%= item.getItemName() %>
        </h1>
        <p>
            <%= item.getItemDescription() %>
        </p>
        <h2>Rating: <%= item.getItemRating() %>  |  Stock: <%= item.getItemStock() %></h2>
        <% if (LoginManager.getLoggedIn() == 1 && item.getItemStock() > 0) { %>
        <a class="buttonLink" href="order.jsp?itemName=<%= item.getItemName() %>&itemDescription=<%= java.net.URLEncoder.encode(item.getItemDescription(), "UTF-8") %>&itemRating=<%= item.getItemRating() %>&itemStock=<%= item.getItemStock() %>&itemId=<%= item.getItemNumber() %>">
            <button>Order</button>
        </a>
        <% } %>
    </div>



    <% } if (allItems.isEmpty()) { %>
    <h1>
        Nothing Found
    </h1>
    <% } %>
</div>



</body>
</html>
