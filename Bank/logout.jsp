<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	{
%>
	<div>	 
<%
	session.invalidate();
%>
	<h5 style="color: orange;"><marquee>Logout Successfully</marquee></h5>
	</div>
	<div>
		<jsp:include page="index.html"></jsp:include>
	</div>
<%
}
%>