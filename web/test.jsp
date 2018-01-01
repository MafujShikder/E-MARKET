<%-- 
    Document   : test
    Created on : Dec 12, 2017, 6:54:25 PM
    Author     : Mahfuj
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <a href="http://localhost:8085/E-MARKET/test.jsp?page=5" class="btn btn-primary">5</a>
        <%
       
        
        %>
        
        <%
                                        try{
                                             
        String btnVal = request.getParameter("page");
        //String itemCount = request.getParameter("item-count");
        int paginate = 5;
        
        int start = (Integer.parseInt(btnVal) -1 )*paginate + 1;
        int from = start -1;
        
        //System.out.println(to-from);
        Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                            PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  companyaddproduct limit "+from+",5");
                                            PreparedStatement count = (PreparedStatement) connection4.prepareStatement("select count(*)  from  companyaddproduct limit "+from+",5");
                                            ResultSet rows = count.executeQuery();
                                            rows.next();
                                            int rowCount = rows.getInt(1);
                                            System.out.println(rowCount);
                                            ResultSet rs11 = ps2.executeQuery();
                                            while (rs11.next()) {
                                    %>

                                    <div>

                                        <figure>

<!--                                                <a href="#"><%=rs11.getString("pi")%></a>-->
                                            <a href="images/product_images/<%=rs11.getString("pi")%>" class="zoom"><img src="images/product_images/<%=rs11.getString("pi")%>" alt=""></a>

                                            <div class="overlay">
                                                <a href="images/product_images/<%=rs11.getString("pi")%>" class="zoom"></a>
                                                <a href="#" class="link"></a>
                                            </div>
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
