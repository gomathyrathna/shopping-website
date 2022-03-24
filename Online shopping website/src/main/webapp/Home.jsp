<%@ page import="java.sql.*"%>
<%@ page import="database.MySqlConnect"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Laptop Store-Home</title>
<link rel="stylesheet" href="home.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Marcellus&display=swap" rel="stylesheet"> 
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">


</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("added".equals(msg)) {
	%>
	<h3 class="alert">Product added successfully.</h3>

	<%
	}
	%>
	<%
	if ("exist".equals(msg)) {
	%>
	<h3 class="alert">Product already exist in the cart.Quantity
		increased.</h3>

	<%
	}
	%>

	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong.Try again.</h3>

	<%
	}
	%>
<% String email = session.getAttribute("email").toString();%>

	<div>
		<div class="navbar">
			
			<div class="navbar-brand">
		
			   <h3 style="font-size: 3.5rem; font-family: 'Cookie', cursive; color:black;">Laptop store</h3>
		    </div>
			<nav>
			
				<ul>
					<li><a href="Cart.jsp">Cart</a><i class='fas fa-cart-plus'></i></li>
					
					<li>
						<%
						out.println(email);
						%>
					</li>
					<li><a href="logout.jsp">Logout </a><i class='fas fa-share-square'></i></li>
				</ul>
			</nav>
			
		</div>
		<div class="row">
			
			<div>
				<img src="https://www.laptopstoreindia.com/image/cache/catalog/banners/slider2-1090x450-1090x450.jpg" style="background-size:contain;
    height:100vh;
    width:100%;">
			</div>
		</div>
	</div>
	<!-------catagories--------->

	<div class="catagories">
	
		<h2>Catagories</h2>
		<br>
		<br>
		<ul>
		
	<% 
	
						try{ 
							Connection connect = MySqlConnect.getConnection(); 
							Statement st = connect.createStatement(); 
							ResultSet rs1 = st.executeQuery("select distinct catagory from onlineshopping.product");
							while(rs1.next()){
			%> 
			               
							<li><a href="categories.jsp?id=<%=rs1.getString(1)%>"><%=rs1.getString(1)%></a></li>
							   <hr>
							     
		<%
					}
			}
					catch(Exception e){
						System.out.println(e);
					}
			
			%>
			</ul>


	</div>
	<!-------popular products--------->
	<div class="pop-products" style="margin-left:80px;">
		<h2>All Products</h2>
		<br>
		<br>
		<%
		try {
			Connection connect = MySqlConnect.getConnection();
			Statement st = connect.createStatement();
			ResultSet rs = st.executeQuery("select * from onlineshopping.product where quantity!=0");
			while (rs.next()) {
		%>
		<div class="box">
			<div class="image">
				<img src="images/<%=rs.getString(5)%>" alt="">
				
			</div>
			<div class="content">
				<h3><%=rs.getString(2)%></h3>
				<div class="price">
					Price: Rs-<%=rs.getInt(4)%>
				</div>
				<div class="catagory">
					Catagory:<%=rs.getString(3)%></div>
				<div class="product-id">
					Product id:
					<%=rs.getInt(1)%></div>

			</div>
			<div class="icons">
						<a href="addToCartAction.jsp?id=<%=rs.getString(1)%>"
						class="cart-btn">Add to cart</a>
				</div>
			
		</div>
		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>


	</div>

<section class="Contactus">
  <div class="contactcontainer" style="background:linear-gradient(to right,#abbaab,#ffffff);color:black;
    margin-top:50px;
    margin-bottom:50px;
  ">
    <div class="row py-5">
      <div class="col-lg-5 m-auto text-center">
        <h2 style="font-family: 'Marcellus', serif;">Contact Us</h2>
      </div>
    </div>
    <div class="row py-5">
      <div class="col-lg-9 m-auto">
         <div class="row">
            <div class="col-lg-4 m-auto">
              <h6>EMAIL</h6>
              <p>smijask@gmail.com</p>
              </div>
              <div class="col-lg-4 m-auto">
              <h6>PHONE</h6>
              <p>1234567890</p>
              </div>
              <div class="col-lg-4 m-auto">
                <h6>LOCATION</h6>
                <p> Los Angeles 0911 First Street DC</p>
            </div>
      </div>
    </div>
  </div>
</div>
</section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>