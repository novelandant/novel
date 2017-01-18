<%@page import="java.awt.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!-- scope 설정 안하면, 다른 인스턴스 생성됨. -->
<jsp:useBean id="dao" class= "prj.novel.itemshop.ItemShop_Dao"/>
<jsp:useBean id="dto" class="prj.novel.itemshop.ItemShop_Dto" />
<jsp:setProperty property="*" name="dto"/>

<!--
param 값이 property와 다를 때는 반드시 명시!!
<jsp:setProperty property="util_kind" name="dto" param="b_name"/>
-->

<%
 
	
	String pur_history = request.getParameter("pur_history");
	String history[] = pur_history.split(",");
	
	dao.insertPur_History(history, dto);
	 
	//넘어갈 페이지와 파라미터 값 전달(아래 코드와 같은 의미)
	//response.sendRedirect("pur_history.jsp?pur_num="+dto.getPur_num());
%>
<script>
	alert("정상결제 되었습니다.");
	// 넘어갈 페이지와 파라미터 값 전달
	location.href="pur_history.jsp?pur_num="+<%=dto.getPur_num()%>;
</script>

