<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.note.NoteGetDao"%>

<jsp:useBean id="noteDao" class="prj.novel.note.NoteGetDao" />

<%
	String loginUser = (String)session.getAttribute("loginID");
	int rowCount = noteDao.getCountUnreadMessage(loginUser);
%>
<%= rowCount %>

