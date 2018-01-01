<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String Address = request.getParameter("Address");
    String city = request.getParameter("city");
    String zip = request.getParameter("zip");
    String country = request.getParameter("country");
    

    Connection connection = null;
    PreparedStatement ps = null;

    if (fname != null && lname != null && email != null && password != null && phone != null && Address != null && city != null && zip != null && country != null ) {
        if (fname != "" && lname != "" && email != "" && password != "" && phone != "" && Address != "" && city != "" && zip != ""&& country != "") {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                String insert = "INSERT INTO signup(fname,lname, email,password,phone,Address,city,zip,country) VALUES( ?,  ?, ?, ?, ?,  ?, ?,  ?, ?)";
                ps = (PreparedStatement) connection.prepareStatement(insert);
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setString(5, phone);
                ps.setString(6, Address);
                ps.setString(7, city);
                ps.setString(8, zip);
                 ps.setString(9, country);
                
               
                int updateQuery = 0;
                updateQuery = ps.executeUpdate();
                if (updateQuery != 0) {
                   response.sendRedirect("customersignup.jsp");
                } else {
                    out.println("Unexpected error occured");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    } 
%>