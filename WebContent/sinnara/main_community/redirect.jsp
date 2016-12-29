<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
	String uid = "novel";
	String upw = "1111";
	String pass = "";
	String password = null;
	String idx = request.getParameter("comm_idx");
	String passw = request.getParameter("comm_password");
	
	try{
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, uid, upw);
		Statement stmt = con.createStatement();
		
		String sql = "select comm_password from comm_board where comm_idx=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			password = rs.getString(1);
		}
		if(password.equals(passw)){
			sql = "delete from comm_board where comm_idx=" + idx;
			stmt.executeUpdate(sql);
%>
			<script>
			self.window.alert("해당 글을 삭제했습니다.");
			location.href="list.jsp"; 
			</script>
<%
		rs.close();
		stmt.close();
		con.close();
		}else{
%>
		<script>
		self.window.alert("비밀번호가 틀렸습니다.");
		location.href="javascript:history.back()";
		</script>
<%
			}
		}catch(Exception e){
			out.println(e.toString());
		}
%>
<hr>
<br>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>