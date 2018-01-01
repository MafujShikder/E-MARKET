<%-- 
    Document   : exists
    Created on : Apr 7, 2017, 4:16:38 PM
    Author     : Mafuj 
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        //if username exist
        Class.forName("com.mysql.jdbc.Driver");
        Connection connnection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "root");
        PreparedStatement ps = (PreparedStatement) connnection.prepareStatement("SELECT  * FROM signup WHERE txtEmailId = ?");
        ps.setString(1, request.getParameter("txtEmailId"));
        ResultSet res = ps.executeQuery();
        if (res.next()) {
            out.print("Email already exists");
        } else {
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>