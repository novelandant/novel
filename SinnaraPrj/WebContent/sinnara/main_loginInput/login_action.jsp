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
		// ����ڰ� �������� �ʴ´ٴ� ���� �����޽����� ó��!
		
	}
	
	
	if(pass.equals(user.getPass()));
		// �α��� ó��!
	*/
%>