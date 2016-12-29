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
		alert("글이 등록되었습니다.");
		location.href="QnA.jsp";
	</script>
	
<%
}
else {
%>
<script>
	alert("공백인 칸이 있습니다.");
	history.back();
</script>
<% 
}
%>
