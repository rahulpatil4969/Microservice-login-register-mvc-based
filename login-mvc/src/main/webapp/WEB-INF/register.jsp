<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="./base.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<div class="col-md-6 offset-md-3">
<h1 class="text-center-mb-3">Registration Page</h1>
<form action="/set-user" method="post">

  <div class="form-group">
    <label for="name">Enter User Name</label>
    <input type="text" class="form-control" id="userName" name="userName"
    placeholder="here User Name">
  </div>
  
  <div class="form-group">
    <label for="description">Enter Password</label>
    <input type="password" class="form-control" id="password1" name="password1" rows="3"
    placeholder="Enter password">
  </div>
  
<div class="form-group">
    <label for="description">Re-Enter Password</label>
    <input type="password" class="form-control" id="password2" name="password2" rows="3"
    placeholder="Enter password">
  </div>
  
    <c:if test="${not empty registerError}">
   <hr>
   <div><h3 style="color:red"> ${registerError}</h3></div>
   <hr>
   </c:if>
   
  <button type="submit" class="btn btn-primary">Register</button>
  
   
</form>
</div>
</body>
</html>