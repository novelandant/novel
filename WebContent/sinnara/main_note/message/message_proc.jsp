<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="prj.novel.note.NoteGetDto"%>
<%@ page import="prj.novel.note.NoteGetDao"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="noteDao" class="prj.novel.note.NoteGetDao" />
<jsp:useBean id="noteDto" class="prj.novel.note.NoteGetDto" />

<%
	String msgGubun = request.getParameter("message_gubun");
	String msgMode = request.getParameter("message_mode");
	int msgNum = Integer.parseInt(request.getParameter("message_num"));
	
	if (msgMode.equals("message_del")) {
		noteDao.deleteNote(msgNum, msgGubun);
	}
	else {
		noteDao.keepMessage(msgNum, msgGubun);
	}
%>

<script>
	alert("처리가 완료되었습니다.");
	location.href="receive_message_list.jsp";
</script>
