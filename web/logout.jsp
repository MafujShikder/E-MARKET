

<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!--Created on : Feb 14, 2017, 12:06:12 AM
   Author     : Shadath Hossain
-->
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blood4Life</title>
        <link rel="shortcut icon" href="images/blood4life.png"/>
        <link href="css/bloodDoner.css" type="text/css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>


        <script src="sweetAlert/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
    </head>
    <body>

        <%
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
        
    </body>
</html>
