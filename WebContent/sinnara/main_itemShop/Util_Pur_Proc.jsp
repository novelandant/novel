<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!-- scope ���� ���ϸ�, �ٸ� �ν��Ͻ� ������. -->
<jsp:useBean id="dao" class= "prj.novel.itemshop.ItemShop_Dao"/>
<jsp:useBean id="dto" class="prj.novel.itemshop.ItemShop_Dto" />
<jsp:setProperty property="*" name="dto"/>

<!--
param ���� property�� �ٸ� ���� �ݵ�� ���!!
<jsp:setProperty property="util_kind" name="dto" param="b_name"/>
-->

<%
	String pur_history = request.getParameter("pur_history");
	String history[] = pur_history.split(",");
	
	dao.insertPur_History(history, dto);
	//�Ѿ �������� �Ķ���� �� ����(�Ʒ� �ڵ�� ���� �ǹ�)
	//response.sendRedirect("pur_history.jsp?pur_num="+dto.getPur_num());
%>
<script>
	alert("������� �Ǿ����ϴ�.");
	// �Ѿ �������� �Ķ���� �� ����
	location.href="pur_history.jsp?pur_num="+<%=dto.getPur_num()%>;
</script>

