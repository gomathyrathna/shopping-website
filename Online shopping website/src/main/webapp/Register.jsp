<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="loginstyle.css">
<title>Register-Laptop Store</title>
<style type="text/css">
body{
background:linear-gradient(to right,#2C3E50,#FD746C);

}

</style>



<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Marcellus&display=swap" rel="stylesheet"> 
     
<link rel="stylesheet" href="style.css">

</head>
<body>
	<div class="navbar">
		
			<h4>Laptop store</h4>
		</div>
		
	<div class="container" style="background:transparent;">
		<form action ="RegisterAction.jsp">
			<h2>REGISTER</h2>
			<label for="usrname">Username</label> <input type="text" id="usrname" name="usrname" style="border-radius:50px; width:250px; height:30px;" required> 
				<label for="email">Email</label> 
				<input type="text" id="email" name="email" required>
				<label for="psw">Password</label>
			    <input type="password" id="psw" name="psw"required> 
			    <label for="c-psw"> Confirm Password</label> 
			    <input type="password" id="c-psw" name="c-psw" onchange="check()" required>
				<span id="msg"></span> 
				<input id="submit" type="submit" value="Submit">
		</form>
	</div>
	<div class="whyregister">
		<%
		String msg = request.getParameter("msg");
		if ("valid".equals(msg)) {
		%>
		<h1>Successfully Registered, Please <a href="Login.jsp" style="color:white">Login</a>.</h1>
		
		<%
		}
		%>
		<%
		if ("invalid".equals(msg)) {
		%>
		<h1>Something went wrong,User already exists.</h1>
		<%
		}
		%>
	</div>



	<script src="register.js"></script>
</body>
</html>