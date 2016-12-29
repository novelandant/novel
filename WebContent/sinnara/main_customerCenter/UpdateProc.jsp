<%@page import="prj.novel.notice.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="prj.novel.notice.BoardDao"/>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("notice_name");
	String subject = request.getParameter("notice_subject");
	String content = request.getParameter("notice_content");
	String pass = request.getParameter("notice_pass");
	int num = Integer.parseInt(request.getParameter("notice_num"));

	
	BoardDto dto = dao.getBoard(num, "update");
	
	if(dto.getNotice_pass().equals(pass)){
		BoardDto board = new BoardDto();
		board.setNotice_name(name);
		board.setNotice_subject(subject);
		board.setNotice_content(content);
		board.setNotice_pass(pass);
		board.setNotice_num(num);
		
		dao.updateBoard(board);
		response.sendRedirect("main_customerCenter.jsp");
	}
	
	else{	
%>
	<script>
		alert("패스워드가 다릅니다.");
		history.back();
	</script>
<%
	}
%>

