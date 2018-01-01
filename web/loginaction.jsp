
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
               ps = (PreparedStatement) connection.prepareStatement("select * from signup where email = ? and password = ?");
//                ps = (PreparedStatement) connection.prepareStatement(insert);
                ps.setString(1, email);
                ps.setString(2, password);
               
                ResultSet rs = ps.executeQuery();
               if(rs.next()){
                   if(session.getAttribute("backUrl") != null){
                       
                       
                       response.sendRedirect((String)session.getAttribute("backUrl"));
                       session.removeAttribute("backUrl");
                       
                   }else{
                       response.sendRedirect("index.jsp");
                   }
                   session.setAttribute("email",rs.getString("email"));
                   session.setAttribute("type", "user");
                   session.setAttribute("userId",rs.getString("id"));
               }else{
                   response.sendRedirect("login.jsp");
               }
           
        } catch (Exception E) {
            E.printStackTrace();
        }
    
%>
