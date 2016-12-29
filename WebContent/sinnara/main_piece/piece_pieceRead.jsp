<%@page import="prj.novel.piece.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/SinnaraPrj/sinnara/assets/css/bootstrap.min.css" />
<script src="/SinnaraPrj/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/SinnaraPrj/sinnara/assets/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function fnList() {
		document.list.submit();
	}
</script>
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>
	<jsp:useBean id="masdao" class="prj.novel.piece.Master_piece_DAO"></jsp:useBean>
	<jsp:useBean id="serdao" class="prj.novel.piece.Piece_serially_DAO"></jsp:useBean>
	<%
		int num = Integer.parseInt(request.getParameter("b_num"));
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		Master_piece_DTO masdto = masdao.getDB(num, "read");
		Piece_serially_DTO serdto = serdao.getDB(num, "read");
	%>

	<!-- �� �б� -->
	<div align="center">
			<table class="table table-striped" align="center" border="0" border="1">
				<tr>
			<th>����</th>
			<td><%=masdto.getMaster_piece()%></td>
			</tr>
			<tr>
			<th>������</th>
			<td><%=serdto.getPiece_smallsubject()%></td>
			
			</tr>
			<tr>
			<th>ȸ��</th>
			<td><%=serdto.getPiece_turnnum()%></td>
			</tr>
			<tr>
			
			<th>����</th>
			<td><%=serdto.getPiece_content()%></td>
			</tr>
			<tr>
			<th>�ı�</th>
			<td><%=serdto.getPiece_epilogue()%></td>
			</tr>
		<tr>
			
			
			
			
			
		</tr>
		<tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="main_piece.jsp?keyField=<%=keyField%>&keyWord=<%=keyWord%>">���</a> |  
	<a href="piece_pieceEdit.jsp?b_num=<%=num%>">�� ��</a> |
	<a href="piece_pieceDelete.jsp?b_num=<%=num%>">�� ��<input type="hidden" name="action" value="serdelete"></a> ]
  </td>
 </tr>
	</table>
	<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>