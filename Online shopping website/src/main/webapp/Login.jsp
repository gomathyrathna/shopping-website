<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Marcellus&display=swap" rel="stylesheet">
    
<meta charset="UTF-8">
<title>Laptop Store-Login</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="loginstyle.css">
<style type="text/css">
body{
background:linear-gradient(to right,#2C3E50,#FD746C);
}
#msg{
  color:white;
  text-align: center;
  display:none; 
}
</style>

</head>
<body>

	<div class="navbar">

		
			<h4>Laptop store</h4>
			
		</div>
		
		
		
		

	<div class="container">
		<form action="LoginAction.jsp" method="post">
		
			<h2>LOGIN</h2>
			<label for="email">Email</label> 
			<input type="text" id="email" name="email" title = "enter valid email"  required> 
			<p id = "msg" style="margin-left:30px;">Enter a valid Email</p>
		    
			<label for="psw">Password</label>
			<input type="password" id="psw" name="psw" required> 
			<input id = "submit" type="submit" value="Login">
		</form>
		
		 <p>New Member-<a href="Register.jsp" style="color:white;">Register</a></p>
	</div>
	<div class="whysignlogin">
		<%
    String msg=request.getParameter("msg");
    if("notexist".equals(msg)){
    	%>
		<h1 style="margin-left:50px;">Incorrect Username and password</h1>
		<% }
    %>
		<%if("invalid".equals(msg)){
    	%>
		<h1>Something went wrong.</h1>
		<%} %>

	</div>
	<script type="text/javascript" src = "Login.js"></script>
</body>
</html>