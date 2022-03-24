<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>

<%
String email = session.getAttribute("email").toString();
String productId = request.getParameter("id");
int quantity = 1;
int productPrice = 0;
int productTotal = 0;
int cartTotal = 0;
int flag = 0;

	try{
		Connection connect = MySqlConnect.getConnection();
		Statement st = connect.createStatement();
		ResultSet rs = st.executeQuery("select * from product where id='" +productId+ "'");
		while(rs.next()){
			productPrice=rs.getInt(4);
			productTotal = productPrice;
		}
		ResultSet rs1 = st.executeQuery("select * from cart where product_id='" +productId+ "' and email = '" +email+ "' and address is NULL");
		while(rs1.next()){
			cartTotal=rs1.getInt(5);
			cartTotal=cartTotal+productTotal;
			quantity=rs1.getInt(3);
			quantity=quantity+1;
			flag=1;
		}
		if(flag==1){
			st.executeUpdate("update cart set total='"+cartTotal+"',quantity='"+quantity+"' where product_id='"+productId+"' and email='"+email+"' and address is NULL");
			response.sendRedirect("Home.jsp?msg=exist");		
		}
		if(flag==0){
			PreparedStatement ps=connect.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
			ps.setString(1, email);
			ps.setString(2, productId);
			ps.setInt(3, quantity);
			ps.setInt(4, productPrice);
			ps.setInt(5, productTotal);
			ps.executeUpdate();
			response.sendRedirect("Home.jsp?msg=added");
		}
}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("Home.jsp?msg=invalid");
	}
%>
