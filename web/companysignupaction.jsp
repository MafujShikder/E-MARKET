<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
    String fname = request.getParameter("fname");
    
    String email = request.getParameter("email");
   
    String phone = request.getParameter("phone");
    
     String password = request.getParameter("password");
   
    

    Connection connection = null;
    PreparedStatement ps = null;

    if (fname != null &&  email != null && phone != null && password != null   ) {
        if (fname != "" && email != "" && phone != "" && password != ""  ) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                String insert = "INSERT INTO companysignup(fname, email,phone,password) VALUES( ?,  ?, ?, ?)";
                ps = (PreparedStatement) connection.prepareStatement(insert);
                ps.setString(1, fname);
               
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, password);
                
                
                
               
                int updateQuery = 0;
                updateQuery = ps.executeUpdate();
                if (updateQuery != 0) {
                   response.sendRedirect("companysignup.jsp");
                } else {
                    out.println("Unexpected error occured");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    } 
%>