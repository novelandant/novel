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
		request.setAttribute("errorMessage", "존재하지 않는 사용자입니다.");
	}	
	
	// if(User.loginEmail(email, pass)) {
	//	session.setAttribute("email", email);
	//}
	
	
	out.println(email + " : " + pass + " : ");
	
	
	
	
	
	
	
	/*
	if(user == null) {
		// 사용자가 존재하지 않는다는 것을 에러메시지로 처리!
		
	}
	
	
	if(pass.equals(user.getPass()));
		// 로그인 처리!
	*/
%>