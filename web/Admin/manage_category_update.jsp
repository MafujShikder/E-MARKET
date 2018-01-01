<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
//    String id = request.getParameter("id");
//   
//      
////
////    String cn = request.getParameter("cn");
////    
////     String cd = request.getParameter("cd");
////    
////    
////    String ps1 = request.getParameter("ps1");
////     
//
//    Connection connection = null;
//    PreparedStatement ps = null;

//    if ( cn != null && cd != null && ps1 != null ) {
//        if (cn != "" && cd != ""  && ps1 != "" ) {
//            
//        }
//        if (cn.equals("") || cd.equals("") || ps1.equals("") ) {
//                out.println("Every field is required !");
//            } else {
            
//        if ( cn != null && cd != null && ps1 != null ) {
//        
//        if (cn != "" && cd != ""  && ps1 != "" ) {
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
////                String insert = "INSERT INTO adminaddcategory(cn,cd,ps1) VALUES( ?,?,?)";
//                String update = "UPDATE adminaddcategory SET cn = ?,cd = ?,ps1 = ? WHERE id="+id;
//                ps = (PreparedStatement) connection.prepareStatement(update);
//                
//                ps.setString(1, cn);
//                ps.setString(2, cd);
//               ps.setString(3, ps1);
                

//                
//                   int updateQuery = 0;
//                updateQuery = ps.executeUpdate();
//                if (updateQuery != 0) {
//                     out.println("Successfully Deleted");
//                } else {
//                    out.println("Unexpected error occured");
//                }
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
//            }
//        }
//        %>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");

String cn=request.getParameter("cn");
String cd=request.getParameter("cd");
String ps1=request.getParameter("ps1");


try{
Connection connection = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
Statement st=null;
st=connection.createStatement();
st.executeUpdate("update adminaddcategory set cn='"+cn+"',cd='"+cd+"',ps1="+ps1+"' where id='"+id+"'");
out.println("Successfull Updated");
//response.sendRedirect("Manage_category_edit.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>
