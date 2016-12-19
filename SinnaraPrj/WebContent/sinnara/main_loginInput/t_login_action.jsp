<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.user.User" %>
<%@ page import="prj.novel.logininput.Database" %>
<%@ page import="prj.novel.user.UserNotFoundException" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="prj.novel.user.PasswordMismatchException"%>
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("password");

	// User user = Database.findByUserId(id);
	// User user = Database.findByUserEmail(email);
	
	
	try {
		User.loginEmail(email, pass);
		session.setAttribute("email", email);
		
		response.sendRedirect("/SinnaraPrj/sinnara/index.jsp");
	} catch (UserNotFoundException e) { // ����ڰ� ���� ��	
		request.setAttribute("errorMessage", "�������� �ʴ� ������Դϴ�.");
		
		RequestDispatcher rd = request.getRequestDispatcher("/SinnaraPrj/sinnara/index.jsp");
		rd.forward(request, response);
	} catch (PasswordMismatchException e) { // ��й�ȣ Ʋ�� ��
		request.setAttribute("errorMessage", "��й�ȣ�� Ʋ���ϴ�.");
		
		RequestDispatcher rd = request.getRequestDispatcher("/SinnaraPrj/sinnara/index.jsp");
		rd.forward(request, response);
	}
	
	
		
	// response.sendRedirect("/SinnaraPrj/sinnara/index.jsp");
	
%>