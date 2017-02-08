<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Artistic Works</title>
<style type="text/css">
h5{
  color:#ffffff;
  font-family: Jokerman,fantasy;}</style>
 <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
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
    
alert('Password do not match');
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
    {alert('Password do not match');
return false;    
}
} </script>
</head>
<body><br><br>
  <a href="index.jsp"><h2>Artistic Works</h2></a><br><br><h5 align="center">(A Poster Exclusive)</h5>
<section class="container">
   
 <div class="login">
  
    <h1>Sign up</h1>
    
  <form method="post" action="registered.jsp">
      
  <p><input type="text" name="n1" value="" placeholder="Username or Email"></p>
        
<p><input type="password" name="n2" value="" placeholder="Password"></p>
<p><input type="password" name="n3" value="" placeholder="Confirm password"></p>
<br><br>
<h3 style="font-size:20px"><a href="Signin.jsp">Sign in -></a></h3>
<p class="submit"><input type="submit" name="b1" value="Register" onclick="return f1(n1),f2(n2),f3(n3),f4(n2,n3)"></p>
</form>
</div>
</section>


</body>
</html>