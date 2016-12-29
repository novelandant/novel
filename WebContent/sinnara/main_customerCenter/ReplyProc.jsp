<%@page import="prj.novel.notice.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="prj.novel.notice.BoardDao"/>
<jsp:useBean id="childDto" class="prj.novel.notice.BoardDto"/>
<jsp:setProperty property="*" name="childDto" />

<%
	BoardDto parentDto = dao.getBoard(childDto.getNotice_num(), "reply");
	dao.replyUpdatePos(parentDto);

	childDto.setNotice_depth(parentDto.getNotice_depth());
	childDto.setNotice_pos(parentDto.getNotice_pos());
	dao.replyBoard(childDto);

%>
	<script>
		alert("답변이 등록되었습니다.");
		location.href="main_customerCenter.jsp";
	</script>
