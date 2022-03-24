<%@page import="database.MySqlConnect"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String quantity=request.getParameter("quantity");
String image = request.getParameter("image");
try{
    Connection connect=MySqlConnect.getConnection();
	PreparedStatement ps=connect.prepareStatement("insert into product value (?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,category);
	ps.setString(4,price);
	ps.setString(6,quantity);
	ps.setString(5,image);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e){
response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>
