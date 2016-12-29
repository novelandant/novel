<%@page import="prj.novel.qna.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="prj.novel.qna.BoardDao"/>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("qna_name");
	String subject = request.getParameter("qna_subject");
	String content = request.getParameter("qna_content");
	String pass = request.getParameter("qna_pass");
	int num = Integer.parseInt(request.getParameter("qna_num"));
	
	BoardDto dto = dao.getBoard(num, "Update");
	
	if(dto.getQna_pass().equals(pass)){
		BoardDto board = new BoardDto();
		board.setQna_name(name);
		board.setQna_subject(subject);
		board.setQna_content(content);
		board.setQna_pass(pass);
		board.setQna_num(num);
		
		dao.updateBoard(board);
		response.sendRedirect("QnA.jsp");
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

