
    <%@ page import = "java.sql.*" %>
    <%@ page import = "database.MySqlConnect" %>
    <%
    String name = request.getParameter("usrname");
    String email = request.getParameter("email");
    String pass = request.getParameter("psw");
    try{
    Connection connect = MySqlConnect.getConnection();
    PreparedStatement ps = connect.prepareStatement("insert into user(name,pass,email) values(?,?,?)");
    out.println("You are sucessfully registered");
    ps.setString(1, name);
    ps.setString(2, pass);
    ps.setString(3, email);
    ps.executeUpdate();
    response.sendRedirect("Register.jsp?msg=valid");
    }
    catch(Exception e)
    {
    	response.sendRedirect("Register.jsp?msg=invalid");
    	System.out.println(e);
    }

    
    %>
