<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>LPU e-Banking | Admin Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Net Banking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
<link href="css/owl.theme.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/cm-overlay.css" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- animation -->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!-- //animation --> 
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({
 
		autoPlay: 3000, //Set AutoPlay to 3 seconds
		autoPlay:true,
		items : 3,
		itemsDesktop : [640,5],
		itemsDesktopSmall : [414,4]
 
	});
	
}); 
</script>

</head>
<body>

<%
  	String pass=(String)session.getAttribute("pass");
  	if(pass==null)
  	{
		%>
		<div>
			<h5 style="color: orange;"><marquee>Sorry,Your session is expired</marquee></h5>
			<jsp:include page="index.html"></jsp:include>
		</div>
		<%
	}
	else
	{
%>
	<!-- banner -->
	<div class="banner">
		<!--header-->
		<div class="header">
			<div class="container">		
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<h1><a  href="index.html">LPU<span>e-BANK</span></a></h1>
					</div>
					<!--navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
   							<li><a href="#list" class="active">All Accounts</a></li>
							<li><a href="#newadmin" class="scroll">Add New Admin</a></li>
							<li><a href="#feepay" class="scroll">Fee Deposit</a></li>							
							<li><a href="logout.jsp">Log Out</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
      	<div class="welcome" id="welcome">
		<div class="container">
			<div class="w3-welcome-heading">
				<h2>Welcome Admin</h2>
			</div>
			
		</div>
	</div>

    <div class="about" id="list">
		  <div class="w3-welcome-heading">
				<h3>All Exsiting Accounts</h3>
				<p>&nbsp;</p>
				<div align="center">
				  <%
					try
					{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Vish123");
					  	PreparedStatement ps=con.prepareStatement("select *from admintable where password=?");
						ps.setString(1,pass);
						ResultSet rs1=ps.executeQuery();
						if(rs1.next())
						{	
							PreparedStatement ps1=con.prepareStatement("select * from accounttable");
							ResultSet rs=ps1.executeQuery();
							%>
		        	      	  <table border="4" cellpadding="10" cellspacing="10"> 
			                	<th width="633"><h1 align="center">Account No. </h1></th><th width="632"><h1 align="center">Current Balance</h1></th>
			                <%
								while(rs.next())
								{	
							%>					
				                  <div class="w3-welcome-heading">
				                    <tr><td><h1 align="center"><%=rs.getLong(1)%></h1></td><td><h1 align="center"><%=rs.getInt(2)%></h1></td></tr>
			                        </div>
		   				  	<%
								}
							%>
	                	      </table>
						  <%
						}
						else
						{
							%>
							<h1>Your session is expired</h1>
							<%
						}
					}
					catch(Exception e)
					{
						out.println(e);
					} 
				%>
		        </div>
			</div>
		</div>

</div>

	<div class="services contact">
		
	<div class="services" id="newadmin">
		<div class="w3-welcome-heading">
			<h3>Add New Admin Account</h3>
				<div class="container">
				<form method="post" action="addadmin.jsp" >
					UID : <br><input type="text" name="uid" required pattern="[0-9]*"><br>
        	        Name : <br><input type="text" name="aname" required ><br>
        	        E-mail : <br><input type="text" name="aemail" required><br>
					Password : <br><input type="password" name="apass" required><br>
					Phone No. : <br><input type="text" name="acno" required pattern="[0-9]*"><br>
          			<center><input type="submit" value="Add"></center>
          		</form> 
          		</div>
		</div>
	</div>
	

	
	<div class="services" id="feepay">
		<div class="w3-welcome-heading">
			<h3>Fee Payment</h3>
				<div class="container">
				<form method="post" action="feepay.jsp">
					Reg. No. : <br><input type="text" name="regno" placeholder="Student Reg. No." required pattern="[0-9]*"><br>
        	        Name : <br><input type="text" name="name" placeholder="Name" required ><br>
					Amount : <br><input type="text" name="apass" placeholder="Rs." required pattern="[0-9]*"><br>
					<h4><center><select name="feetype">
						<option value="Semfee">Semester Fee</option>
						<option value="Hostelfee">Hostel Fee</option>
						<option value="Foodfee">Food Fee</option>
						<option value="Backlogfee">Backlog Fee</option>
					</select></center></h4>
          			<center><input type="submit" value="Pay"></center>
          		</form> 
          		</div>
		</div>
	</div>
	


	</div>

<!-- footer -->
	<div class="jarallax footer">
		<div class="container">
			<div class="footer-logo">
				<h3><a href="index.html">LPU<span>e-Bank</span></a></h3>
			</div>
			<div class="copyright">
				<p>© 2017 LPU BANK. All rights reserved</p>
			</div>
		</div>
	</div>
	<!-- //copyright -->
	<script src="js/jarallax.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		})
	</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/owl.carousel.js"></script>  
<%
}
%>
</body>	
</html>