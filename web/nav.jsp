<%@page import="functionality.DatabaseManager"%>
<%@page import="functionality.CartManipulation"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%                                  String customer_id = (String) session.getAttribute("userId");
                                    float vat = (float)5;
                                    DatabaseManager db = new DatabaseManager();
                                    int totalItem = db.totalItems(customer_id);
                                    float total = db.total(customer_id);
                                    float withVat = (float)(1+vat/100)*total;
                                    %>
                   
<%
                    if(request.getParameter("clear") != null){
                        session.setAttribute("cart",CartManipulation.deleteItem(request.getParameter("clear"),(String)session.getAttribute("cart")));
                    }
            if(session.isNew()){
               String cart = "";
                session.setAttribute("cart",cart);
            }
            
            %>
            <% 
            if(request.getParameter("value")!= null){
                String cart = (String)session.getAttribute("cart");
                cart += ","+request.getParameter("value");
                session.setAttribute("cart", cart);
                //String current = (String)session.getAttribute("cart-current");<%
            }
        %>
        
				
				        <div class="header-bar"> 
                                            <div class="container">
                                            <div class="row">


                <div class="span10 right">
                    <div class="social-strip">
                        <ul>
                       
                            <%
    String email = (String)session.getAttribute("email");
    String password = (String)session.getAttribute("password");

    Connection connection = null;
    PreparedStatement ps = null;

       
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
               ps = (PreparedStatement) connection.prepareStatement("select * from signup where email = ? and password = ?");
//                ps = (PreparedStatement) connection.prepareStatement(insert);
                ps.setString(1, email);
                ps.setString(2, password);
               
                ResultSet rs = ps.executeQuery();
               while(rs.next()){
                 String s = rs.getString("fname");
                 %>
                
                       

                            <li>  <a href="login.jsp" class="account"><%=s %></a></li>
                             <li>  <a href="logout.jsp" class="account">Logout</a></li>
                            <li><a href="customersignup.jsp" class="account">Signup</a></li>
                            <li><a href="#" class="wish">Wish List</a></li>
                            <li><a href="cart.jsp" class="check">Checkout</a></li>
                        
                 <%
                     

               }
           
        } catch (Exception E) {
            E.printStackTrace();
        }
    
                 %>        
                            <li>  <a href="login.jsp" class="account">Login</a></li>
                             <li>  <a href="customersignup.jsp" class="account">Signup</a></li>

                           
                            
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

                <div class="span4">
                    <form>
                        <input type="text" placeholder="Type and hit enter">
                        <input type="submit" value="">
                    </form>
                </div>

                <div class="span3">
                    <div class="cart">
                        <ul>
                            <li class="first"><a href="cart.jsp"></a></li>
                            <li><%=totalItem%> item(s)-BDT <%=withVat%></li>
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
                                 ResultSet rs;                                
                                    try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2", "root", "");
                                    PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select *  from  adminaddcategory");
                                    rs = ps2.executeQuery();
                                    while (rs.next()) {
                                        String id = rs.getString("id");
                                        String cnn = rs.getString("cn");
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
                                    System.out.println(session.getAttribute("cart"));
                                    out.println("comment_display_error");
                                    e.printStackTrace();
                                }
                            %>

                        </ul>
                                </nav>

                              
                            </div>
                        </div>
                    </div>
                </header>