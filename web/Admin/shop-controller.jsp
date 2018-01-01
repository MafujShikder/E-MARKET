<%@page import="functionality.DatabaseManager"%>
<%
String company_id = request.getParameter("id");

String action = request.getParameter("action");
DatabaseManager db = new DatabaseManager();
switch(action){
    case "toogle":
        String state = request.getParameter("state");
        if(state.equals("0")){
            //update 1 to database
            db.toogle_company_state(company_id, "1");
        }else{
            //update 0 to database
            db.toogle_company_state(company_id, "0");
        }
        response.sendRedirect("ManageShop.jsp");
        break;
}


%>