<%@page import="java.sql.SQLException"%>
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
<%
    
    String cn= request.getParameter("cn");
    
    int paginate=12;
    String url = "E-MARKET";
    int rowCount = 0;
     
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                            PreparedStatement count =null;
                                            if(request.getParameter("cn") == null){
                                                count = (PreparedStatement) connection4.prepareStatement("select count(*)  from  companyaddproduct");
                                            }else{
                                                 count = (PreparedStatement) connection4.prepareStatement("select count(*)  from  companyaddproduct where cn='"+cn+"'");
                                            }
                                            ResultSet rows = count.executeQuery();
                                            rows.next();
                                            rowCount = rows.getInt(1);
                                            System.out.println(rowCount);
                                            rowCount = rowCount/paginate + (int)(((rowCount%paginate)/paginate) + 1);
    }catch(SQLException e){
        System.err.println("counting didn' occured...");
        
    }
    %>
<!--[if (gt IE 9)|!(IE)]><!--> 

<html lang="en-US">
    <!--<![endif]-->
    <head>
        <!-- META TAGS -->
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width" />

        <!-- Title -->
        <title>Home</title>

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,600,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Quattrocento:400,700' rel='stylesheet' type='text/css'>

        <!-- Style Sheet-->
        <link rel="stylesheet" href="css/tooltipster.css">
        <link href="css/ie.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/prettyPhoto.css">

        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

        <!-- favicon -->
        <link rel="shortcut icon" href="images/favicon.jpg">

        <!-- Include the HTML5 shiv print polyfill for Internet Explorer browsers 8 and below -->
        <!--[if lt IE 10]><script src="js/html5shiv-printshiv.js" media="all"></script><![endif]-->
        <script>
            function showButton(id)
            {
                $.post("retriveCategory.jsp", {ajaxpost_id: id}, function (data) {
                    $("#id").html(data);
                });
            }

        </script> 
        <script>
            function show(id)
            {

                $.post("retriveCategory.jsp", {ajaxpost_id: id}, function (data) {
                    $("#id").html(data);
                });
            }

        </script> 
    </head>
    <body>				
        <!-- HEADER -->
        <%@include file="nav.jsp"%>
    <!-- HEADER -->

  <div class="wrapper">
        <div class="container">
            <div class="row ">

                <!-- SLIDER -->
                <div class="span9 slider">
                    <div class="slider-slides">
                        <div class="slides">
                            <a href="#"><img src="images/slider1.jpg" alt=""></a>
                            <div class="overlay">
                                <h1>AWESOME FURNITUR</h1>
                                <p><span>50%</span> OFF <br/> TRENDY <span>DESIGNS</span> </p>
                            </div>
                        </div>
                        <div class="slides">
                            <a href="#"><img src="images/slider2.jpg" alt=""></a>
                            <div class="overlay">
                                <h1>LATEST FASHION</h1>
                                <p><span>30%</span> OFF <br/> TRENDY <span>DESIGNS</span> </p>
                            </div>
                        </div>
                        <div class="slides">
                            <a href="#"><img src="images/slider3.jpg" alt=""></a>
                            <div class="overlay">
                                <h1>AWESOME FURNITUR</h1>
                                <p><span>50%</span> OFF <br/> TRENDY <span>DESIGNS</span> </p>
                            </div>
                        </div>
                        <div class="slides">
                            <a href="#"><img src="images/slider4.jpg" alt=""></a>
                            <div class="overlay">
                                <h1>LATEST FASHION</h1>
                                <p><span>30%</span> OFF <br/> TRENDY <span>DESIGNS</span> </p>
                            </div>
                        </div>
                        <div class="slides">
                            <a href="#"><img src="images/slider5.jpg" alt=""></a>
                            <div class="overlay">
                                <h1>LATEST FASHION</h1>
                                <p><span>30%</span> OFF <br/> TRENDY <span>DESIGNS</span> </p>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="next"></a>
                    <a href="#" class="prev"></a>
                    <div class="slider-btn"></div>
                </div>
                <!-- SLIDER -->



            </div>
        </div>
    </div>


    <!-- PRODUCT-OFFER -->
    <div class="product_wrap">

        <div class="container">
            <div class="row" >
                 <div class="span3">
                    <div id="sidebar">
                        <div class="widget">
                            <h4>CATEGORIES</h4>

                            <div id="accordion">
                               <h5></h5>


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
                                                     cn = rs1.getString("cn");
                                                    session.setAttribute("id", id);
                                        %>
                                        <li>
                                            <h5>  <a  href="/E-MARKET/?cn=<%=cn%>&view=1"><%=cn%></a></h5>
                                        </li>


                                        <%
                                                }
                                            } catch (Exception e) {
                                                out.println("comment_display_error");
                                                e.printStackTrace();
                                            }
                                        %></ul>

                            </div>

                        </div>



                        <div class="widget">
                            <h4>Most Sold Products</h4>

                            <div class="featured">
                                <ul>
                                    <li class="clearfix">
                                        <figure>
                                            <a href="#"><img src="images/Microsoft-_Windows_-10.jpg" alt=""></a>
                                        </figure>
                                        <div>
                                            <h5>Brown Wood Chair</h5>
                                            <span>$244.00</span>
                                        </div>
                                    </li>



                                    <li class="clearfix last">

                                        <div>

                                            <h5>More Products</h5>

                                        </div>
                                    </li>
                                </ul>

                            </div>

                        </div>

                        <div class="widget">
                            <h4>Most Popular Products</h4>

                            <div class="featured">
                                <ul>
                                    <li class="clearfix">
                                        <figure>
                                            <a href="#"><img src="images/Microsoft-_Windows_-10.jpg" alt=""></a>
                                        </figure>
                                        <div>
                                            <h5>Brown Wood Chair</h5>
                                            <span>$244.00</span>
                                        </div>
                                    </li>



                                    <li class="clearfix last">

                                        <div>

                                            <h5>More Products</h5>

                                        </div>
                                    </li>
                                </ul>

                            </div>

                        </div>
                        <div class="widget">
                            <h4>Most Recent Products</h4>

                            <div class="featured">
                                <ul>
                                    <li class="clearfix">
                                        <figure>
                                            <a href="#"><img src="images/Microsoft-_Windows_-10.jpg" alt=""></a>
                                        </figure>
                                        <div>
                                            <h5>Brown Wood Chair</h5>
                                            <span>$244.00</span>
                                        </div>
                                    </li>



                                    <li class="clearfix last">

                                        <div>

                                            <h5>More Products</h5>

                                        </div>
                                    </li>
                                </ul>

                            </div>

                        </div>
                    </div>
                </div>

                <div class="span9 product-grid">

                    <div class="span9 heading">
                        <h2>Featured Products <span></span></h2>
                    </div>
                    <!--                                 <form class="form-horizontal" >-->
                    
                        


                            <div class="clearfix">
                                
                                <% if(request.getParameter("cn")== null){
                                 
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                            PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  companyaddproduct where id");
                                            ResultSet rs11 = ps2.executeQuery();
                                            while (rs11.next()) {
                                    %>
                                <div class="span3 product" >


                                    

                                    

                                    <div>

                                        <figure>

<!--                                                <a href="#"><%=rs11.getString("pi")%></a>-->
                                            <a href="images/product_images/<%=rs11.getString("pi")%>" class="zoom"><img src="images/product_images/<%=rs11.getString("pi")%>" alt=""></a>

                                            <div class="overlay">
                                                <a href="images/product_images/<%=rs11.getString("pi")%>" class="zoom"></a>
                                                <a href="#" class="link"></a>
                                            </div>
                                        </figure>

                                        <div class="detail">
                                            <h4><%=rs11.getString("pn")%></h4>
                                            <span>BDT:<%=rs11.getString("pp")%></span>

                                            <div class="icon">
                                                <a href="show-cart.jsp?id=<%=rs11.getString("id")%>" class="two tooltip" title="Add to wish list"></a>
                                                <a href="cart-controller.jsp?action=insert&id=<%=rs11.getString("id")%>" class="one tooltip " title="Add to cart"></a>
                                                <a href="show-cart.jsp?id=<%=rs11.getString("id")%>" class="three tooltip" title="Add to compare"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println("comment_display_error");
                                            e.printStackTrace();
                                        }
                                      
                                    }%>
                                    
                                    <% if(cn!= null){
                                        cn=request.getParameter("cn");
                                         int view =Integer.parseInt(request.getParameter("view"));
                                         int start = (view -1 )*paginate + 1;
                                         int from = start -1;
                                            
                                         try{
                                             
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                            PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  companyaddproduct where cn='"+cn+"' limit "+from+","+paginate);
                                            ResultSet rs11 = ps2.executeQuery();
                                            System.out.println("All queries executed for paginate...cn="+cn+" where from="+from);
                                            while (rs11.next()) {
                                                System.out.println("Product name is:"+rs11.getString("pi"));
                                                      
                                    %>
                                    
        
                                    <div class="spann3  product">                            
        
            <figure>
                <a href="images/product_images/<%=rs11.getString("pi")%>"class="zoom"><img src="images/product_images/<%=rs11.getString("pi")%>" alt="" ></a>
                <div class="overlay">
                    <a href="images/product_images/<%=rs11.getString("pi")%>" class="zoom"></a>
                    <a href="#" class="link"></a>
                </div>
            </figure>
            <div class="detail">
                <h4><%=rs11.getString("pn")%></h4>
                <span>BDT:<%=rs11.getString("pp")%></span>
                <div class="icon">
                    <a href="wishlist-controller.jsp?action=insert&id=<%=rs11.getString("id")%>" class="two tooltip" title="Add to wish list"></a>
                    <a href="cart-controller.jsp?action=insert&id=<%=rs11.getString("id")%>" class="one tooltip " title="Add to cart"></a>
                    <a href="show-cart.jsp?id=<%=rs11.getString("id")%>" class="three tooltip" title="Add to compare"></a>
                </div>
            </div>
                
        </div>
                                            


                 <%
                                            
                                                }
                                             
                                             
                                             
                %>
                                                
                                
                            </div>
                            


                            <!--                                 </form>-->

                        </div>
                   
                
                
               
                </div>        
                <div class="pagination clearfix">
                       
                        <ul class="clearfix">
                                    <%
                                        cn=request.getParameter("cn");
                    for(int i=1;i<=rowCount;i++){
                        
                    System.out.println("Total paginates are:"+rowCount);
                    %>
                   
                            <li><a href="/E-MARKET/?cn=<%=cn%>&view=<%=i%>"><%=i%></a></li>
                           
                        
                            <%
                                }
                            %>
                            </ul>
                    </div>
                                             
                                             <%
                                            }%><%catch(SQLException e){
                                                System.err.println("Catygory wise display isn't working.QUERY PROBLEM");
                                            }
                                    }
                                    %>
                                     
                

            </div>
        </div>
    
    <!-- PRODUCT-OFFER -->

    <!-- CLIENTS -->
    <div class="clients-wrap">
        <div class="container">
            <div class="row heading-wrap">
                <div class="span12 heading">
                    <h2>Our Brands <span></span></h2>
                </div>
            </div>

            <div class="row">
                <div class="span12 clients" >
                    <ul class="elastislide-list clearfix" id="carousel" textcc>
                        
                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  companysignup");
                                ResultSet rs11 = ps2.executeQuery();
                                while (rs11.next()) {
                        %> 

                        <li><a href="index.jsp"><%=rs11.getString("fname")%></a></li>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("comment_display_error");
                                    e.printStackTrace();
                                }
                            %>   
                        <li><a href="#"><img src="" ></a></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- CLIENTS -->

    <!-- CATEGORIES -->

    <!-- CATEGORIES -->


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
                                <li><a href="#">Company Login</a></li>
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
                                <li><a href="">Terms & Conditions</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="span3">
                        <div class="widget">
                            <h3>My Account</h3>
                            <ul>
                                <li><a href="CustomerDashboard.jsp">My Account</a></li>
                                <li><a href="#">Order History</a></li>
                                <li><a href="#">Wish List</a></li>

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
                        <p>© 2013 Maxshop Design, All Rights Reserved</p>
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


 		
</body>
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
</html>
