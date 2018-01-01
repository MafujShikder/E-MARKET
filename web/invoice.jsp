<%-- 
    Document   : invoice.jsp
    Created on : Dec 22, 2017, 12:04:32 AM
    Author     : Mahfuj
--%>

<%@page import="functionality.DatabaseManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        user
        <%
            String customer_id = (String)session.getAttribute("userId");
             Class.forName("com.mysql.jdbc.Driver");
             Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
             String user = "select fname,lname,Address from signup where id=?";
             PreparedStatement ps = (PreparedStatement)connection4.prepareStatement(user);
             ps.setString(1, customer_id);
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
            
            %>
        
        <%=rs.getString("fname")%>
        <%=rs.getString("lname")%>
        <%=rs.getString("Address")%>
            <%
                }
            %>
            <br> 
            ship
            <%
            
             Class.forName("com.mysql.jdbc.Driver");
              connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
             String ship = "select first_name,last_name,address from tbl_shipping where customer_id=? order by shipping_id desc limit 0,1";
              ps = (PreparedStatement)connection4.prepareStatement(ship);
             ps.setString(1, customer_id);
              rs = ps.executeQuery();
             while(rs.next()){
            
            %>
        
        <%=rs.getString("first_name")%>
        <%=rs.getString("last_name")%>
        <%=rs.getString("address")%>
            <%
                }
            %>
            <br>
            
             <%
            
             Class.forName("com.mysql.jdbc.Driver");
              connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
              new DatabaseManager().getNewOrderId(customer_id);
              String order_id =new DatabaseManager().getActiveOrderId(customer_id);
              new DatabaseManager().pushCartToOrderDetails(order_id, customer_id);
             String product_list="select * from tbl_order_details where order_id = ?";
              ps = (PreparedStatement)connection4.prepareStatement(product_list);
             ps.setString(1, order_id);
              rs = ps.executeQuery();
             while(rs.next()){
            
            %>
        
        <%=rs.getString("product_id")%>
        
        
        <%=rs.getString("quantity")%>
        <%=rs.getString("price")%><br>
        
            <%
                }
            %>
            <%=order_id%>
            <%
                DatabaseManager db = new DatabaseManager();
                db.deleteAllFromCart(customer_id);
                db.updateOrderStatus(customer_id, order_id);
                
                %>
    </body>
</html>
