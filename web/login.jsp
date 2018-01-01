<%-- 
    Document   : ss
    Created on : Apr 20, 2017, 12:04:35 PM
    Author     : MAHFUJ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if IE 7]>    <html class="ie7" > <![endif]-->
<!--[if IE 8]>    <html class="ie8" > <![endif]-->
<!--[if IE 9]>    <html class="ie9" > <![endif]-->
<!--[if IE 10]>    <html class="ie10" > <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en-US"> <!--<![endif]-->
		<head>
			<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width" />
				
				<!-- Title -->
				<title>Customer Login</title>

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
		</head>
		<body>				
				<!-- HEADER -->
				<div class="header-bar">
                    <div class="container">
                        <div class="row">
                            
                            <div class="span10 right">
                                <div class="social-strip">
                                    <ul>
                                         <li><a href="login.jsp" class="account">Login</a></li>
                                         <li><a href="customersignup.jsp" class="account">Sign up</a></li>
                                          
                                     
                                        <li><a href="#" class="wish">Wish List</a></li>
                                        <li><a href="cart.jsp" class="check">Checkout</a></li>
                                    </ul>
                                </div>

                                
                            </div>
                        </div>
                    </div>
				</div>

                <div class="header-top">
                    <div class="container">
                        <div class="row">

                            <div class="span5">
                                <div class="logo">
                                    <a href="index.jsp"><img src="images/e-logo.png" alt=""></a>
                                </div>
                            </div>

                            <div class="span5">
                                <form>
                                    <input type="text" placeholder="Type and hit enter">
                                    <input type="submit" value="">
                                </form>
                            </div>

                            <div class="span2">
                                <div class="cart">
                                     <ul>
                                        <li class="first"><a href="#"></a><span></span></li>
                                        <li>0 item(s)-BDT 0</li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <header>
                    <div class="container">
                        <div class="row">
                            <div class="span12">
                                <nav class="desktop-nav">
<ul class="clearfix">
                                         <%
                                 ResultSet rs1;                                
                                    try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                    PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  adminaddcategory");
                                    rs1 = ps2.executeQuery();
                                    while (rs1.next()) {
                                        String id = rs1.getString("id");
                                        String cnn = rs1.getString("cn");
                                        session.setAttribute("id", id);
                            %>
                            <li>
                                    <a class="btn btn-default" href="/E-MARKET/?cn=<%=cnn%>&view=1"><%=cnn%></a>
                             
                            </li>
                            
                            
                            <%
                                    }
                                }
                                catch (Exception e

                                
                                    ) {
                                    out.println("comment_display_error");
                                    e.printStackTrace();
                                }
                            %></ul>
                                </nav>

                               
                            </div>
                        </div>
                    </div>
                </header>
				<!-- HEADER -->

                <!-- BAR -->
                <div class="bar-wrap">
                    <div class="container">
                        <div class="row">
                            <div class="span12">
                                <div class="title-bar">
                                    <h1>Log in</h1>
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

                                <div id="check-accordion">

                                   


               <h5><small>STEP 1</small><a href="#">Log in</a></h5>

                                    <div class="clearfix">
                     <script type="text/javascript">
function Confirm(form){
alert("Login successfully!"); 
form.submit();
}
</script>               

                                        <div class="span6 cheakout clearfix register">
                                            <h6>Registered Customer ? <span>Please fill the form below</span></h6>
                                            <form class="clearfix" method="post" action="loginaction.jsp">
                                                <label>Your e-mail address</label>
                                                <input type="text" name="email" placeholder="yourmail@domain.com"><br/>
                                                <label>Your Password</label>
                                                <input type="text" name="password"placeholder="enter your password"><br/>
                                                <a href="#" >Forgot your password ?</a>
                                                <input type="submit" name="Submit" value="Login" onClick="Confirm(this.form)">
                                            </form>
                                        </div>

                                    </div>
               




                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- PRODUCT-OFFER -->

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

                <!-- Scripts -->
                <script src="js/jquery-1.9.1.min.js"></script>
                <script src="js/jquery-ui.js"></script>
                <script src="js/jquery.cycle.all.js"></script>
                <script src="js/modernizr.custom.17475.js"></script>
                <script src="js/jquery.elastislide.js"></script>
                <script src="js/jquery.carouFredSel-6.0.4-packed.js"></script>
                <script src="js/jquery.selectBox.js"></script>
                <script src="js/jquery.tooltipster.min.js"></script>
                <script src="js/jquery.prettyPhoto.js"></script>
                <script src="js/custom.js"></script>
		</body>
</html>