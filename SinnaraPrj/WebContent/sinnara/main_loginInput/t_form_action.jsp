<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.user.User" %>
<%@ page import="prj.novel.logininput.Database" %>
<!--
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
-->
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	

	User user = new User(id, pass, nickname, email);
	Database.addUser(user);
	
	out.println(id + " : " + pass + " : " + nickname + " : " + email);
	
	response.sendRedirect("/SinnaraPrj/sinnara/index.jsp");
	
%>
<!-- 
</body>
</html>
-->