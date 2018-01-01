<%-- 
    Document   : retriveCategory
    Created on : Jul 23, 2017, 3:21:38 PM
    Author     : MAHFUJ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String id = request.getParameter("ajaxpost_id");
            String cn = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                PreparedStatement ps = (PreparedStatement) connection4.prepareStatement("select cn  from  adminaddcategory where id = '"+id+"'");
                ResultSet rs112 = ps.executeQuery();
                while(rs112.next()){
                    cn = rs112.getString("cn");
                }
                PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  companyaddproduct where cn = '"+cn+"'");
                ResultSet rs11 = ps2.executeQuery();
                while (rs11.next()) {
        %>

        <div>
            <figure>
               <a href="#"><img src="images/product_images/<%=rs11.getString("pi")%>" alt=""></a>
                <div class="overlay">
                    <a href="images/product_images/<%=rs11.getString("pi")%>" class="zoom"></a>
                    <a href="#" class="link"></a>
            </figure>
            <div class="detail">
                <h4><%=rs11.getString("pn")%></h4>
                <span>BDT:<%=rs11.getString("pp")%></span>
                <div class="icon">
                    <a href="show-cart.jsp?id=<%=rs11.getString("id")%>" class="one tooltip" title="Add to wish list"></a>
                    <a href="show-cart.jsp?id=<%=rs11.getString("id")%>" class="two tooltip " title="Add to cart"></a>
                    <a href="show-cart.jsp?id=<%=rs11.getString("id")%>" class="three tooltip" title="Add to compare"></a>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("comment_display_error");
                e.printStackTrace();
            }
        %>

    </body>
</html>
