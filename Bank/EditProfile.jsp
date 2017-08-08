<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>LPU e-Banking | User Home </title>
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
  	String check=(String)session.getAttribute("password");
  	if(check==null)
  	{
		%>
		<div>
			<h5 style="color: orange;"><marquee>You Are Not Authorized To Access This Page Without Login.Please Login First</marquee></h5>
			<jsp:include page="index.html"></jsp:include>
		</div>
		<%
	}
	else
	{
%>

<div class="header banner">
		<div class="container">		
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1><a  href="index.html">LPU<span>e-BANK</span></a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="UserHome.jsp" >Home Page</a></li>
						<li><a href="#Profile" class="active">Edit Profile</a></li>
					</ul>	
					<div class="clearfix"> </div>	
				</div>
			</nav>
		</div>
	</div>


	<div class="contact container">
			<center>
				<form action="StudentProfileUpdated.jsp" method="post" enctype="multipart/form-data">
					<input type="file" name="image" accept="image/jpeg" />
					<input type="submit" value="Upload Profile Photo">
				</form>
			</center>
            <h4><b>Edit Profile :</b></h4>            
            <%	
               String pass=session.getAttribute("password").toString();
			   int accno=Integer.parseInt(session.getAttribute("id").toString());
			   try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Vish123");
					PreparedStatement ps1=con.prepareStatement("select * from usertable where accno=? and password=?");
					ps1.setInt(1,accno);
					ps1.setString(2,pass);
					ResultSet rs=ps1.executeQuery();
					while(rs.next())
					{	
				%>
	               <h5>
	               <form action="SaveChanges.jsp" method="post">
	               	Reg. No. : <input type="text" value="<%=rs.getLong(9)%>" name="regno" required pattern="[0-9]*" ><br>
	               	Name : <input type="text" value="<%=rs.getString(1)%>" name="name" required ><br>
	                Email : <input type="text" value="<%=rs.getString(2)%>" name="email" required ><br>
	                Contact No. : <input type="text" value="<%=rs.getLong(4)%>" name="cno" required pattern="[0-9]*"><br>
	              	F.Name : <input type="text" value="<%=rs.getString(6)%>" name="fname" required ><br>
	                Age : <input type="text" value="<%=rs.getInt(7)%>" name="age" required pattern="[0-9][0-9]" ><br>
	                City : <input type="text" value="<%=rs.getString(8)%>" name="city" required ><br>
	                <center><h4><input type="submit" value="Save"></h4></center>
	                </form>
	                </h5>
					<%
	                	}
					}
					catch(Exception e)
					{
						out.println(e);
					} 
	             %> 
	    </div>
	<!-- footer -->
	<div class="jarallax footer">
		<div class="container">
			<div class="footer-logo">
				<h3><a href="index.html">LPU<span>Bank</span></a></h3>
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