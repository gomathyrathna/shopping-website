<%@page import="database.MySqlConnect"%>
<%@page import="java.sql.*"%>
<%
String id  =request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String quantity=request.getParameter("quantity");
try{
	Connection connect=MySqlConnect.getConnection();
	Statement st=connect.createStatement();
	st.executeUpdate("update product set name='"+ name +"',catagory='"+ category +"',price='"+ price +"',quantity='"+ quantity +"'where id='"+ id +"'");
	if(quantity.equals("0"))  
	{
	st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
}
response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e){
System.out.println(e);
response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
