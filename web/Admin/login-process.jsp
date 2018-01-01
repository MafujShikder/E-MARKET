
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
    String email = request.getParameter("email");
    session.setAttribute("email", email);
    String password = request.getParameter("password");
        session.setAttribute("password", password);


    Connection connection = null;
    PreparedStatement ps = null;

  
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
               ps = (PreparedStatement) connection.prepareStatement("select * from adminlogin where email = ? and password = ?");
//                ps = (PreparedStatement) connection.prepareStatement(insert);
                ps.setString(1, email);
                ps.setString(2, password);
               
                ResultSet rs = ps.executeQuery();
               if(rs.next()){
                   if(session.getAttribute("backUrl") != null){
                       
                       session.removeAttribute("backUrl");
                       response.sendRedirect((String)session.getAttribute("backUrl"));
                       
                   }else{
                       response.sendRedirect("adminpanelindex.jsp");
                   }
                   session.setAttribute("email",rs.getString("email"));
                   session.setAttribute("type", "admin");
               }
           
        } catch (Exception E) {
            E.printStackTrace();
        }
    
%>
