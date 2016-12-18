<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.user.User" %>
<%@ page import="prj.novel.logininput.Database" %>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("password");

	User user = Database.findByUserId(id);
	
	if(User.login(id, pass)) {
		session.setAttribute("id", id);
		
	}
	
	
	
	
	
	
	/*
	if(user == null) {
		// 사용자가 존재하지 않는다는 것을 에러메시지로 처리!
		
	}
	
	
	if(pass.equals(user.getPass()));
		// 로그인 처리!
	*/
%>