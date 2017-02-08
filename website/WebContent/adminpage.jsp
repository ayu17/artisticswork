<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
     <%
String type[]=request.getParameterValues("c1");
    String format[]=request.getParameterValues("c2");
    
    String query="select * from images";
    if(type!=null){
    	query+=" where img_type='"+type[0]+"'";
    	 for(int i=1;i<type.length;i++)
    		    query+="or img_type='"+type[i]+"'";
    	 if(format!=null){
    		 
    		 for(int i=0;i<format.length;i++)
     		    query+="or img_name like '%"+format[i]+"'";
    	 }
    	
    }
    if(format!=null && type==null)
    {query+=" where img_name like '%"+format[0]+"'";
    for(int i=1;i<format.length;i++)
		    query+="or img_name like '%"+format[i]+"'";
    if(type!=null){
    for(int i=0;i<type.length;i++)
	    query+=" or img_type='"+type[i]+"'";
    }
    
    }
    
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="mytheme1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%if(session.getAttribute("admin")!=null)
{

%>
<div class="container" >

<div align="right"><h6>Welcome <%out.print(""+session.getAttribute("admin"));%></h6>
</div>
	
</div>
<div id="header">
 <a href="adminpage.jsp"><h2>Artistic Works</h2></a><h5 align="center">(A Poster Exclusive)</h5></div><br>
 
<div id="menu" style="position:top;text-align:center;">

<nav>
<ul>
<li><a href="adminpage.jsp">HOME</a></li>
<li><a href="#">DESIGNERS</a>
</li>
<li><a href="#">CREATE YOUR OWN</a>
</li>
<li><a href="get.html">GET ONE PUBLISHED</a></li>

<li><a href="about.html">ABOUT US</a></li>
<li><a href="addposter.jsp">ADD POSTER</a></li>
<li><a href="#">VIEW AS</a>
<ul><li><a href="index.jsp">Visitor</a></li>
<li><a href="index.jsp">Normal User</a></li>

</ul>
</li>
</ul>
</nav>
</div><br>
<section id="content">
<form action="adminpage.jsp?=Search">

<div align="left"style="position:fixed;">
<input type="text" name="t1" placeholder="Search Here" value=""/>
<input type="submit" onclick="return f1(t1)" value="Search"/></div>
</form></section><br>
<section id="content">
<form action="index.jsp?=filter">
<div style="position:fixed;">
<h1 style="color:yellow; padding:0px;">FILTER BY</h1>
<h3 style="color:red;"><div style="color:green; font-size:18px;" >Categories:</div>
<input type="checkbox" name="c1" value="Abstract">Abstract<br>
<input type="checkbox" name="c1" value="Photography">Photography<br>
<input type="checkbox" name="c1" value="Hand made">Hand made<br>
<input type="checkbox" name="c1" value="Movies">Movies<br>
<input type="checkbox" name="c1" value="Music">Music<br></h3><br>
<h3 style="color:blue;"><div style="color:green; font-size:18px;">Format:</div>
<input type="checkbox" name="c2" value=".jpg">jpg<br>
<input type="checkbox" name="c2" value=".png">png<br>
<input type="checkbox" name="c2" value=".tiff">tiff<br>
<input type="checkbox" name="c2" value=".gif">gif<br><br><input type="submit" value="Filter"/></h3>
</div></form></section>
<% 
   String s1=request.getParameter("t1");
if(type!=null || format!=null)
{
	%>

	<%@ include file="connect.jsp" %>
	<%

	Statement st= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	
	int count=0;
	
query+=" limit 0,5";

	ResultSet rs = st.executeQuery(query);

	while(rs.next()){ 
		String imgname=rs.getString(1);
		count++;
		
		%>
		
		<center><figure><img oncontextmenu="return false;"  src="Images/<%=imgname%>" align="middle" width="600" height="400"><figcaption> <%if(session.getAttribute("user_name")!=null)
			 {
			%><div align="center"><a href="payment.jsp">Download</a></div>
				<%}%><%=imgname %></figcaption></figure></center><br>
	<% 
					}
	boolean x=rs.last();
	if(x!=false && count==6)
	{
	%><br><br><br><br><div align="center"  ><a href="index1.jsp?=<%=count%>">Next Page</a></div>
	<% }

			if(x!=true)
			{
	%> <br>
		<h3 align="center">No Results Found</h3>
		<%}

		int rowCount = rs.getRow();

		rs.close();
		st.close();
		con.close();




} 


else if(s1!=null && s1!="")
{	
%>

<%@ include file="connect.jsp" %>
<%

Statement st= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
String sql;

sql=("select img_name from images where img_name like '%"+s1+"%' or format like '%"+s1+"%' or img_type like '%"+s1+"%'  ");


ResultSet rs = st.executeQuery(sql);

while(rs.next()){ 
	String imgname=rs.getString(1);
	
	
	%><br>
	<br>
	
	<center><figure><img oncontextmenu="return false;" src="Images/<%=imgname%>" align="middle" width="700" height="400"><figcaption><%=imgname %></figcaption></figure></center>
	
	<% 
				}
boolean x=rs.last();
		if(x!=true)
		{
%> <br>
	<h3 align="center">No Results Found</h3>
	<%}

	int rowCount = rs.getRow();

	rs.close();
	st.close();
	con.close();
}
	else
	{	
	%>
	
<%@ include file="connect.jsp" %>
<%
	
	Statement st= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	String sql;

	sql=("select img_name from images order by  upload_date desc");


	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){ 
		String imgname=rs.getString(1);
		%><br>
		<br>
		
		<center><figure><img oncontextmenu="return false;" src="Images/<%=imgname%>" align="middle" width="700" height="400">
		<figcaption><%=imgname %>
		<div align="center" style="text-color:green;"><a href="Images/<%=imgname %>">Download</a></div></figcaption></figure></center>
<%
		}
		// move to the end of the result sett
		rs.last();
		// get the row number of the last row which is also the row count
		int rowCount = rs.getRow();
		rs.close();
		st.close();
		con.close();	
	}


    %>

<footer style="position:fixed; left:0px; right:0px; bottom:0px; text-align:right;">
  
<h1><a href="logout.jsp">Sign out</a>&nbsp;&nbsp;</h1>
</footer>
<% 
}
else
{ response.sendRedirect("logout.jsp");

}
     
%>
</body>
</html>