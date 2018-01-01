<%-- 
    Document   : ss
    Created on : Apr 20, 2017, 12:04:35 PM
    Author     : MAHFUJ
--%>

<%@page import="functionality.DatabaseManager"%>
<%@page import="functionality.CartManipulation"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--cart specific-->



<!doctype html>
<!--[if IE 7]>    <html class="ie7" > <![endif]-->
<!--[if IE 8]>    <html class="ie8" > <![endif]-->
<!--[if IE 9]>    <html class="ie9" > <![endif]-->
<!--[if IE 10]>    <html class="ie10" > <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en-US"> <!--<![endif]-->
		<head>
				<!-- META TAGS -->
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width" />
				
				<!-- Title -->
				<title>Show Cart</title>

                <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,600,800' rel='stylesheet' type='text/css'>
                <link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'>
                <link href='http://fonts.googleapis.com/css?family=Quattrocento:400,700' rel='stylesheet' type='text/css'>

                <!-- Style Sheet-->
                <link rel="stylesheet" href="css/tooltipster.css">
                <link rel="stylesheet" href="css/bootstrap.css">
                <link rel="stylesheet" href="css/prettyPhoto.css">
                <link rel="stylesheet" href="style.css">
                <link rel="stylesheet" href="css/responsive.css">
                <link href="css/ie.css" rel="stylesheet" media="all">


                <!-- favicon -->
                <link rel="shortcut icon" href="images/favicon.jpg">

                <!-- Include the HTML5 shiv print polyfill for Internet Explorer browsers 8 and below -->
                <!--[if lt IE 10]><script src="js/html5shiv-printshiv.js" media="all"></script><![endif]-->
                <script>
                    
                function updatePrice(){
                    //get counter element
                    var counter = document.getElementById("counter").innerText;
                    cosole.log(counter);
                    
                    //multiply with rate
                    //get total price label
                    //update total price label
                }    
                    
                </script>
		</head>
		<body>
                    <!-- HEADER -->
                    <%@include file="nav.jsp" %>
				<!-- HEADER -->
                                <%=session.getAttribute("cart")%>
                <!-- BAR -->
                <div class="bar-wrap">
                    <div class="container">
                        <div class="row">
                            <div class="span12">
                                <div class="title-bar">
                                    <h1>SHOPPING CART</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- BAR -->

                <!-- PRODUCT-OFFER -->
                <div class="product_wrap">

                    <div class="container">
                        <div class="row">
                            <div class="span12">
                                <div class="shopping-cart">

                                    <ul class="title clearfix">
                                        <li>Image</li>
                                        <li class="product-name">Product Name</li>
                                        <li>Unite Price</li>
                                        <li class="">Action</li>
                                        
                                    </ul>

                                   

                                    

                                  <%


                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            db = new DatabaseManager();
                            ResultSet product_ids = db.wishlist((String)session.getAttribute("userId"));
                            
                            
                            while (product_ids.next()) {
                                ResultSet product = db.getProductDetails(product_ids.getString("product_id"));product.next();
                    %>
                    
                                    
                    <ul class="clearfix">
                        <li>
                            <figure><img src="images/product_images/<%=product.getString("pi")%>" alt=""></figure>
                                </li>
                                <li class="product_name">
                                    <h4><%=product.getString("pn")%></h4>
                                </li>
                                <li><%=product.getString("pp")%></li>
                                <li class="">

                                <a class="btn btn-success" href="cart-controller.jsp?action=insert&id=<%=product.getString("id")%>">Add too Cart</a>
                                <a class="btn btn-danger" href="wishlist-controller.jsp?action=remove&id=<%=product.getString("id")%>">Delete</a>
                                </li>
                    </ul>

                            
<%
                            }
                        } catch (Exception e) {
                            out.println("comment_display_error");
                            e.printStackTrace();
                        }
                    %>
                    
                     
                                </div>
                            </div>
                        </div>

                        

                    </div>
                </div>
                <!-- PRODUCT-OFFER -->

                <!-- FOOTER -->
                



                    <div class="footer-wrap">
        <div class="container">
            <div class="row">

                <div class="footer clearfix">

                    <div class="span3">
                        <div class="widget">
                            <h3>COMPANY INFORMATION</h3>
                            <ul>
                                 <li><a href="companysignup.jsp">Company Sign up</a></li>
                                <li><a href="Company/companylogin.jsp">Company Login</a></li>
                                <li><a href="Admin/AdminPanellogin.jsp">Company Admin Panel</a></li>

                            </ul>
                        </div>
                    </div>

                    <div class="span3">
                        <div class="widget">
                            <h3>Information</h3>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Delivery Information</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="user_feedback.jsp">User Feedback</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="span3">
                        <div class="widget">
                            <h3>My Account</h3>
                            <ul>
                                <li><a href="Customer/CustomerDashboard.jsp">My Account</a></li>
                                <li><a href="Customer/CustomerParchaseHistory.jsp">Order History</a></li>
                                <li><a href="Customer/CustomerWishlist.jsp">Wish List</a></li>

                            </ul>
                        </div>
                    </div>

                    <div class="span3">
                        <div class="widget">
                            <h3>Contact us</h3>
                            <ul>
                                <li>mafujshikder01@gmail.com</li>
                                <li>+01934864284</li>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <footer class="clearfix">
                    <div class="span5">
                        <p>© 2017 E-MARKET Design, All Rights Reserved</p>
                    </div>
                    <div class="span2 back-top">
                        <a href="#"> <img src="images/back.png" alt=""></a>
                    </div>
                    <div class="span5">
                        <div class="social-icon">
                            <a class="rss" href=""></a>
                            <a class="twet" href=""></a>
                            <a class="fb" href=""></a>
                            <a class="google" href=""></a>
                            <a class="pin" href=""> </a>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>
                <!-- FOOTER -->


                <!-- Scripts -->
                <%@include file="footer-links.jsp" %>
               
		</body>
</html>

