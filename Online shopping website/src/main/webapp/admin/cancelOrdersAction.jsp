<%@page import="database.MySqlConnect"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String email=request.getParameter("email");
String status="cancel";
try{
	Connection connect=MySqlConnect.getConnection();
	Statement st=connect.createStatement();
	st.executeUpdate("update cart set status='"+ status +"' where product_id='"+ id +"' and email='"+ email +"' and address is not NULL");
	response.sendRedirect("orderReceived.jsp?msg=cancel");
}
catch(Exception e){
	response.sendRedirect("orderReceived.jsp?msg=wrong");
	System.out.println(e);
}
%>