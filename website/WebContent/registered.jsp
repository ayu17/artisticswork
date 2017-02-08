<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Artistic Works</title>
<link href="mytheme1.css" rel="stylesheet" type="text/css">
</head>
<body>
 <a href="index.jsp"><h2>Artistic Works</h2></a><h5 align="center">(A Poster Exclusive)</h5><%
 
try{
String a1=request.getParameter("n1");
String a2=request.getParameter("n2");
String a3=request.getParameter("n3");
if(a1!=null && a1!="" && a2!=null && a2!="" && a3!=null && a3!="")
    

      
        
	 
	   
	  
	 %>
	 <%@ include file="connect.jsp" %> 
	 <% 
	    Statement st=con.createStatement(); 
	    int i=st.executeUpdate("insert into login values('"+a1+"','"+a2+"')");
               
        
	    st.close();

        con.close();
         
        
        if(i!=0){  
          %>
          <h2 align="center"><%=a1%> has been registered <br> click to <a href="Signin.jsp">login </a> </h2>  

<%
        }  
        else{  
        	  %>
              <h2 align="center">Failed to register <br> click to <a href="Signup.jsp">Try Again</a> </h2>  

    <%
         }  
        
      

}
 catch(Exception e)
 {
	 %><br><h3 align="center">Failed to Register&nbsp;<br>
	 <% out.println(""+e);
	  }

      %></h3>
</body>
</html>