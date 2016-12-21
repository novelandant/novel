<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="prj.novel.note.NoteGetDto"%>
<%@ page import="prj.novel.note.NoteGetDao"%>

<%
	request.setCharacterEncoding("euc-kr");
%>


<jsp:useBean id="noteDao" class="prj.novel.note.NoteGetDao" />
<jsp:useBean id="noteDto" class="prj.novel.note.NoteGetDto" />

<jsp:setProperty property="*" name="noteDto"/>

<%
	noteDao.writeMessage(noteDto);
%>

<script>
	alert("답장이 전송되었습니다.");
	location.href="receive_message_list.jsp";
</script>
