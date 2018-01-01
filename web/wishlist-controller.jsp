<%@page import="functionality.DatabaseManager"%>
<%
    String action = request.getParameter("action");
    String product_id = request.getParameter("id");
    String customer_id = (String)session.getAttribute("userId");
    DatabaseManager db = new DatabaseManager();
    switch(action){
        case "insert":
            db.wish(customer_id,product_id);
            response.sendRedirect("wishlist.jsp");
            break;
        case "remove":
            db.unwish(customer_id,product_id);
            response.sendRedirect("wishlist.jsp");
            break;
            
    }

%>
