<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="connect.jsp" %>

<%
try{
	
	if(session.getAttribute("normal")=="a")
	{
Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select * from login where user_id='"+request.getParameter("n1")+"'");
					
					
					rs.last();
					String username_login;
					String password_login;
					
					if(rs.getRow()>0){
							username_login=rs.getString("user_id");
							password_login=rs.getString("password");
							if(password_login.equals(request.getParameter("n2"))){
						
								session.setAttribute("user_name",username_login);
								
								response.sendRedirect("index.jsp?=user_name");
							}
							else{
								 {
								        out.println("<br/><br/><br/><br/><h3 align='center'><font color='red'>Invalid User. <br/><br/>Enter correct id<br> <a href='Signin.jsp'>Click</a> to Login</font></h3>");
								        }
							}
					}
					else{
						 {
						        out.println("<br/><br/><br/><br/><h3 align='center'><font color='red'>Invalid User. <br/><br/>Enter correct id<br> <a href='Signin.jsp'>Click</a> to Login</font></h3>");
						        }
					}
					
					stmt.close();
					con.close();
			}
	
	else
	{
		Statement stmt=con.createStatement();
						ResultSet rs=stmt.executeQuery("select * from adminlogin where admin_id='"+request.getParameter("n1")+"'");
							
							
							rs.last();
							String username_login;
							String password_login;
							
							if(rs.getRow()>0){
									username_login=rs.getString("admin_id");
									password_login=rs.getString("password");
									if(password_login.equals(request.getParameter("n2"))){
								
										session.setAttribute("admin",username_login);
										session.setAttribute("user_name",username_login);
										response.sendRedirect("adminpage.jsp?=admin");
									}
									else{
										 {
										        out.println("<br/><br/><br/><br/><h3 align='center'><font color='red'>Invalid User. <br/><br/>Enter correct id<br> <a href='adminlogin.jsp'>Click</a> to Login</font></h3>");
										        }
									}
							}
							else{
								 {
								        out.println("<br/><br/><br/><br/><h3 align='center'><font color='red'>Invalid User. <br/><br/>Enter correct id<br> <a href='adminlogin.jsp'>Click</a> to Login</font></h3>");
								        }
							}
							
							stmt.close();
							con.close();
					}


}
			catch(SQLException e){
				System.out.print(e);
			}
			
				
					
					
		%>