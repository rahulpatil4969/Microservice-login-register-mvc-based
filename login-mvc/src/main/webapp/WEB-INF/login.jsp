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
<h1 class="text-center-mb-3">Login Page</h1>
<form action="/login" method="post">

	<c:if test="${not empty registerSuccess}">
   	<hr>
   	<div><h3 style="color:green"> ${registerSuccess}</h3></div>
   	<hr>
   	</c:if>
   
  <div class="form-group">
    <label for="name">Enter User Name</label>
    <input type="text" class="form-control" id="userName" name="userName"
    placeholder="here User Name">
  </div>
  
  <div class="form-group">
    <label for="description">Enter Password</label>
    <input type="password" class="form-control" id="password" name="password" rows="3"
    placeholder="Enter password">
  </div>
   <button type="submit" class="btn btn-success">Login</button>
   <br><br>
   <c:if test="${not empty error}">
   <hr>
   <div><h3 style="color:red"> ${error}</h3></div>
   <hr>
   </c:if>
  <button type="button" class="btn btn-primary" onclick="goToRegister()">Register</button>
</form>
</div>

<script type="text/javaScript">
	function goToRegister(){
	
		window.location.href="/register";
	}

</script>
</body>
</html>