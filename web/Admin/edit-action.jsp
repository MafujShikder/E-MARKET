<%@page import="functionality.DatabaseManager"%>
<% DatabaseManager db = new DatabaseManager(); %>
<% String target = request.getParameter("target");
    
    // manage category
    
    
    if(target.equals("category"))if(db.manageCategoryEdit(request.getParameter("id"), request.getParameter("name"), request.getParameter("discription"), request.getParameter("publishStatus"))){
        
    response.sendRedirect("ManageCategory.jsp");
}

%>

<%
  if(target.equals("manufacturer")){
      
    String id = request.getParameter("id");
    String cn = request.getParameter("cn");
    String cd = request.getParameter("cd");
    String publishStatus = request.getParameter("ps1");
      db.manufactureUpdate(id, cn, cd, publishStatus);
      response.sendRedirect("ManageManufacturer.jsp");
              
  };

  if(target.equals("product")){
       String id = request.getParameter("id");
    String cn = request.getParameter("cn");
    String cd = request.getParameter("cd");
    String ps1 = request.getParameter("ps1");
    String pn = request.getParameter("pn");
    String mn = request.getParameter("mn");
    String pd = request.getParameter("pd");
    String pp = request.getParameter("pp");
    String pq = request.getParameter("pq");
    String pi = request.getParameter("pi");
      db.productUpdate(id, pn, cn, mn, pd, pp, pq, pi, ps1);
  }

%>
