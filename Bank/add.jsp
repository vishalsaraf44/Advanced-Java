<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int amount=Integer.parseInt(request.getParameter("amount"));
	int curr_bal=0;
	int accno=Integer.parseInt(session.getAttribute("id").toString());
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Vish123");
		PreparedStatement ps=con.prepareStatement("select * from accounttable where accno=?");
		ps.setInt(1,accno);
		ResultSet rs1=ps.executeQuery();
		if(rs1.next())
		{	
			curr_bal = rs1.getInt(2);
		}
		int update_bal=curr_bal+amount;
		PreparedStatement ps1=con.prepareStatement("update accounttable set balance=? where accno=?");
		ps1.setInt(1,update_bal);
		ps1.setInt(2,accno);
		int rs2=ps1.executeUpdate();
		if(rs2>0)
		{	
		%>
			<h5 style="color: orange;"><marquee>Money Added </marquee></h5>
			<jsp:include page="UserHome.jsp"></jsp:include>
		<%
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}				
%>