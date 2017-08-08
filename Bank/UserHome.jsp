<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>LPU e-Banking | Student Home </title>
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
	<!-- banner -->
<div class="banner">
	<!--header-->
	<div class="header">
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
						<li><a href="UserHome.jsp" class="active" >Home Page</a></li>
						<li><a href="#Profile" class="scroll">Profile</a></li>
						<li><a href="#transfer" class="scroll">Send Money</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle effect-3" data-toggle="dropdown">Fee Management Portal<b class="caret"></b></a>
							<ul class="dropdown-menu agile_short_dropdown">
								<li><a href="feedepositeslip.pdf">Download Fee Deposit Slip</a></li>
								<li><a href="#payfee" class="scroll">Online Fee Payment</a></li>
								<li><a href="TransactionTable.jsp">Check All Transactions</a></li>
								<li><a href="#loanapply" class="scroll">Apply loan Request</a></li>
							</ul>
						</li>
						<li><a href="#delete" class="scroll">Close Account</a></li>
						<li><a href="logout.jsp">Log Out</a></li>
					</ul>	
					<div class="clearfix"> </div>	
				</div>
			</nav>
		</div>
	</div>
	
		<!-- welcome -->
    <div class="welcome contact" id="welcome">
		<div class="container about">
			<div class="w3-welcome-heading">
				<h2>Welcome <%=	session.getAttribute("name").toString() %></h2><br>
				<%
					int acc=Integer.parseInt(session.getAttribute("id").toString());
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Vish123");
					PreparedStatement ps1=con.prepareStatement("select * from accounttable where accno=?");
					ps1.setInt(1,acc);
					ResultSet rs=ps1.executeQuery();
					while(rs.next())
					{	
				%>
	               <h4>
	               	<center>
	               	Your Current Account Balance is : Rs.<%=rs.getInt(2)%><br>
	                <form action="addmoney.jsp" method="post">
	                <input type="submit" value="Add Money" /></h4></center>
	                </form>
					<%
	                	}
					}
					catch(Exception e)
					{
						out.println(e);
					} 
	             %> 				
                <h3>Thank You For Using Our Services</h3><br>
			</div>
		</div>
	</div>

	<!-- Profile -->
	<div class="about contact" id="Profile">
		<div class="container w3-welcome-heading">
				<h3>Profile</h3>
                <h1><b>Profile Details :</b></h1>          
            <%	
               String pass=session.getAttribute("password").toString();
			   int accno=Integer.parseInt(session.getAttribute("id").toString());
			   String photoname=session.getAttribute("id").toString();
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
					<img src="image/<%=photoname%>.jpg" style= "width: 150px;height: 150px" >	
					<form action="EditProfile.jsp" method="post" enctype="multipart/form-data">
					<input type="submit" value="Change Profile Photo">
					</form>
	               <h4>
	               	Reg. No. : <%=rs.getLong(9)%><br>
	               	Acc. No. : <%=rs.getLong(5)%><br>
	               	Name : <%=rs.getString(1)%><br>
	                Email : <%=rs.getString(2)%><br>
	                Contact No. : <%=rs.getLong(4)%><br>
	              	F.Name : <%=rs.getString(6)%><br>
	                Age : <%=rs.getInt(7)%><br>
	                City : <%=rs.getString(8)%><br>
	                </h4>
	                <center><h4><a href="EditProfile.jsp" >Change</a></h4></center>
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
<!-- Banner -->
	    	<!-- Profile -->
	    	<div class="banner"></div>
		<!-- Money Transfer -->
		<div class="services contact" id="transfer" >
		
			<div class="container w3-welcome-heading">
					<h3>Send Money</h3>
					<form action="sendmoney.jsp" method="post" >
		           	<h4>Your Account No. : <input type="text" name="accno" value="<%= accno %>" readonly/><br>
		           	Amount : <input type="text" name="amount" placeholder="Rs." required pattern="[0-9]*" /><br>
		               Your Friend Account No. : <input type="text" name="faccno" required pattern="[0-9][0-9][0-9][0-9][0-9][0-9]" /></h4><br>
	   	            <center><input type="submit" value="Send"></center>
	   	            </form>
	    	</div>    
		</div>
	    	<div class="banner "></div>
	   	<!-- Money Transfer -->
	       <div class="container contact" id="payfee">

			<div class="container w3-welcome-heading">
					<h3>Pay Fee</h3>			
	        </div>    
	        <%
	        int bacno=999999;
	        %>
	        <form action="payfee.jsp" method="post">
						LPU'S Bank Acc. No. : <input type="text" name="baccno" value="<%= bacno %>" readonly ><br>
						Amount : <input type="text" name="amount" placeholder="Amount" required pattern="[0-9]*" /><br>
						<center><select name="reason">
						<option value="Semester Fee">Semester Fee</option>
						<option value="Hostel Fee">Hostel Fee</option>
						<option value="Food Fee">Food Fee</option>
						<option value="Backlog Fee">Backlog Fee</option>
						<option value="Library Fine">Library Fine</option>
						</select></center><br>
						<center><input type="submit" value="Pay"></center>
					</form>
	    </div>

	    	<div class="banner"></div>

	<div class="services contact" id="delete">
		<div class="w3-welcome-heading">
			<h3>Close Account</h3>
				<div class="container">
	                <form action="deleteaccount.jsp" method="post">
	        	        Please Enter Current Password*(For Security Reasons): <br><input type="password" name="dpass" required ><br>
						<center><input type="submit" value="Close"></center>
    	             </form>
          		 </div>
		</div>
	</div>
<div class="banner"></div>
	<div class="services contact" id="loanapply">
		<div class="w3-welcome-heading container">
			<h3>Loan Applicant</h3>
				<div class="container">
					<h1>Documents Required for Applying for Educational Loan</h1>
					<ul>
						<li>Admission letter of the Educational Institute giving details of fee, boarding and lodging expenses. Letter confirming scholarship, if any.</li>
						<li>Attested copies of documents for proof of age/date of birth and proof of residential address.</li>
						<li>Passport size photo of the applicant, co-obligants and guarantors.</li>
						<li>Copy of the PAN card of student and Parents Borrower</li>
						<li>Copy of marksheets/degree certificates of previous academic qualifications.</li>
						<li>Income proof/latest income tax return of parents/co-obligants, guarantors. (if any)</li>
						<li>Details/statements of Bank accounts held by the student applicant/co-obligant(s)/guarantors (if any) for the last six months.</li>
						<li>Details of collateral security alongwith valuation certificate of Govt approved valuer (if any). (In case of loan amount more than Rs: 4.00 Lacs)</li>
					</ul>
          		 </div>
          		 <center><input type="submit" Value="Apply" onclick="loanapply()"></center>
		</div>
	</div>
	<script type="text/javascript">
		function loanapply() 
		{
			alert("Loan Application Applied.We will contact you very soon")
		}
	</script>
   	<!-- Fee Payment -->
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