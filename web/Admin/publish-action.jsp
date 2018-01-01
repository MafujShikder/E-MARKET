<%@page import="functionality.DatabaseManager"%>
<%
  
String publishStatus = request.getParameter("publishStatus");
String id = request.getParameter("id");
String table= null;
String redirect = null;
switch(request.getParameter("scope")){
    case "c":
        table = "adminaddcategory";
        redirect = "ManageCategory.jsp";
        break;
    case "m":
        table = "adminaddmanufacturer";
        redirect = "ManageManufacturer.jsp";
        break;
     
    case "p":
        table = "companyaddproduct";
        String which = request.getParameter("company");
        redirect = "ManageProduct.jsp";
        if(which != null){
            redirect = "company-specific.jsp?company="+which;
        }
        break;
}
DatabaseManager db = new DatabaseManager();

%>

<% if(publishStatus.equals("0")){
    publishStatus = "1";
}else{
    publishStatus = "0";
    
}
    db.publishUpdate(table,id,publishStatus);
    if(table.equals("companyaddproduct")&&publishStatus.equals("0")){
        db.toogleFeature("0", id);
    }
    
    response.sendRedirect(redirect);
%>