<%@page import="prj.novel.registmember.Member_Dto"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("member_id");
		String pw = request.getParameter("member_pass");
	%>
	<jsp:useBean id="dao" class="prj.novel.logininput.Login_Dao" />
	<%
		
		if(dao.certify(id).getMember_pass() != null) {
			if (dao.certify(id).getMember_pass().equals(pw)) {
				session.setAttribute("loginID", id);
		
		%>
			<script>
				alert("로그인 되었습니다.");
				location.href="/SinnaraPrj/sinnara/index.jsp";
			</script>
		<% }	else { %>
		 		<script>
					alert("ID와 비밀번호를 확인하세요.");
					location.href = "login.jsp";
				</script>
		 <%
			}
		}
		else {
		%>
			<script>
				alert("ID와 비밀번호를 확인하세요.");
				location.href = "login.jsp";
			</script>
		<% } %>
</body>
</html>