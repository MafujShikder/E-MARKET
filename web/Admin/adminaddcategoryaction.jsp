<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
    
   
    String cn = request.getParameter("cn");
    
     String cd = request.getParameter("cd");
    
    
    String ps1 = request.getParameter("ps1");
     

    Connection connection = null;
    PreparedStatement ps = null;

    if ( cn != null && cd != null && ps1 != null ) {
        
        if (cn != "" && cd != ""  && ps1 != "" ) {
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                String insert = "INSERT INTO adminaddcategory(cn,cd,ps1) VALUES( ?,?,?)";
                ps = (PreparedStatement) connection.prepareStatement(insert);
                
                ps.setString(1, cn);
                ps.setString(2, cd);
               ps.setString(3, ps1);
                

                
               
                int updateQuery = 0;
                updateQuery = ps.executeUpdate();
                if (updateQuery != 0) {
//                    out.println("Successfully inserted");
                        response.sendRedirect("AddCategory.jsp");
                } else {
                    out.println("Unexpected error occured");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    } 
%>