<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="prj.novel.note.NoteGetDao"%>

<jsp:useBean id="noteDao" class="prj.novel.note.NoteGetDao" />

<%
	String sendID = request.getParameter("sendID");
	boolean result = noteDao.isExistID(sendID);
	String resultMsg = "";
	
	if (result) {
		resultMsg = "������ ���̵� üũ ����";
	}
	else {
		resultMsg = "�Է��Ͻ� ���̵�� �������� �ʰų� �̹� Ż���� ���̵� �Դϴ�.";
	}
%>
<%= resultMsg %>
