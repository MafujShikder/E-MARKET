<%@page import="functionality.DatabaseManager"%>
<% DatabaseManager db = new DatabaseManager(); %>
<% String target = request.getParameter("target");
    
  

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
