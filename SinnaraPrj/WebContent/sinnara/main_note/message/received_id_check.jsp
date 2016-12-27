<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.note.NoteGetDao"%>

<jsp:useBean id="noteDao" class="prj.novel.note.NoteGetDao" />

<%
	String sendID = request.getParameter("sendID");
	boolean result = noteDao.isExistID(sendID);
	String resultMsg = "";
	
	if (result) {
		resultMsg = "수신자 아이디 체크 성공";
	}
	else {
		resultMsg = "입력하신 아이디는 존재하지 않거나 이미 탈퇴한 아이디 입니다.";
	}
%>
<%= resultMsg %>
