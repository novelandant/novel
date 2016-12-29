<%@page import="prj.novel.notice.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항 글 삭제</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
<%@ include file="../commons/_header.jspf" %>
</head>
<body>
<jsp:useBean id="dao" class="prj.novel.notice.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("notice_num"));

	String pass = request.getParameter("pass");
	
	if(pass != null){
		BoardDto dto = dao.getBoard(num, "delete");
		if(dto.getNotice_pass().equals(pass)){
			dao.deleteBoard(num);
			response.sendRedirect("main_customerCenter.jsp");
		}
		else{
%>
		<script>
		alert("패스워드가 다릅니다.");
		history.back();
		</script>
<%
		}
	}
%>



<div class="container">
	<div class="row">
		<!-- ===================== 사이드 메뉴 ===================== -->
		<div class="col-md-3">
			<h3><a href="main_customerCenter.jsp"> 고객센터</a></h3>
			<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="main_customerCenter.jsp" data-toggle="tab">공지사항</a></li>
					<li><a href="#tab2" data-toggle="tab">이벤트</a></li>
					<li><a href="QnA.jsp" data-toggle="tab">1:1문의</a></li>
			</ul>
		</div>

		<!-- ===================== 사이드 메뉴 끝 ===================== -->		
		
		<div class="col-md-9" align="center">
			<h2 align=left>공지사항 <small>글쓰기</small></h2> <hr/>
			<div>
				<h5>비밀번호를 입력해 주세요.</h5>
				<form name=form method=post action="Delete.jsp" >
					<input type="hidden" name="notice_num" value="<%=num%>"/>
					<input type=password name="pass" size=17 maxlength=15>
				</form>
			</div>	 
			<br/>
			<br/>
		
			<!-- 버튼판 -->
			<div class="form-inline" align="center">
				<a class="btn btn-default btn-xs" onClick="check()" role="button">삭제</a>
				<a class="btn btn-default btn-xs" onClick="history.back()" role="button">취소</a>
				<a class="btn btn-default btn-xs" href="main_customerCenter.jsp" role="button">목록</a>
				
			</div> <br/><hr/>
			
		</div>
	</div>
</div>

<%@ include file="../commons/_footer.jspf" %>
</body>
</html>
