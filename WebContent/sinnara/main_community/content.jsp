<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>
<% 
	String idx = request.getParameter("comm_idx");
	
 
	try{
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
		String uid = "novel";
		String upw = "1111";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, uid, upw);
		ResultSet rs = null;
		Statement stmt = con.createStatement();
		
		String sql = "select * from comm_board where comm_idx=" + idx;
		rs = stmt.executeQuery(sql);  
		
		if(rs.next()){
				int count = rs.getInt("comm_count");
				count++;
%>
 
<table align="center">
	  <tr>
	   <td>
	    <table>
	     <tr style="repeat-x; text-align:center;">
	      <td width="5"></td>
	      <td>게시글 조회</td>
	      <td width="5"></td>
	     </tr>
	    </table>
	   <table>
	     <tr>
	      <td width="0">&nbsp;</td>
	      <td align="center" width="76">글번호</td>
	      <td width="319"><%=rs.getString("comm_idx")%></td>
	      <td width="0">&nbsp;</td>
	     </tr>
		 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	    <tr>
	      <td width="0">&nbsp;</td>
	      <td align="center" width="76">조회수</td>
	      <td width="319"><%=rs.getString("comm_count")%></td>
	      <td width="0">&nbsp;</td>
	     </tr>
		 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	    <tr>
	      <td width="0">&nbsp;</td>
	      <td align="center" width="76">이름</td>
	      <td width="319"><%=rs.getString("comm_writer")%></td>
	      <td width="0">&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	    <tr>
	      <td width="0">&nbsp;</td>
	      <td align="center" width="76">작성일</td>
	      <td width="319"><%=rs.getString("comm_regdate")%></td>
	      <td width="0">&nbsp;</td>
	     </tr>
	      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	    <tr>
	      <td width="0">&nbsp;</td>
	      <td align="center" width="76">제목</td>
	      <td width="319"><%=rs.getString("comm_title")%></td>
	      <td width="0">&nbsp;</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	     <tr>
	      <td width="0">&nbsp;</td>
	      <td width="399" colspan="2" height="200"><%=rs.getString("comm_content")%>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
	     <tr align="center">
	      <td width="0">&nbsp;</td>
	      <td colspan="2" width="399">
	    <input type=button value="수정" OnClick="window.location='modify.jsp?comm_idx=<%=idx%>'">
		<input type=button value="답글" OnClick="window.location='reply.jsp?comm_idx=<%=idx%>'">
		<input type=button value="목록" OnClick="window.location='list.jsp'">
		<input type=button value="삭제" OnClick="window.location='delete.jsp?comm_idx=<%=rs.getString("comm_idx")%>'">
	      <td width="0">&nbsp;</td>
	     </tr>
	    </table>
	   </td>
	  </tr>
 </table>
 <%
		sql = "update comm_board set comm_count=" + count + " where comm_idx=" + idx;
 		stmt.executeUpdate(sql);
		}
		con.close();
	}catch(Exception e){
		out.println("db 연결 에러<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
 %>
<hr>
<br>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>