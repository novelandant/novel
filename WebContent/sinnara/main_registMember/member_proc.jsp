<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!-- scope ���� ���ϸ�, �ٸ� �ν��Ͻ� ������. -->
<jsp:useBean id="dao" class="prj.novel.registmember.Member_Dao" />
<jsp:useBean id="dto" class="prj.novel.registmember.Member_Dto" />
<jsp:setProperty property="*" name="dto" />

<%
	dao.insertMember_info(dto);
%>
<script>
	alert("ȸ������ �ǽ� ���� ���ϵ帳�ϴ�.");
	// �Ѿ �������� �Ķ���� �� ����
	location.href = "../index.jsp";
</script>

