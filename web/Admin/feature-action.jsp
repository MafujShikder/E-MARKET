<%@page import="functionality.DatabaseManager"%>
<%
    String status = (String)request.getParameter("status");
    String redirect = "ManageProduct.jsp";
    String which = request.getParameter("company");
    if(which != null){
        redirect = "company-specific.jsp?company="+which;
    }
    DatabaseManager d = new DatabaseManager();
    String id = (String)request.getParameter("id");
    if(status.equals("0")
        ){
        d.toogleFeature("1", id);
        response.sendRedirect(redirect);
    }else{
        d.toogleFeature("0", id);
        response.sendRedirect(redirect);
    }


%>
