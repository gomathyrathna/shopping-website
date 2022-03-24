<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>
<%
String email = session.getAttribute("email").toString();
%>

<!DOCTYPE html>
<html>
<head>
	<title>Laptop Store-Cart</title>
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<link rel="stylesheet"  href="styleCart.css">
		
		
<style>
.button
{
margin-top: 30px; margin-bottom: 30px;
}

.button:hover{
background:#B8D7FF
}
</style>
</head>
<body>





	<div class="navbar">
      <h3 style="font-size: 3.5rem;
	 font-family: 'Cookie', cursive; 
	 color:black;">Laptop store</h3>
	 
		
		<nav>
			<ul>
				<li><a href="Home.jsp">Home</a></li>
				<li><a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a></li>				
			</ul>
		</nav>
	</div>
	
	<div class="Header">
   	   	<h3 class="Heading">Shopping Cart</h3>
   	   	
   	   </div>
	
	
	<%
String msg=request.getParameter("msg");
if("notpossible".equals(msg)){
	%>
	<h3 class="alert">There is only one Quantity! So click on remove!</h3>
	<% 
}
%>
<%
if("inc".equals(msg)){
	%>
	<h3 class="alert">Quantity  Increased Successfully!</h3>
	<% 
}
%>
<%
if("dec".equals(msg)){
	%>
	<h3 class="alert">Quantity  Decreased Successfully!</h3>
	<% 
}
%>
<%
if("removed".equals(msg)){
	%>
	<h3 class="alert">Product Successfully Removed!</h3>
	<% 
}
%>


<%
int total=0;
int seNumber=0;
int items=0;
try{
	Connection connect = MySqlConnect.getConnection();
	Statement st = connect.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" +email+ "' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
		
	}

%>
<%
   ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
   while(rs.next()){
   		items=items + rs.getInt(9) ;
   
	   %>
   
   
   <div class="CartContainer">
   	   
   	   <div class="Cart-Items">
   	   	 
   	   	  <div class="about">
   	   	  	<p class="title"><%=rs.getString(2) %></p>
   	   	  	<p class="category">category : <%=rs.getString(3) %></p>
   	   	  	<p class="product-id">product id : <%=rs.getInt(1) %></p>
   	   	  	
   	   	  </div>
   	   	  <div class="counter">
   	   	  	<div class="btn"><a href="quantityAction.jsp?id=<%=rs.getInt(1)%>&quantity=inc">+</a></div>
   	   	  	<div class="count"><%=rs.getInt(9) %></div>
   	   	  	<div class="btn"><a href="quantityAction.jsp?id=<%=rs.getInt(1)%>&quantity=dec">-</a></div>
   	   	  </div>
   	   	  <div class="prices">
   	   	  	<div class="amount">Price: <%=rs.getInt(4) %></div>
   	   	  	<div class="remove"><a href="removeFromCart.jsp?id=<%=rs.getInt(1)%>"><u>Remove</u></a></div>
   	   	  </div>
   	   </div>

   	   <%
   }
   
   	   %>
   	   
   	 <hr> 
   	 <div class="checkout">
   	 <div class="total">
   	 	<div>
   	 		<div class="Subtotal">Sub-Total</div>
   	 		<div class="items"> <%=items%>items</div>
   	 	</div>
   	 	<div class="total-amount"><%out.println(total); %></div>
   	 </div>
   	 <%if(total>0){%>
   	 <a href="payment.jsp"><button class="button">Checkout</button></a></div>
   	 </div>
   	 <% }%>
   	 
  <% 
}
   catch(Exception e){
	   System.out.println(e);
	   
   }
   %>
   
</body>
</html>