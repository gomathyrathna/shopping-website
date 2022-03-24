<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>
<%
String email=session.getAttribute("email").toString();
String productId=request.getParameter("id");
try{
	Connection connect = MySqlConnect.getConnection();
	Statement st = connect.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+productId+"' and address is NULL");
	response.sendRedirect("Cart.jsp?msg=removed");
}
catch(Exception e){
	System.out.println(e);
}

%>
