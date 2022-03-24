<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>

<!DOCTYPE html>
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Laptop Store-Payment</title>
<link rel="stylesheet" href="stylePayment.css">
<style>
body
{
overflow-x:hidden;
}

</style>
<script type="text/javascript">
if(window.history.forward(1)!=null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email = session.getAttribute("email").toString(); 
int total = 0;
int sno=0;
try{
	Connection connect = MySqlConnect.getConnection();
	Statement st = connect.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" +email+ "' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
	}
	
%>
          <tr>
          <th scope="col"><a href="Cart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">order id</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
 <%
   ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
   while(rs.next()){
   
   
	   %>       
          <tr>
          <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getInt(4) %> </td>
            <td><%=rs.getInt(9) %> </td>
            <td><i class="fa fa-inr"></i> <%=rs.getInt(11) %></td>
            </tr>
   <%}
   ResultSet rs2 = st.executeQuery("select * from user where email='"+email+"'");
   while(rs2.next()){
	   %>
  
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="paymentAction.jsp" method="post">
<h3 style="color: red;">*Fill form correctly!*</h3>
 <div class="left-div">
 <h3 style="margin-right:40%;">Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(4)%>" placeholder="Enter address" required>
 </div>

<div class="right-div">
<h3 style="margin-right:40%;">Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(5)%>" placeholder="Enter city" required>
</div> 

<div class="left-div">
<h3 style="margin-right:40%;">Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(6)%>" placeholder="Enter state" required>
</div>

<div class="right-div">
<h3 style="margin-right:40%;">Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(7)%>" placeholder="Enter country" required>
</div>
<br>
<br>
<h3 style="color: red; ">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red;">*This address will also updated to your profile</h3>
<br>
<br>
<div class="left-div">
<h3 style="margin-right:40%;">Select way of Payment</h3>
<select class="input-style" name="paymentMethod">
<option value="cash on delivery(COD)">Cash on delivery(COD)</option>
<option value="online payment">Via Credit card</option>
</select>
</div>

<div class="right-div"style=" position:relative;top:12px;">
<h3 style="margin-right:40%;">Click here for Credit Card Payment</h3>
<a href="creditcard.html" style="margin-left:25%; color:red;">PAY HERE</a>
<br>
      <br>
</div>


<div class="left-div">
<h3 style="margin-right:40%;">Mobile Number</h3>
<input class="input-style" type="text" name="mobilenumber" value="<%=rs2.getString(8)%>" placeholder="Enter mobile number" required>
<h3 style="color: red; margin-right:40%;">*This mobile number will also updated to your profile</h3>
</div>


<button class="button" type="submit">Proceed to generate bill & save<i class='far fa-arrow-alt-circle-right'></i></button>

</form>
<% 
   }
}
catch(Exception e){
	System.out.println(e);
}
%>

      <br>
      <br>
      <br>

</body>
</html>