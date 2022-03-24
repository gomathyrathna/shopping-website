<%@page import="database.MySqlConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Laptop Store-admin</title>

<style>
table {
  
  width: 50%;
  margin-left:25%;
}

td,th {
  border: 0.5px solid #ddd;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2;}



th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color:#ccc;
  color: black;
}

.alert
{

	text-align: center;
}
</style>
</head>
<body>
<div style="text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<br>
<table>
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">Name</th>
<th scope="col">Category</th>
<th scope="col"><i class="fa fa-inr"></i> Price</th>
<th scope="col">Quantity</th>
<th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
</tr>
</thead>
<tbody>
<%
	   try{
		   Connection connect=MySqlConnect.getConnection();
		   Statement st=connect.createStatement();
		   ResultSet rs=st.executeQuery("select * from product");
		   while(rs.next())
		   {
	   %>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
<td><%=rs.getString(6)%></td>
<td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
</tr>
<%
		   }
	   }
	   catch(Exception e){
		System.out.println(e);
	   }
	   %>
</tbody>
</table>
<br>
<br>
<br>

</body>
</html>
