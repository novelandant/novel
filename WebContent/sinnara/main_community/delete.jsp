<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� ����</title>
<%@ include file="/sinnara/commons/_header.jspf" %>
<script>
	function deleteCheck(){
		var form = document.deleteform;
		if(!form.password.value){
			alert("��й�ȣ�� �Է��ϼ���");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
<%
	String idx = request.getParameter("comm_idx");
%>
<form name=deleteform method=post action="redirect.jsp?comm_idx=<%=idx%>">
<table align="center">
  <tr>
   <td>
    <table>
     <tr style="repeat-x; text-align:center;">
      <td width="5"></td>
      <td></td>
      <td width="5"></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">��й�ȣ</td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="����" onclick="javascript:deleteCheck();">
       <input type=button value="���" onclick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</form>
<hr>
<br>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>