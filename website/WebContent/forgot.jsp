<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Artistic Works</title>
<link rel="stylesheet" href="style.css">
 <script type="text/javascript">
     function f1(n1)
     {
var a1=n1.value;
if(a1=='')
    {
    
alert('Please Enter Email Id');
return false;

}
else
    {
return true;    
}
 

}
function f2(n2)
{

var a1=n2.value;
if(a1=='')
    {
    
alert('Please Enter  Password');
return false;

}
else
    {
return true;    
}


}
function f3(n3)
{

var a1=n3.value;
if(a1=='')
    {
    
alert('Please Enter  Password again');
return false;

}
else
    {
return true;    
}


}
function f4(n2,n3)
{
var a1=n2.value;
var a2=n3.value;

if(a1==a2)
    {
    

return true;

}
else
    {alert('Please Enter  Password again');
return false;    
}
}
 </script>
</head>
<body><br><br>
<a href="index.jsp"> <h2>Artistic Works</h2></a><br><br><h5 align="center">(A Poster Exclusive)</h5>
<section class="container">
   
 <div class="login">
  
    <h1>Forgot Password</h1>
    
  <form method="post" action="password.jsp">
      
  <p><input type="text" name="n1" value="" placeholder=" Enter Username or Email"></p>
   <p><input type="password" name="n2" value="" placeholder="Password"></p>
<p><input type="password" name="n3" value="" placeholder="Confirm password"></p>
<p class="submit"><input type="submit" name="b1" value="Submit" onclick="return f1(n1),f2(n3),f3(n3),f4(n2,n3)"></p>
</form>
</div>
</section>
</body>
</html>