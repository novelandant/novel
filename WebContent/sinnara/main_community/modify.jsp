<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>커뮤니티 게시글 수정</title>
<%@ include file="/sinnara/commons/_header.jspf" %>
<script>
	function modifyCheck(){
		var form = document.modifyform;
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
	
	String writer = "";
	String password = "";
	String title = "";
	String content = "";
	String idx = request.getParameter("comm_idx");
	
	try{
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, uid, upw);
		Statement stmt = con.createStatement();
		
		String sql = "select comm_writer, comm_password, comm_title, comm_content from comm_board where comm_idx=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			writer = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			content = rs.getString(4);
		}
		rs.close();
		stmt.close();
		con.close();
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<form name=modifyform method=post action="modify_ok.jsp?comm_idx=<%=idx%>">
	<table align="center">
	  <tr>
	   <td>
	    <table>
	     <tr style="repeat-x; text-align:center;">
	      <td width="5"></td>
	      <td>수정</td>
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
	      <td><%=writer%><input type="hidden" name="name" size="50" maxlength="50" value="<%=writer%>"></td>
	      <td>&nbsp;</td>
	     </tr>
	      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">비밀번호</td>
	      <td><input type="password" name="password" size="50" maxlength="50"></td>
	      <td>&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr>
	      <td>&nbsp;</td>
	      <td align="center">내용</td>
	      <td><textarea name="content" cols="50" rows="13"><%=content%></textarea></td>
	      <td>&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
	     <tr align="center">
	      <td>&nbsp;</td>
	      <td colspan="2">
	      	<input type=button value="수정"  OnClick="javascript:modifyCheck();">
	       	<input type=button value="취소" OnClick="javascript:history.back(-1)">
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