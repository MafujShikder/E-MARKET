<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
    String id = request.getParameter("id");
   
      

    Connection connection = null;
    PreparedStatement ps = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                String delete = "DELETE FROM companyaddproduct WHERE id="+id;
                ps = (PreparedStatement) connection.prepareStatement(delete);
                
               
                int updateQuery = 0;
                updateQuery = ps.executeUpdate();
                if (updateQuery != 0) {
                     out.println("Successfully Deleted");
                     response.sendRedirect("CompanyManageProduct.jsp");
                } else {
                    out.println("Unexpected error occured");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
      
    
%>