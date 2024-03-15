<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">

  <h2>User Register Form</h2>
  <div class="col-md-6 col-md-offset-3">
    <div class="alert alert-success center" role="alert">
      <p>${NOTIFICATION}</p>
    </div>

    <form action="<%=request.getContextPath()%>/register" method="post">

      <div class="form-group">
        <label>First Name:</label> <input type="text" class="form-control" placeholder="First Name" name="firstName" required>
      </div>

      <div class="form-group">
        <label>Last Name:</label> <input type="text" class="form-control" placeholder="Last Name" name="lastName" required>
      </div>

      <div class="form-group">
        <label>Email:</label> <input type="text" class="form-control" placeholder="Email" name="email" required>
      </div>

      <div class="form-group">
        <label>Password:</label> <input type="password" class="form-control" placeholder="Password" name="password" required>
      </div>

      <button type="submit" class="btn btn-primary">Submit</button>

    </form>
    <a href="todo-list.jsp">
      <button type="submit" class="btn btn-primary">Return</button>
    </a>
  </div>
</div>
</body>
</html>
