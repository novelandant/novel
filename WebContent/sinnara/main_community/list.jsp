<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ŀ�´�Ƽ</title>
<%@ include file ="/sinnara/commons/_header.jspf" %>
</head>
<body>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Ŀ�´�Ƽ<small> ��ü �� ����</small></h2>
<hr>
<%
	request.setCharacterEncoding("euc-kr");
	
	try{
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://192.168.1.236:3306/sinnaradb";
		String uid = "novel";
		String upw = "1111";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, uid, upw);
		ResultSet rs = null;
		Statement stmt = con.createStatement();
		
		String sql = "select * from comm_board order by comm_idx desc";
		rs = stmt.executeQuery(sql);  
		
%>
	<table align="center">
		<tr style="repeat-x; text-align:center;">
			<td width='5'></td>
			<td width='73'>��ȣ</td>
			<td width='379'>����</td>
			<td width='73'>�ۼ���</td>
			<td width='164'>�ۼ���</td>
			<td width='58'>��ȸ��</td>
			<td width='7'></td>
		</tr>
<%	
		while(rs.next()){
			out.print("<tr height='1' bgcolor='#D2D2D2'><td colspan='6'></td></tr>");
			out.print("<tr height='25' align='center'>");	
			out.print("<td>&nbsp;</td>");
			out.print("<td>" + rs.getString("comm_idx") + "</td>"); //�۹�ȣ
			out.print("<td align='center'> <a href='content.jsp?comm_idx="+ rs.getString("comm_idx") +"'>" + rs.getString("comm_title") + " </a></td>");
			out.print("<td align='center'>" + rs.getString("comm_writer") + "</td>");
			out.print("<td align='center'>" + rs.getString("comm_regdate") + "</td>");
			out.print("<td align='center'>" + rs.getString("comm_count") + "</td>");
			out.print("<td>&nbsp;</td>");
			out.print("</tr>");
		}
%>
		 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
	</table>
	<table align="center">
		 <tr><td colspan="4" height="5"></td></tr>
		 <tr><td><input type=button value="�۾���" OnClick="window.location='write.jsp'"></td></tr>
	</table>
<%
		con.close();
	}catch(Exception e){
		out.println("db ���� ����<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<hr>
<br>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>