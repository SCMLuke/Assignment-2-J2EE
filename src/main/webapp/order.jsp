<%@ page import="dao.ItemDao" %>
<%@ page import="dao.ItemDaoImpl" %>
<%@ page import="model.Item" %>
<%@ page import="logged.LoginManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Debugging code to check if itemId is received correctly
    int test = Integer.parseInt(request.getParameter("itemId"));
    System.out.println("itemId received: " + test);
%>
<%
    if(request.getMethod().equals("POST")) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String itemName = request.getParameter("itemName");
        String itemDescription = request.getParameter("itemDescription");
        double itemRating = Double.parseDouble(request.getParameter("itemRating"));
        int itemStock = Integer.parseInt(request.getParameter("itemStock"));

        int newStock = itemStock - 1;

        ItemDao itemDao = new ItemDaoImpl();

        Item existingItem = itemDao.selectItem(itemId);

        if (existingItem != null) {
            existingItem.setItemStock(newStock);
            System.out.println(existingItem.getItemStock());
            System.out.println(existingItem.getItemName());
            System.out.println(existingItem.getItemDescription());
            System.out.println(existingItem.getItemRating());
            System.out.println(existingItem.getItemNumber());
            try {
                itemDao.updateItem(existingItem);
                response.sendRedirect("order-success.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Error: Item not found");
        }
    }
%>

<html>
<head>
    <title>Title</title>
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
        .container {
            border-radius: 16px;
            margin: 24px;
        }
    </style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
    String itemName = request.getParameter("itemName");
    String itemDescription = request.getParameter("itemDescription");
    double itemRating = Double.parseDouble(request.getParameter("itemRating"));
    int itemStock = Integer.parseInt(request.getParameter("itemStock"));
%>

<div class="card">
    <h1><%= itemName %></h1>
    <p><%= itemDescription %></p>
    <h2>Rating: <%= itemRating %> | Stock: <%= itemStock %></h2>
</div>

<div>

    <h2>Enter Your Shipping Details</h2>
        </div>
    <div class="container">
        <form method="post">
            <input type="hidden" name="itemId" value="<%= request.getParameter("itemId") %>">

            <div class="form-group">
                <label>First Name:</label> <input type="text" class="form-control" placeholder="First Name" name="firstName" required>
            </div>

            <div class="form-group">
                <label>Last Name:</label> <input type="text" class="form-control" placeholder="Last Name" name="lastName" required>
            </div>

            <div class="form-group">
                <label>Address:</label> <input type="text" class="form-control" placeholder="Address" name="address" required>
            </div>

            <div class="form-group">
                <label>City:</label> <input type="text" class="form-control" placeholder="City" name="city" required>
            </div>

            <div class="form-group">
                <label>Postal Code:</label> <input type="text" class="form-control" placeholder="Postal Code" name="postalCode" required>
            </div>

            <div class="form-group">
                <label>Phone:</label> <input type="number" class="form-control" placeholder="Phone" name="phone" required>
            </div>

            <div class="form-group">
                <label>Email:</label> <input type="text" class="form-control" placeholder="Email" name="email" required>
            </div>

                <button type="submit" class="btn btn-primary">Order item</button>
        </form>



    </div>

    </div>
</div>

</body>
</html>
