<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="prj.novel.note.NoteGetDto"%>
<%@ page import="prj.novel.note.NoteGetDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("euc-kr");
%>


<jsp:useBean id="noteDao" class="prj.novel.note.NoteGetDao" />

<c:forEach items="${paramValues.message_idx}" var="message_idx">
	<c:set var="messageNum" value="${message_idx}" />
	<% 
		String msgGubun = request.getParameter("message_gubun");
		
		String sMsg = (String)pageContext.getAttribute("messageNum");
		int messageNum = Integer.parseInt(sMsg);
	 %>
	
	<c:if test="${param.message_mode=='message_del'}">
		<% noteDao.deleteNote(messageNum, msgGubun); %>
	</c:if>
	
	<c:if test="${param.message_mode=='message_store'}">
		<%	noteDao.keepMessage(messageNum, msgGubun); %>
	</c:if>
</c:forEach>

<script>
	alert("처리가 완료되었습니다.");
	location.href="receive_message_list.jsp";
</script>



