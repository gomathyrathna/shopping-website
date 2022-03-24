<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int finalTotal = 0;
try{
	Connection connect = MySqlConnect.getConnection();
	Statement st = connect.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
	while(rs.next()){
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec")){
		response.sendRedirect("Cart.jsp?msg=notpossible");
	}
	else if(quantity !=1 && incdec.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("update cart set total ='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("Cart.jsp?msg=dec");
	}
	else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update cart set total ='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("Cart.jsp?msg=inc");
	
	}
	
}
catch(Exception e){
	
	System.out.println(e);
}
%>