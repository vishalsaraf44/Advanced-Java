<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	{
%>
	<div>	 
	<h5 style="color: orange;"><marquee>Profile Updated</marquee></h5>
	</div>
	<div>
		<jsp:include page="UserHome.jsp"></jsp:include>
	</div>
<%
}
%>