<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Laptop Store-Categories</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="home.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Marcellus&display=swap" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
<% String email = session.getAttribute("email").toString();%>
<div class="navbar">
	<h3 style="font-size: 3.5rem; color:black; font-family: 'Cookie', cursive; color:black;">Laptop store</h3>
			
			<nav>
				<ul>
					<li><a href="Cart.jsp">Cart</a></li>
					
					<li>
						<%
						out.println(email);
						%>
					</li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>
			
		</div>
<div class="all-products">
<%
String category = request.getParameter("id");
 %>
		<h1 style="text-align:center; margin-top:50px;">All Products</h1>
		<br>
		<br>
		<%
		try {
			Connection connect = MySqlConnect.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery("select * from onlineshopping.product where catagory ='"+ category +"'");
			while (rs.next()) {
		%>
		<div class="box">
			<div class="image">
				<img src="images/<%=rs.getString(5)%>" alt="">
				<div class="icons">
					<a href="#" class="fas fa-heart"></a> <a
						href="addToCartAction.jsp?id=<%=rs.getString(1)%>"
						class="cart-btn">add to cart</a> <a href="#" class="fas fa-share"></a>
				</div>

			</div>
			<div class="content">
				<h3><%=rs.getString(2)%></h3>
				<div class="price">
					price: Rs-<%=rs.getInt(4)%>
				</div>
				<div class="catagory">
					catagory:<%=rs.getString(3)%></div>
				<div class="product-id">
					product id:
					<%=rs.getInt(1)%></div>

			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>


	</div>

</body>
</html>