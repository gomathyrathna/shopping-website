<%@ page import = "java.sql.*" %>
<%@ page import = "database.MySqlConnect" %>

<%
String email = request.getParameter("email");
String pass = request.getParameter("psw");
if("admin@gmail.com".equals(email) && "admin@123".equals(pass)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}
else{
	int flag=0;
	try{
		Connection connect = MySqlConnect.getConnection();
		Statement st = connect.createStatement();
		ResultSet rs = st.executeQuery("select * from user where email='" +email+ "' and pass ='"+pass+"'");
		while(rs.next()){
			flag=1;
			session.setAttribute("email", email);
			response.sendRedirect("Home.jsp");
		}
		if(flag==0){
			response.sendRedirect("Login.jsp?msg=notexist");
		}
	}
	catch(Exception e){
		out.print(e);
		response.sendRedirect("Login.jsp?msg=invalid");
	}
}
%>