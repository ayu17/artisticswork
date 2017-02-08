<%
	session.removeAttribute("file_name");
	session.removeAttribute("user_name");
	session.removeAttribute("normal");
	session.removeAttribute("admin");
	response.sendRedirect("index.jsp");
%>