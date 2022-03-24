<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>

<style>


a{
    text-decoration: none;
    color: black;
}
body{
background:linear-gradient(to right,#abbaab,#ffffff);
}
nav ul li{
    display: inline-block;
    margin-right: 20px;
} 
</style>





<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <% String email=session.getAttribute("email").toString(); %>
        <div class="navbar">
          <div class="navbar-brand">
            <h3 style="font-family:'Cookie', cursive; font-size:3rem;">Laptop Store</h3>
          </div>
            <nav style=" margin-top:-5%;text-align: right;">
            <ul>
            
            <li><a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a></li>
            <li><a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a></li>
           
           <li><a href="orderReceived.jsp">Orders Received <i class="fas fa-archive"></i></a></li>
           
            <li><a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a></li>
          
            </nav>
          </div>
           <br>
           </body>
           <!--table-->