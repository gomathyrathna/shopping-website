<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>
<%

String email = session.getAttribute("email").toString();
String status = "processing";
try{
	Connection connect = MySqlConnect.getConnection();
	PreparedStatement ps = connect.prepareStatement("update cart set status=? where email=? and status='bill'");
	ps.setString(1,status);
	ps.setString(2,email);
	ps.executeUpdate();
	response.sendRedirect("Home.jsp");
}
catch(Exception e){
	System.out.println(e);
}
%>
