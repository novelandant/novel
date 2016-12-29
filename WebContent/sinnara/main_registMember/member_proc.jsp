<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!-- scope 설정 안하면, 다른 인스턴스 생성됨. -->
<jsp:useBean id="dao" class="prj.novel.registmember.Member_Dao" />
<jsp:useBean id="dto" class="prj.novel.registmember.Member_Dto" />
<jsp:setProperty property="*" name="dto" />

<%
	dao.insertMember_info(dto);
%>
<script>
	alert("회원가입 되신 것을 축하드립니다.");
	// 넘어갈 페이지와 파라미터 값 전달
	location.href = "../index.jsp";
</script>

