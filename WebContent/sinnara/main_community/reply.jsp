<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>커뮤니티 게시판</title>
<%@ include file="/sinnara/commons/_header.jspf" %>
<script>
	function replyCheck(){
		var form = document.replyform;
		form.submit();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
	String uid = "novel";
	String upw = "1111";
	
	String idx = request.getParameter("comm_idx");
	String title = "";
	
	try{
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, uid, upw);
		Statement stmt = con.createStatement();
		
		String sql = "select comm_title from comm_board where comm_idx=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			title = rs.getString("comm_title");
		}
		rs.close();
		stmt.close();
		con.close();
	}catch(Exception e){
		
	}
%>
<form name=replyform method=post action="reply_ok.jsp?comm_idx=<%=idx%>">
	<table align="center">
	  <tr>
	   <td>
	    <table>
	     <tr style="repeat-x; text-align:center;">
	      <td width="5"></td>
	      <td>답글</td>
	      <td width="5"></td>
	     </tr>
	    </table>
	   <table>
	     <tr>
	      <td>&nbsp;</td>
	      <td align="center">제목</td>
	      <td><input name="title" size="50" maxlength="100" value="<%=title%>"></td>
	      <td>&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">이름</td>
	      <td><input name="name" size="50" maxlength="50"></td>
	      <td>&nbsp;</td>
	     </tr>
	      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">비밀번호</td>
	      <td><input name="name" size="50" maxlength="50"></td>
	      <td>&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr>
	      <td>&nbsp;</td>
	      <td align="center">내용</td>
	      <td><textarea name="contents" cols="50" rows="13"></textarea></td>
	      <td>&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
	     <tr align="center">
	      <td>&nbsp;</td>
	      <td colspan="2">
	      	<input type=button value="등록" onclick="javascript:replyCheck();">
	      	<input type=button value="취소" onclick="javascript:history.back(-1)">
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