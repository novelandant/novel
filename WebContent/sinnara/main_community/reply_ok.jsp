<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String driverName = "com.mysql.jdbc.Driver";
	Class.forName(driverName);
	String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
	String uid = "novel";
	String upw = "1111";
	
	String writer = request.getParameter("comm_writer");
	String password = request.getParameter("comm_password");
	String title = request.getParameter("comm_title");
	String content = request.getParameter("comm_content");
	String idx = request.getParameter("comm_idx");
	
	try{
		int ref = 0;
		int indent = 0;
		int step = 0;
		
		Connection con = DriverManager.getConnection(url, uid, upw);
		Statement stmt = con.createStatement();
		
		String sql = "select comm_ref, comm_indent, comm_step from comm_board where comm_idx=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE comm_board SET comm_step=comm_step+1 where comm_ref="+ref+" and comm_step>" +step;
		stmt.executeUpdate(sql);
		
		sql = "insert into comm_board(comm_writer, comm_password, comm_title, comm_content, comm_ref, comm_indent, comm_step) values(?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, writer);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		pstmt.execute();
 
		rs.close();
		stmt.close();
		pstmt.close();
		con.close();
	}catch(Exception e){
		
	}
%>
<script>
	self.window.alert("답글을 입력했습니다.");
	location.href="list.jsp";
</script>
</body>
</html>