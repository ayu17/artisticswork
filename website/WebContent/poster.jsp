<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Artistic Works</title><link href="mytheme.css" rel="stylesheet" type="text/css">
</head>
<body>
 <a href="adminpage.jsp"><h2>Artistic Works</h2></a><h5 align="center">(A Poster Exclusive)</h5><% 
 try{
String path=(String)session.getAttribute("file_name");
String a1=request.getParameter("t2");
String a2=request.getParameter("t3");
String a3=request.getParameter("t4");
session.setAttribute("file_name",null);
if(path!=null && path!="" && a1!=null && a1!="" && a2!=null && a2!="" && a3!=null && a3!="")
    

    %>
    <%@ include file="connect.jsp" %>
    <% 
	    Statement st=con.createStatement(); 
	    int i=st.executeUpdate("insert into images values('"+path+"','"+a1+"','"+a2+"','"+a3+"')");
               
        
	    st.close();
con.close();
        
         
        
        if(i!=0){  
          %>
          <h1 align="center"><%=a1%> has been saved <br><a href="addposter.jsp"> Click </a> to add another poster </h1>  
        <div align="center">Back to <a href="adminpage.jsp">Admin Panel</a></div>

<%
        }  
        else{  
        	  %>
              <h2 align="center">Failed to add <br> click to <a href="addposter.jsp">Try Again</a> </h2>  

    <%
         }  
        }
      
        catch(Exception e)
        {%><h1 align="center"> Error uploading Poster <br> <% out.println(""+e); %></h1>
        <% 
       	 
       	 
        }
             


      %>
      

</body>
</html>