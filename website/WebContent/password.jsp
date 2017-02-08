<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Artistic Works</title><link href="mytheme.css" rel="stylesheet" type="text/css">
</head>
<body>
 <a href="index.jsp"><h2>Artistic Works</h2></a><h5 align="center">(A Poster Exclusive)</h5> <%
 try{
 
String a1=request.getParameter("n1");
String a2=request.getParameter("n2");
String a3=request.getParameter("n3");
if(a1!=null && a1!="" && a2!=null && a2!="" && a3!=null && a3!="")
    

     
        
	 
	   
	  
	   
	  
	   
	      %>
	      <%@ include file="connect.jsp" %><% 
               
	    PreparedStatement pstmt4;

	    pstmt4 = con.prepareStatement("UPDATE login SET password=? WHERE user_id=?");
	    pstmt4.setString(1,a2);
	    pstmt4.setString(2,a1);
	   int i= pstmt4.executeUpdate();


        
         
        String msg=" ";
        if(i!=0){  
          %>
          <h1 align="center">Password for <%=a1%> has been Changed <br> click to <a href="Signin.jsp">login </a> </h1>  

<%
        }  
        else{  
        	 %>
             <h1 align="center">Failed to Change the Password <br> click to <a href="forgot.jsp">Try Again</a> </h1>  

   <%
         }  
        pstmt4.close();
      con.close();
 }
 catch(Exception e)
 {%><h1 align="center"> Error changing Password <br> <% out.println(""+e); %></h1>
 <% 
	 
	 
 }
      %>
</body>
</html>