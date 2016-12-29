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
	request.setCharacterEncoding("euc-kr");
 
	int idx = 1;
	String title = request.getParameter("comm_title");
	String writer = request.getParameter("comm_writer");
	String password = request.getParameter("comm_password");
	String regdate = request.getParameter("comm_regdate");
	String content = request.getParameter("comm_content");
	int count = 0;
	PreparedStatement pstmt = null;
	Connection con = null;
 
	try{
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
		String uid = "novel";
		String upw = "1111";
		
		Class.forName(driverName);
		con = DriverManager.getConnection(url, uid, upw);
		
		String sql = "INSERT INTO comm_board "+				 
           "(comm_title, comm_writer, comm_regdate, comm_count, comm_content, comm_password) "+
			"values(?, ?, now(), ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
 
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setInt(3, count);
		pstmt.setString(4, content);
		pstmt.setString(5, password);
		
		pstmt.executeUpdate();
		
	}catch(Exception e){
		out.println("db 연결 실패");
		out.print(e.getMessage());
		e.printStackTrace();
	}finally{
		 if(pstmt != null) try{pstmt.close();}catch(Exception e){}
		 if(con != null) try{con.close();}catch(Exception e){}
		 out.print("<script>location.href='list.jsp';</script>");
		}
%>
</body>
</html>