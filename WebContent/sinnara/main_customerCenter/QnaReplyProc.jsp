<%@page import="prj.novel.qna.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="prj.novel.qna.BoardDao"/>
<jsp:useBean id="childDto" class="prj.novel.qna.BoardDto"/>
<jsp:setProperty property="*" name="childDto" />

<%
	BoardDto parentDto = dao.getBoard(childDto.getQna_num(), "reply");
	dao.replyUpdatePos(parentDto);

	childDto.setQna_depth(parentDto.getQna_depth());
	childDto.setQna_pos(parentDto.getQna_pos());
	dao.replyBoard(childDto);

%>
	<script>
		alert("답변이 등록되었습니다.");
		location.href="QnA.jsp";
	</script>
