<%@page import="database.MySqlConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>


<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
<style>

.left-div
{
	width: 50%;
	display:inline-block;
	margin-top:20px;
}

.right-div
{
	float:right;
	width: 50%;
	display:inline-block;
	
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
</style>
</head>
<body>
<h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%  
String id=request.getParameter("id");
try{
	Connection connect=MySqlConnect.getConnection();
	Statement st=connect.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
	while(rs.next()){	

%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="left-div">
<h3> Enter Name</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>
<hr>
</div>

<div class="right-div">
<h3> Enter Category</h3>
<input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>

</div>

<div class="left-div" style="margin-top:2%;">
<h3> Enter Price</h3>
<input class="input-style" type="number" name="price" value="<%=rs.getInt(4)%>" required>
<hr style="width:100%;">
</div>

<div class="left-div">
<h3> Enter Quantity</h3>
<input class="input-style" type="number" name="quantity" value="<%=rs.getInt(6)%>" required>
</div>
<button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>

</body>
<br><br><br>
</body>
</html>
