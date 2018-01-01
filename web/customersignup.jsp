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
				<!-- META TAGS -->
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width" />
				
				<!-- Title -->
				<title>Customer Signup</title>

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
                <script src="sweetAlert/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="jquery-3.0.0.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>   

        <script type='text/javascript' src='js/jquery.js'></script>
        <link href='css/calendar.css' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script>
            jQuery(document).ready(function ($) {
                $("#datepicker").datepicker();
            });
        </script>

        
        <script type="text/javascript">
            function togglePassword(el) {
                var checked = el.checked;
                if (checked) {
                    document.getElementById("password").type = 'text';
                    docuemnt.getElementById("toggleText").text = "Hide Password";
                } else {
                    document.getElementById("password").type = 'password';
                    docuemnt.getElementById("toggleText").text = "Show Password";
                }
            }
        </script>
                <script>
            function mobileNumberCheck(txtMobileNumber) {
                var checkMobileNumberPattern = /^\d{11}$/;
                if (!txtMobileNumber.value.match(checkMobileNumberPattern)) {
                    txtMobileNumber.setCustomValidity('Invalid contact number');
                    return false;
                } else {
                    txtMobileNumber.setCustomValidity('');
                    document.txtMobileNumber.focus();
                    return  true;
                }
            }

        </script>
        <script type="text/javascript">
            function RegistrationValidation(form) {// all field validation
                for (var i = 0; i < form.elements.length; i++) {
                    if (form.elements[i].value == "") {
                        window.swal({
                            title: "Error Occured!",
                            text: "Every field is required.",
                            type: "error",
                            confirmButtonText: "Try Again"
                        });
                        return false;
                    } else {
                        return true;
                    }
                }
            }
            var submitField = {//select country-division-district
                "Bangladesh": {
                    "Barisal": ["Barguna", "Barisal", "Bhola", "Jhalokati", "Patuakhali", "Pirojpur"],
                    "Dhaka": ["Dhaka", "Faridpur", "Gazipur", "Gopalganj", "Jamalpur", "Kishoreganj", "Madaripur", "Manikgang", "Munshigang", "Tangail"],
                    "Chittagong": ["Bandarbon", "Brahmonbaria", "Chandpur", "Chittagong", "Comilla", "Coxsbazar", "Feni", "Khagrachhari", "Lakshmipur", "Noakhali", "Rangamati"],
                    "Khulna": ["Bagherhat", "Cuadanga", "Jessore", "Jhinaida", "Khulna", "Shatkhira", "Narail"],
                    "Rajshahi": ["Bogra", "Jaipurhat", "Naogoan", "Natore", " Naoabganj", "Pabna", "Rajshahi", "Shirajganj"],
                    "Rangpur": ["Dinajpur", "Gaibandha", "Kurigram", "Lalmonirhat", "Nilphamari", "Panchgharh", "Rangpur", "Thakurgaong"],
                    "Sylhet": ["Hobiganj", "Moulovibazar", "Sunamganj", "Sylhet"]
                },
//                "India": {
//                    "Andhra Pradesh": ["Anantapur", "Chittor", "East Godavari", "Guntur", "Kadapa", "Krishna", "Kurnool", "Nellore", "Prakasam", "Srikakulam", "Visakhapatnam", "Vizianagaram", "West Godavari"],
//                    "Arunachal Pradesh": ["Tawang", "West Kameng", "East Kameng", "Papum Pare", "Kurung Kumey", "Kra Daadi", "Lower Subansiri", "Lower Subansiri", "Upper Subansiri", "West Siang", "East Siang", "Central Siang", "Upper Siang", "Lower Dibang Valley", "Upper Dibang Valley", "Anjaw", "Lohit", "Namsai", "Changlang", "Tirap", "Longding"],
//                    "Assam": ["Baksa#", "Barpeta", "Biswanath [1]", "Bongaigaon", "Cachar", "Charaideo[1]", "Chirang#", "Darrang", "Dhemaji", "Dhubri", "Dibrugarh", "Goalpara", "Golaghat", "Hailakandi", "Hojai[1]", "Jorhat", "Kamrup Metropolitan", "Kamrup", "Karbi Anglong", "Karimganj", "Kokrajhar#", "Lakhimpur", "Majuli", "Morigaon", "Nagaon", "Nalbari", "Dima Hasao", "Sivasagar", "Sonitpur", "South Salmara-Mankachar[1]", "Tinsukia", "Udalguri#", "West Karbi Anglong[1]"],
//                    "Bihar": ["Araria", "Arwal", "Aurangabad", "Banka", "Begusarai", "Bhabhua", "Bhagalpur", "Bhojpur", "Buxar", "Darbhanga", "East Champaran", "Gaya", "Gopalganj", "Jamui", "Jehanabad", "Katihar", "Khagaria", "Kishanganj"],
//                    "Chhattisgarh": ["Balod", "Baloda Bazar", "Balrampur", "Bemetara", "Bijapur", "Bilaspur", "Dantewada", "Dhamtari", "Durg", "Gariaband", "Jagdalpur (Madhya Bastar)", "Janjgir-Champa", "Jashpur", "Kabirdham", "Kanker", "Kondagaon", "Korba", "Koriya", "Mahasamund", "Mungeli", "Narayanpur", "Raigarh", "Raipur", "Rajnandgaon", "Sukma", "Surajpur", "Surguja"],
//                    "Goa": ["North Goa", "South Goa"],
//                    "Gujarat": ["Ahmedabad", "Amreli", "Anand", "Aravalli", "Banaskantha", "Bharuch", "Bhavnagar", "Botad", "Chhota Udaipur", "Dahod", "Dang", "Devbhoomi Dwarka", "Gandhinagar", "Gir Somnath", "Jamnagar", "Junagadh", "Kutch", "Kheda", "Mahisagar", "Mehsana", "Morbi", "Narmada	", "Navsari", "Panchmahal", "Patan", "Porbandar", "Rajkot", "Sabarkantha", "Surat", "Surendranagar", "Tapi", "Vadodara", "Valsad"],
//                    "Haryana": ["Ambala", "Bhiwani", "Faridabad", "Fatehabad", "Gurugram", "Hisar", "Jhajjar", "Jind", "Kaithal", "Karnal", "Kurukshetra", "Mahendragarh", "Mewat", "Palwal", "Panchkula", "Panipat", "Rewari", "Rohtak", "Sirsa", "Sonipat", "Yamuna Nagar"],
//                    "Humachal Pradesh": ["Bilaspur", "Chamba", "Hamirpur", "Kangra", "Kinnaur", "Kullu", "Lahaul and Spiti", "Mandi", "Shimla", "Sirmaur", "Solan", "Una"],
//                    "Kashmir": ["Anantnag District", "Bandipora District", "Baramulla district", "Budgam District", "Ganderbal District", "Kulgam District", "Kupwara District", "Pulwama District", "Shopian District", "Srinagar District"],
//                    "Jharkhand": ["Garhwa", "Palamu", "Latehar", "Chatra", "Hazaribag", "Koderma", "Giridih", "Ramgarh", "Bokaro", "Dhanbad ", "Lohardag", "Gumla", "Simdega", "Ranchi", "Khunti", "West Singhbhur", "Saraikela Kharsawa", "East Singhbhur", "Jamtara", "Deoghar", "Dumka", "Pakur", "Godda", "Sahebga"],
//                    "Karnataka": ["Bagalkot", "Belagavi", "Bellary", "Bengaluru Rural", "Bengaluru Urban", "Chamarajanagar", "Chikballapur", "Chikkamagaluru", "Chitradurga", "Dakshina Kannada", "Davanagere", "Dharwad", "Gadag", "Hassan", "Haveri", "Kalaburagi", "Kodagu", "Kolar", "Koppal", "Mandya", "Mysuru", "Raichur", "Ramanagara", "Shivamogga", "Tumakuru", "Udupi", "Uttara Kannada", "Vijayapura", "Yadgir"],
//                    "Kerala": ["Alappuzha", "Ernakulam", "Kannur", "Kasaragod", "Kollam", "Kottayam", "Kozhikode", "Malappuram", "Palakkad", "Pathanamthitta", "Thiruvananthapuram", "Thrissur", "Wayanad"],
//                    "Maydhya Pradesh": ["Indore", "Jabalpur", "Sagar", "Bhopal", "Rewa", "Satna", "Dhar", "Chhindwara", "Gwalior", "Ujjain"],
//                    "Maharashtra": ["Ahmednagar", "Akola", "Amravati", "Aurangabad", "Beed", "Bhandara", "Buldhana", "Chandrapur", "Dhule", "Gadchiroli", "Gondia", "Hingoli", "Jalgaon", "Jalna", "Kolhapur", "Latur", "Mumbai City", "Mumbai Suburban", "Nagpur", "Nanded", "Nandurbar", "Nashik", "Osmanabad", "Parbhani", "Pune", "Raigad", "Ratnagiri", "Sangli", "Satara", "Sindhudurg	", "Solapur", "Thane", "Wardha", "Washim", "Yavatmal", "Palghar"],
//                    "Manipur": ["Bishnupur", "Thoubal", "Imphal East", "Imphal West", "Senapati", "Ukhrul", "Chandel", "Churachandpur", "Tamenglong", "Jiribam", "  Kangpokpi   ", "Kakching", "Tengnoupal", "Kamjong", "Noney", "Pherzawl"],
//                    "Meghalaya": ["East Garo Hills", "West Garo Hills", "North Garo Hills", "South Garo Hills", "South West Garo Hills", "East Jaintia Hills", "West Jaintia Hills", "East Khasi Hills", "South West Khasi Hills", "West Khasi Hills", "Ri-Bhoi"],
//                    "Mizoram": ["Aizawl", "Lunglei", "Champhai", "Lawngtlai", "Mamit", "Kolasib", "Serchhip", "Saiha"],
//                    "Negaland": ["Dimapur", "Kohima", "Mon", "Tuensang", "Mokokchung", "Wokha", "Phek", "Zunheboto", "Peren", "Kiphire"],
//                    "Odisha": ["Ganjam", "Cuttack", "Mayurbhanj", "Baleshwar", "Khordha", "Sundargarh", "Jajapur", "Kendujhar", "Puri", "Balangir", "Kalahandi", "Bhadrak", "Bargarh", "Kendrapara", "Koraput", "Anugul", "Nabarangapur", "Dhenkanal", "Jagatsinghapur", "Sambalpur", "Rayagada", "Nayagarh", "Kandhamal", "Malkangiri", "Nuapada", "Subarnapur", "Jharsuguda", "Gajapati", "Baudh", "Debagarh"],
//                    "Punjab": ["Ludhiana", "Amritsar", "Gurdaspur", "Jalandhar", "Firozpur", "Patiala", "Sangrur", "Hoshiarpur", "Bathinda", "Tarn Taran"],
//                    "Rajasthan": ["Jaipur", "Jodhpur", "Alwar", "Nagaur", "Udaipur", "Sikar", "Barmer", "Ajmer", "Bharatpur", "Bhilwara"],
//                    "Sikkim": ["East Sikkim", "South Sikkim", "West Sikkim", "North Sikkim"],
//                    "Tamil Nadu": ["Chennai", "Kancheepuram", "Vellore", "Thiruvallur", "Salem", "Viluppuram", "Coimbatore", "Tirunelveli", "Madurai", "Tiruchirappalli"],
//                    "Tripura": ["West Tripura", "South Tripura", "North Tripura", "Dhalai"],
//                    "Uttar Pradesh": ["Allahabad", "Moradabad", "Ghaziabad", "Azamgarh", "Lucknow", "Kanpur Nagar", "Jaunpur", "Sitapur", "Bareilly", "Gorakhpur"],
//                    "Uttarakhand": ["Haridwar", "Dehradun", "Nainital", "Pauri Garhwal", "Almora", "Tehri Garhwal", "Pithoragarh", "Chamoli", "Uttarkashi"],
//                    "West Bengal": ["North Twenty Four Parganas", "South Twenty Four Parganas ", "Barddhaman", "Murshidabad", "Paschim Medinipur", "Hugli", "Nadia", "Purba Medinipur", "Haora", "Kolkata", "Maldah", "Jalpaiguri", "Bankura", "Birbhum", "Uttar Dinajpur", "Puruliya", "Koch Bihar"]
//
//                }
            };
            window.onload = function () { //select country-division-district
                var countrySel = document.getElementById("dpCountry");
                var divisionSel = document.getElementById("dpState");
                var districtSel = document.getElementById("dpDistrict");
                for (var country in submitField) {
                    countrySel.options[countrySel.options.length] = new Option(country, country);
                }
                countrySel.onchange = function () {
                    divisionSel.length = 1;
                    districtSel.length = 1;
                    if (this.selectedIndex < 1)
                        return;//done
                    for (var state in submitField[this.value]) {
                        divisionSel.options[divisionSel.options.length] = new Option(state, state);
                    }
                };
                countrySel.onchange();
                divisionSel.onchange = function () {
                    districtSel.length = 1;
                    if (this.selectedIndex < 1)
                        return;
                    var district = submitField[countrySel.value][this.value];
                    for (var i = 0; i < district.length; i++) {
                        districtSel.options[districtSel.options.length] = new Option(district[i], district[i]);
                    }
                };

            };
            function checkBloodGroup(dpBloodGroup) {//select blood group
                if (dpBloodGroup.value === "") {
                    dpBloodGroup.setCustomValidity('Please select blood group');
                    document.form.bloodGroup.focus();
                } else {
                    dpBloodGroup.setCustomValidity('');
                    return true;
                }
            }
            function checkGender(dpGender) {//select gender
                if (dpGender.value === "") {
                    dpGender.setCustomValidity('Please select gender');
                    document.form.bloodGroup.focus();
                } else {
                    dpGender.setCustomValidity('');
                    return true;
                }
            }

            function checkDistrict(dpDistrict) {//select district
                if (dpDistrict.value === "") {
                    dpDistrict.setCustomValidity('Please select district');
                    document.form.bloodGroup.focus();
                } else {
                    dpDistrict.setCustomValidity('');
                    return true;
                }
            }

            function  checkCategory(category) {//select registered category
                if (category.value === "") {
                    category.setCustomValidity('Please select category');
                    document.form.category.focus();
                } else {
                    category.setCustomValidity('');
                    return true;
                }
            }



        </script>

        <script>
            function strength_or_poor(password) {//password strength or poor verification
                var message;
                if (password.value.length < 8) {
                    message = "Poor";
                } else if (password.value.length > 8 && password.value.length < 12) {
                    message = "Strong";
                } else if (password.value.length > 12) {
                    message = "Too long";
                } else if (password.value.search(/\d/) === -1) {
                    message = "No number";
                } else if (password.value.search(/[a-zA-Z]/) === -1) {
                    message = "No letter";
                } else if (password.value.search(/[^a-zA-Z0-9\!\@\#\$\%\^\&\*\(\)\_\+\.\,\;\:]/) !== -1) {
                    message = "Bad char";
                } else {
                    message = "ok";
                }
                document.getElementById('strength_poor_location').innerText = message;
            }
        </script>

        <script>
            $("#dpBloodGroup").change(function () { //required to insert data both hidden field & jquery function
                $("#dpBloodGroup").val($(this).find('option:selected').val());


            });
        </script>

        <script>
            $("#dpGender").change(function () { //required to insert data both hidden field & jquery function
                $("#dpGender").val($(this).find('option:selected').val());

            });
        </script>


        <script>
            $("#dpCountry").change(function () {
                $("#dpCountry").val($(this).find('option:selected').val());

            });
        </script>
        <script>
            $("#dpState").change(function () {
                $("#dpState").val($(this).find('option:selected').val());

            });
        </script>
        <script>
            $("#dpDistrict").change(function () {
                $("#dpDistrict").val($(this).find('option:selected').val());
            });
        </script>
        <script>
            //using ajax for check exists user id
            function checkUserAlreadyExist() {
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["form"]["txtUserName"].value;
                var url = "user_already_exists.jsp?txtUserName=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

                        if (xmlhttp.responseText === "User already exists") {
                            document.getElementById("checkUserExistField").style.color = "red";
                        } else {
                            document.getElementById("checkUserExistField").style.color = "red";
                            document.getElementById("checkUserExistField").innerHTML = xmlhttp.responseText;
                        }
                    }

                };
                try {
                    //using get metthod to check database username
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                } catch (e) {
                    alert("unable to connect to server");
                }
            }
        </script>
        <script>
            //using ajax for check exists user id
            function checkEmailAlreadyExist() {
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["form"]["txtEmailId"].value;
                var url = "email_already_exists.jsp?txtEmailId=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

                        if (xmlhttp.responseText === "Email already exists")
                            document.getElementById("checkEmailExistField").style.color = "red";
                        else
                            document.getElementById("checkEmailExistField").style.color = "red";
                        document.getElementById("checkEmailExistField").innerHTML = xmlhttp.responseText;
                    }
                };
                try {
                    //using get metthod to check database username
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                } catch (e) {
                    alert("unable to connect to server");
                }
            }
        </script>

        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#submit").click(function () {
                    var txtUserName = $("#txtUserName").val();
                    var lname = $("#lname").val();
                    var txtEmailId = $("#txtEmailId").val();
                    var password = $("password").val();
                    var txtMobileNumber = $("#txtMobileNumber").val();
                    var Address = $("#Address").val();
                    var city = $("city").val();
                    var zip = $("zip").val();
                    var country = $("country").val();
                    $.post("customerregistration_action.jsp", {ajaxtxtUserName: txtUserName, ajaxlname: lname, ajaxtxtEmailId: txtEmailId,ajaxpassword: password, ajaxtxtMobileNumber: txtMobileNumber, ajaxAddress: Address, ajaxcity: city, ajaxzip: zip, ajaxcountry: country}, function (data) {
                        $("#loginpage").html(data);
                    });
                });
            });
        </script>

        <script>
            function mobileCheck(txtmobile) {
                var mobile_number_validation;
                var checkMobileNumberPattern = /^\d{11}$/;
                if (!txtmobile.value.match(checkMobileNumberPattern)) {
                    mobile_number_validation = "Invalid Number!";
                } else {
                    mobile_number_validation = "Valid  Number....";
                }
                document.getElementById('mobile_number').innerHTML = mobile_number_validation;
            }

        </script>
        <script>
            function emailCheck(txtemail) {
                var email_address_validation;
                var checkEmailId = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (!txtemail.value.match(checkEmailId)) {
                    email_address_validation = "Invalid Email!";
                } else {
                    email_address_validation = "Valid Email.....";
                }
                document.getElementById('email_address').innerHTML = email_address_validation;
            }

        </script>

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
                                    <h1>Registration</h1>
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
            
<script type="text/javascript">
function Confirm(form){
alert("Sign up successfully!"); 
form.submit();
}
</script>                                                  


                                    <h5><small>STEP 2</small><a href="#">Registration</a></h5>

                                    <div class=" clearfix">
                                        <form class="billing-form clearfix" method="post" action="customersignupaction.jsp">
                                            <fieldset >
                                                <label>First name</label>
                                                 <input onblur="checkUserAlreadyExist()" name="fname" id="txtUserName" type="text"  />
<!--                                             <input id="txtFullName" name="txtFullName" type="text" maxlength="100" id="txtFullName" style="width: 155px"/>-->
                                                <label>E-mail Address</label>
<!--                                                <input type="text"name="email" placeholder="Enter email"/>-->
                                                 <input onkeyup="emailCheck(this)" onblur="checkEmailAlreadyExist()" name="email" type="email" class="txtEmailId" id="txtEmailId" placeholder="shadathcse@gmail.com" />
                                            </fieldset>

                                            <fieldset class="last">
                                                <label>Last Name</label>
                                               <input id="lame" name="lname" type="text" maxlength="100" id="txtFullName" style="width: 155px"/>
                                                 <label>Country</label>
                                                <select select id="country" name="country" class="columnwidth1">
                                                    <option>America</option>
                                                    <option>Bangladesh</option>
                                                    <option>India</option>
                                                    <option>Ireland</option>
                                                    
                                                </select>
                                                
                                                
                                            </fieldset >
                                           <fieldset class="last">
                                                <label>Password</label>
                                            <input type="password" name="password"  placeholder="Enter password" required  id="password" onkeyup="strength_or_poor(this)"/>
<!--                                                <input  type="password" name="password"  required  id="password" onkeyup="strength_or_poor(this)"/>-->
<!--                                                <table>
                                                <tr>
                                        <td id="strength_poor_location" style="width: 50px; color: red; font-size:20px  ">                          
                                        </td>
                                        <td valign="left" height="70">
                                            <input type="checkbox" name="show-hide"  id="show-hide" onchange='togglePassword(this);'/>
                                        </td>
                                        <td style="width: 100px" >
                                            <span id='toggleText'>Show</span>
                                        </td>
                                    </tr>
                                                </table>-->
                                            </fieldset>
                                            <fieldset class="last">
                                                <label>Phone</label>
                                                <input name="phone" type="text" id="txtMobileNumber" style="width:155px" required onkeyup="mobileCheck(this)" />
                                              
                                            </fieldset>
                                            
                                            
                                            <label>Address</label>
                                            <input type="text"name="Address" placeholder="Enter address"/>
                                            
                                            
                                            <fieldset class="last">
                                                <label>City</label>
                                                <input type="text"name="city" placeholder="Enter city"/>
                                                
                                               
                                            </fieldset>
                                              <fieldset class="last">
                                                
                                                <label>Zip/Postal Code</label>
                                                <input type="text"name="zip" placeholder="Entetr Postal code"/>
                                               
                                            </fieldset>

                                            

                                    <input type="submit" name="Submit" value="continue" class="red-button" onClick="Confirm(this.form)"  >     

<!--                                            <input type="submit" value="continue" class="red-button" id="submit" name="submit" value="Submit"  onclick="return RegistrationValidation(this)">-->

                                        </form>
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