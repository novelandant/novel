<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
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
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
	String uid = "novel";
	String upw = "1111";
	
	String password = "";
	
	try{
		String idx = request.getParameter("comm_idx");
		String title = request.getParameter("comm_title");
		String content = request.getParameter("comm_content");
		String pass1 = request.getParameter("comm_password");
	
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, uid, upw);
		Statement stmt = con.createStatement();
		
		String sql = "select comm_password from comm_board where comm_idx=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			password = rs.getString("comm_password");
		}
		if(password.equals(pass1)){
			sql = "UPDATE comm_board SET comm_title='" + title+ "', comm_content='"+ content +"' WHERE comm_idx=" + idx;				
			stmt.executeUpdate(sql);
%>
		 <script>
			self.window.alert("글이 수정되었습니다.");
			location.href="content.jsp?comm_idx=<%=idx%>";
		 </script>
<%
 
			rs.close();
			stmt.close();
			con.close();
			
		} else {
%>
			<script>
				self.window.alert("비밀번호가 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%			
		}
		 
 } catch(Exception e) {
	out.println(e.toString());
} 
 
%>
</body>
</html>