<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
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
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>작품</title>
		<%@ include file="/sinnara/commons/_header.jspf" %>
	</head>
	<body>
		<div id="topMenu">
			<%@ include file="/sinnara/main_piece/piece_pieceTopMenu.jsp" %>
		</div>
			<%@ include file="/sinnara/main_piece/piece_pieceLeftMenu.jsp" %>
			
			<%@ include file="/sinnara/main_piece/piece_pieceList.jsp" %>
			
		<%@ include file="/sinnara/commons/_footer.jspf" %>
	</body>
</html>