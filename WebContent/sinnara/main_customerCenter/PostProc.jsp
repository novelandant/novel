<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="prj.novel.notice.BoardDao"/>
<jsp:useBean id="dto" class="prj.novel.notice.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>


<%
request.setCharacterEncoding("euc-kr");
String notice_subject = request.getParameter("notice_subject");
String notice_content = request.getParameter("notice_content");
String notice_pass = request.getParameter("notice_pass");

if(notice_subject != "" && notice_content != "" && notice_pass != "") {
	dao.insertBoard(dto);
%>
	<script>
		alert("글이 등록되었습니다.");
		location.href="main_customerCenter.jsp";
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


