<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="prj.novel.qna.BoardDao"/>
<jsp:useBean id="dto" class="prj.novel.qna.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
request.setCharacterEncoding("euc-kr");
String qna_subject = request.getParameter("qna_subject");
String qna_content = request.getParameter("qna_content");
String qna_pass = request.getParameter("qna_pass");

if(qna_subject != "" && qna_content != "" && qna_pass != "") {
	dao.insertBoard(dto);
%>
	<script>
		alert("���� ��ϵǾ����ϴ�.");
		location.href="QnA.jsp";
	</script>
	
<%
}
else {
%>
<script>
	alert("������ ĭ�� �ֽ��ϴ�.");
	history.back();
</script>
<% 
}
%>
