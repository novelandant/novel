<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.user.User" %>
<%@ page import="prj.novel.logininput.Database" %>
<%@page import="prj.novel.user.UserNotFoundException"%>
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("password");

	// User user = Database.findByUserId(id);
	// User user = Database.findByUserEmail(email);
	
	try {
		User.loginEmail(email, pass);
		session.setAttribute("email", email);
		
		response.sendRedirect("index.jsp");
	} catch (UserNotFoundException e) {	
		request.setAttribute("errorMessage", "�������� �ʴ� ������Դϴ�.");
	}	
	
	// if(User.loginEmail(email, pass)) {
	//	session.setAttribute("email", email);
	//}
	
	
	out.println(email + " : " + pass + " : ");
	
	
	
	
	
	
	
	/*
	if(user == null) {
		// ����ڰ� �������� �ʴ´ٴ� ���� �����޽����� ó��!
		
	}
	
	
	if(pass.equals(user.getPass()));
		// �α��� ó��!
	*/
%>