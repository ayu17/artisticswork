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
<title>Artistic Works</title>
<link href="mytheme.css" rel="stylesheet" type="text/css">
<style type="text/css">



select {
	width:8%;
    padding:3px;
    margin: 0;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
    -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
    box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
    background: #f8f8f8;
    color:#888;
    border:none;
    outline:none;
    display: inline-block;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    cursor:pointer;
}
label {position:relative;}
label:after {
    content:">";
    font:11px "Consolas", monospace;
    color:#aaa;
    -webkit-transform:rotate(90deg);
    -moz-transform:rotate(90deg);
    -ms-transform:rotate(90deg);
    transform:rotate(90deg);
    right:8px; top:2px;
    padding:0 0 2px;
    border-bottom:1px solid #ddd;
    position:absolute;
    pointer-events:none;
}
label:before {
    content:'';
    right:6px; top:0px;
    width:20px; height:20px;
    background:#f8f8f8;
    position:absolute;
    pointer-events:none;
    display:block;
}
</style>
<script type="text/javascript">
function f1(n1)
{
var a1=n1.value;
if(a1=='')
{

alert('Please Enter a Search String');
return false;

}
else
{
return true;    
}
}


</script>
</head>
<body> 
<div class="container" >
<section id="content">





 
<div align="right">Welcome 
<% if(session.getAttribute("user_name")!=null)
	{out.print(""+session.getAttribute("user_name")); 
	%><footer style="position:fixed; left:0px; right:0px; bottom:0px; text-align:right;">
	  
	<a href="logout.jsp">Sign out</a>&nbsp;&nbsp;
	</footer> 
	<%
	}
else 
	{
	%>
	guest &nbsp;&nbsp;&nbsp;
	<label>
	<select name="t1" onchange="location = this.options[this.selectedIndex].value;">
 <option value="#">Sign in as</option>
 <option value="Signin.jsp">Normal User</option>
 <option value="adminlogin.jsp">Admin</option>
</select></label>
	<% } %>
	
	
	
	

</div>
	
</section></div>


<div id="header">
 <a href="index.jsp"><h2>Artistic Works</h2></a><h5 align="center">(A Poster Exclusive)</h5></div>
<div id="menu" style="position:top;text-align:center;">
<br><br>
<nav>
<ul>
<li><a href="index.jsp">HOME</a></li>
<li><a href="Design.jsp">DESIGNERS</a>

</li>
<li><a href="Own.jsp">CREATE YOUR OWN</a>

</li>
<li><a href="publish.jsp">GET ONE PUBLISHED</a></li>

<li><a href="about.jsp">ABOUT US</a></li>


</ul>
</nav>
</div>
<section id="content"><form action="index.jsp?=Search">
<div align="left" style="position:fixed;">
<input type="text" name="t1" placeholder="Search Here" value=""/>
<input type="submit" onclick="return f1(t1)" value="Search"/></div>
</form>
</section>
<br>
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
	
query+=" limit 6,11";

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
	if(x!=false && count==12)
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
int count=6;
Statement st= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
String sql;

sql=("select img_name from images where img_name like '%"+s1+"%' or format like '%"+s1+"%' or img_type like '%"+s1+"%' limit 6,11 ");


ResultSet rs = st.executeQuery(sql);

while(rs.next()){ 
	String imgname=rs.getString(1);
	
	
	%>
	
	<center><figure><img oncontextmenu="return false;" src="Images/<%=imgname%>" align="middle" width="700" height="400" border=10><figcaption> <%if(session.getAttribute("user_name")!=null)
		 {
		%><div align="center"><a href="payment.jsp">Download</a></div>
			<%}%><%=imgname %></figcaption></figure></center><br>
	
	<% 
				}
%><div align="center"><a href="index.jsp">Back</a>&nbsp;&nbsp;<%
boolean x=rs.last();

if(x!=false && count==12)
{
%>|&nbsp;&nbsp;<a href="index2.jsp?=<%=count%>">Next</a></div><% }
else
	
{%><jsp:forward page="index.jsp"></jsp:forward><%}

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
	
	
	int count=6;
	sql=("select img_name from images order by  upload_date desc limit 6,11 ");


	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){ 
		String imgname=rs.getString(1);
		count++;
		
		 %>
		
		
		<center><figure><img oncontextmenu="return false;" src="Images/<%=imgname%>" align="middle" width="700" height="400" border=10><figcaption> <%if(session.getAttribute("user_name")!=null)
		 {
		%><div align="center"><a href="payment.jsp">Download</a></div>
			<%}%><%=imgname %></figcaption></figure></center><br>
<%
		}
	%><div align="center"><a href="index.jsp">Back</a>&nbsp;&nbsp;<%
	boolean x=rs.last();
	
	if(x!=false && count==12)
	{
	%>|&nbsp;&nbsp;<a href="index2.jsp?=<%=count%>">Next</a></div><% }
else
		
	{%><jsp:forward page="index.jsp"></jsp:forward><%}
		// move to the end of the result sett
		rs.last();
		// get the row number of the last row which is also the row count
		int rowCount = rs.getRow();
		rs.close();
		st.close();
		con.close();	
	}


    %>

</body>
</html>