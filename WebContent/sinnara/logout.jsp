<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	session.removeAttribute("id");
	session.invalidate();
%>
<script>
location.href="/SinnaraPrj/sinnara/index.jsp";
</script>