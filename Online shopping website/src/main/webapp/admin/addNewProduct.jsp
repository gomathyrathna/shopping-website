<%@page import="database.MySqlConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>

<html>
<head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Laptop Store-admin</title>
<style>

.left-div
{
	width: 50%;
	display:inline-block;
	margin-top:50px;
}

.right-div
{
	float:right;
	width: 50%;
	display:inline-block;
	margin-top:50px;
}
.input-style
{
width:250px; 
height:30px;
border-radius:50px; 
border:none;"
}
.button
{
 width:300px; height:40px; border:none; margin-left:600px; margin-top:50px; background-color:black; color:white;
}
input-field[type=text], input[type=number]
{
	width:250px; 
	height:30px; 
	border-radius:50px; 
	border:none;
}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try
{
	Connection connect=MySqlConnect.getConnection();
	Statement st=connect.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while (rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{}

%>
<h3 style="text-align: center; font-size: 30px;">Add New Product <i class='fab fa-elementor'></i></h3>
<form action="addNewProductAction.jsp" method="post">

<h3 style="color: white; text-align:center;">Product ID: <%out.println(id);%></h3>
<input type="hidden" name="id" value="<%out.println(id);%>">


<div class="left-div">
<h3>Enter Name</h3>
<input class="input-style" type="text" name="name" placeholder=" Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style" type="text" name="category" placeholder=" Enter Category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" type="number" name="price" placeholder=" Enter Price"  required>
<hr>
</div>

<div class="right-div">
<h3>Enter Quantity</h3>
<input class="input-style" type="number" name="quantity" placeholder=" Enter Quantity"  required>
<hr>
</div>

<div class="left-div">
<h3>Enter image file</h3>
<input class="input-style" type="text" name="image" placeholder=" Enter image file" required>

</div>
<br>
<br>
<button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>
 