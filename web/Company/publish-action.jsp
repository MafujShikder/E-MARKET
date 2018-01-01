<%@page import="functionality.DatabaseManager"%>
<%
  
String publishStatus = request.getParameter("ps1");
String id = request.getParameter("id");
String table= "companyaddproduct";
String redirect = "CompanyManageProduct.jsp";

DatabaseManager db = new DatabaseManager();

%>

<% if(publishStatus.equals("0")){
    publishStatus = "1";
}else{
    publishStatus = "0";
    if(publishStatus.equals("0")){
        db.toogleFeature("0", id);
    }
    
}
    db.publishUpdate(table,id,publishStatus);
    
    
    response.sendRedirect(redirect);
%>