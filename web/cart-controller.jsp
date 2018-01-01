<%@page import="java.sql.ResultSet"%>
<%@page import="functionality.DatabaseManager"%>
<%
    String action = request.getParameter("action");
    DatabaseManager db = new DatabaseManager();
    String product_id = request.getParameter("id");
    String customer_id = (String)session.getAttribute("userId");
    ResultSet rs = null;
    
    switch(action){
        case "insert":
            db.puchItemToCart(product_id, customer_id);
                response.sendRedirect("cart.jsp");
            
            //insert into cart
            break;
        case "shipping":
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String country = request.getParameter("country");
            String phone = request.getParameter("phone");
            String address = request.getParameter("add");
            String city = request.getParameter("city");
            String zip_code = request.getParameter("zip");
             customer_id = (String)session.getAttribute("userId");
             if(db.saveShippingInfo(first_name, last_name, customer_id, country, phone, address, city, zip_code))
             response.sendRedirect("payment_method.jsp");
            
            
            
            
            break;
            
        case "remove":
            db.removeFromCart(product_id, customer_id);
            response.sendRedirect("cart.jsp");
            break;
            
        case "update":
            String pdt_id = request.getParameter("product_id");
            String quantity = request.getParameter("quantity");
            String customer= (String)session.getAttribute("userId");
            
           if(db.updateItemInCart(customer, pdt_id, quantity))response.sendRedirect("cart.jsp");
        
           
            break;
            
        case "payment":
            
            String payment = request.getParameter("delivery");
            customer_id = (String)session.getAttribute("userId");
            if(db.insertPaymentDetail(customer_id, payment))response.sendRedirect("invoice.jsp");
            break;
            
    }
    


%>



<%

    while(rs!=null && rs.next()){
        %>
        lOOP ENTERED
        <%=rs.getString("product_id")%> 
        <%=rs.getString("product_name")%> 
        <%=rs.getString("quantity")%> 
        <%=rs.getString("price")%> 
        <%=rs.getString("rate")%><br>
                
        <%
    
    }
 String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String country = (String)request.getParameter("country");
            String phone = request.getParameter("phone");
            String address = request.getParameter("add");
            String city = request.getParameter("city");
            String zip_code = request.getParameter("zip");

%>

Payment        <%=first_name%><br>
        <%=last_name%><br>
        <%=country%><br>
<%=phone%>
<%=address%>
<%=city%>
<%=zip_code%>