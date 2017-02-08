<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Artistic Works</title><link href="mytheme.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="right">
<%if(session.getAttribute("user_name")!=null)
{out.print("Welcome "+session.getAttribute("user_name"));%>
<div id="header">
 <a href="index.jsp"><h2>Artistic Works</h2></a><h5 align="center">(A Poster Exclusive)</h5></div><br>
<h1 align="center">Payment Portal</h1>
<footer style="position:fixed; left:0px; right:0px; bottom:0px; text-align:right;">
	  
	<a href="logout.jsp">Sign out</a>&nbsp;&nbsp;
	</footer>
<%
}
else
{
response.sendRedirect("index.jsp");	

}
%></div>
</body>
</html>