<% 

	session.removeAttribute("Username");
	session.invalidate();
%>

<%
	response.sendRedirect("PatientLogin.jsp");
%>