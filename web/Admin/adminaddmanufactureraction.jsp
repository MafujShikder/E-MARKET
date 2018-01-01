<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
    
   
    String cn = request.getParameter("cn");
    
     String cd = request.getParameter("cd");
    
    
    String ps1 = request.getParameter("ps1");
    
//    String pn = request.getParameter("pn");
//    String cn = request.getParameter("cn");
//    String mn = request.getParameter("mn");
//    //String pd = request.getParameter("pd");
//    String pp = request.getParameter("pp");
//    String pq = request.getParameter("pq");
//    String pi = request.getParameter("pi");
//    String ps1 = request.getParameter("ps1");
//   // String country = request.getParameter("country");
//    

    Connection connection = null;
    PreparedStatement ps = null;

    if ( cn != null && cd != null && ps1 != null ) {
        if (cn != "" && cd != ""  && ps1 != "" ) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                String insert = "INSERT INTO adminaddmanufacturer(cn,cd,ps1) VALUES( ?,?,?)";
                ps = (PreparedStatement) connection.prepareStatement(insert);
                
                ps.setString(1, cn);
                ps.setString(2, cd);
               ps.setString(3, ps1);
                
//                ps.setString(1, pn);
//                ps.setString(2, cn);
//                ps.setString(3, mn);
//                ps.setString(4, pd);
//                ps.setString(5, pp);
//                ps.setString(6, pq);
//                ps.setString(7, pi);
//                ps.setString(8, ps1);

                
               
                int updateQuery = 0;
                updateQuery = ps.executeUpdate();
                if (updateQuery != 0) {
                    response.sendRedirect("AddManufacturer.jsp");
                } else {
                    out.println("Unexpected error occured");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    } 
%>