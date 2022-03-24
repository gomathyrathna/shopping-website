<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobileNumber = request.getParameter("mobilenumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = "";
transactionId=request.getParameter("transactionId");
String status="bill";
try{
	Connection connect = MySqlConnect.getConnection();
	PreparedStatement ps = connect.prepareStatement("update user set address=?,city=?,state=?,country=?,mobileNumber=? where email =?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,mobileNumber);
	ps.setString(6,email);
	ps.executeUpdate();
	
	PreparedStatement ps1 = connect.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobilenumber=?,orderdate=now(),deliverydate=DATE_ADD(orderdate,INTERVAL 7 DAY),paymentmethod=?,transactionid=?,status=? where email=? and address is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,country);
	ps1.setString(5,mobileNumber);
	ps1.setString(6,paymentMethod);
	ps1.setString(7,transactionId);
	ps1.setString(8,status);
	ps1.setString(9,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e){
	System.out.println(e);
}


%>