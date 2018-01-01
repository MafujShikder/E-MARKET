<%-- 
    Document   : table
    Created on : Jul 15, 2017, 3:40:27 PM
    Author     : MAHFUJ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="functionality.Authentication"%>
<%
    String email = (String)session.getAttribute("email");
    String type = (String)session.getAttribute("type");
    
    if(!Authentication.authAdmin(email, type)){
        response.sendRedirect("AdminPanellogin.jsp");
        
    }
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
	<meta charset="utf-8">
	<title>Free HTML5 Bootstrap Admin Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
		
</head>

<body>
		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>E-MARKET</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> admin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li class="divider"></li>
						<li><a href="login.html">Logout</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				
			</div>
		</div>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="adminpanelindex.jsp"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
						<li><a class="ajax-link" href="AddCategory.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> Add Category</span></a></li>
						
						<li><a class="ajax-link" href="ManageCategory.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Category</span></a></li>
                                                <li><a class="ajax-link" href="AddManufacturer.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> Add Manufacturer</span></a></li>
						
						<li><a class="ajax-link" href="ManageManufacturer.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Manufacturer</span></a></li>
                                                <li><a class="ajax-link" href="ManageProduct.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Product</span></a></li>
                                                <li><a class="ajax-link" href="ManageOrder.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Order</span></a></li>
                                                <li><a class="ajax-link" href="ManageShop.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Shops</span></a></li>
                                                <li><a class="ajax-link" href="ManageCustomer.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Customers</span></a></li>
                                                <li><a class="ajax-link" href="ManageComment.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> Manage Comments</span></a></li>
                                                <li><a class="ajax-link" href="UserFeedback.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet"> User Feedback</span></a></li>
					</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span--><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Tables</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">		
				<div class="box span12">
                                     <div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> Manage Product</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>Product Id</th>
								  <th>Product Name</th>
								  <th>Manufacturer Name</th>
                                                                  <th>Product Category</th>
								  <th>Publication Status</th>
                                                                  <th>Feature Product</th>
								  <th>Actions</th>
							  </tr>
						  </thead>  
                                                  <%

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                            String specificCompany = request.getParameter("company");
                            System.out.println(specificCompany);
                            PreparedStatement ps2 = null;
                            if(specificCompany != null){
                             ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  companyaddproduct where company_id="+specificCompany);
                                
                            }
                            ResultSet rs11 = ps2.executeQuery();
                            while (rs11.next()) {
                    %>
						  <tbody>
                                                     
							<tr>
                                                            <td><%=rs11.getString("id")%></td>
								<td class="center"><%=rs11.getString("pn")%></td>
								<td class="center"><%=rs11.getString("mn")%></td>
								<td class="center"><%=rs11.getString("cn")%></td>
                                                                <td class="center"><%=rs11.getString("ps1")%></td>
								<td class="center"><%=rs11.getString("feature")%></td>
                                                                
								<td class="center">
									<% String publishStatus = rs11.getString("ps1");
                                                
                                                   if(publishStatus.equals("0")){
                                                       
                                                   %>
                                                <a class="btn btn-danger" href="publish-action.jsp?id=<%=rs11.getString("id")%>&scope=p&publishStatus=<%=rs11.getString("ps1")%>&company=<%=rs11.getString("company_id")%>">
                                                    <i class="icon-zoom-in icon-white"></i>  
                                                                                             
                                                </a>
                                                    
                                                
                                                    
                                                     <%
                                                }else{    
                                                    
                                                %><a class="btn btn-success" href="publish-action.jsp?id=<%=rs11.getString("id")%>&publishStatus=<%=1%>&scope=p&company=<%=rs11.getString("company_id")%>">
                                                    <i class="icon-zoom-in icon-white"></i>  
                                                                                             
                                                            
                                                    <%String feature = rs11.getString("feature");
                                                            if(feature.equals("0")){%>
                                                               </a>
                                                    <a class="btn btn-primary" href="feature-action.jsp?id=<%=rs11.getString("id")%>&status=<%=feature%>&company=<%=rs11.getString("company_id")%>">
                                                    <i class="icon-arrow-down icon-white"></i>  
                                                                                             
                                                </a>  
                                                            <%}else{%>
                                                            
                                                             
                                                    <a class="btn btn-primary" href="feature-action.jsp?id=<%=rs11.getString("id")%>&status=<%=feature%>&company=<%=rs11.getString("company_id")%>">
                                                    <i class="icon-arrow-up icon-white"></i>  
                                                                                             
                                                </a>
                                                            
                                                            <%}%>
                                                                
                                                    
                                                                
                                                <% } 
                                                %>
									
									<a class="btn btn-danger" href="Manage_product_delete_action.jsp?id=<%=rs11.getString("id")%>&company=<%=rs11.getString("company_id")%>">
										<i class="icon-trash icon-white"></i> 
										</a>
								</td>
							</tr>
							</tbody>
                                                   <%
                            }
                        } catch (Exception e) {
                            out.println("comment_display_error");
                            e.printStackTrace();
                        }
                    %>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->

			
    
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		<footer>
			<p class="pull-left">&copy; <a href="http://usman.it" target="_blank">e-market </a> 2017</p>
			<p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-template">e-market</a></p>
		</footer>
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
		
</body>
</html>

