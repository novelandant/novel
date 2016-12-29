<%@page import="prj.novel.notice.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�������� �� ����</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("�н����带 �Է��ϼ���.");
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
		alert("�н����尡 �ٸ��ϴ�.");
		history.back();
		</script>
<%
		}
	}
%>



<div class="container">
	<div class="row">
		<!-- ===================== ���̵� �޴� ===================== -->
		<div class="col-md-3">
			<h3><a href="main_customerCenter.jsp"> ������</a></h3>
			<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="main_customerCenter.jsp" data-toggle="tab">��������</a></li>
					<li><a href="#tab2" data-toggle="tab">�̺�Ʈ</a></li>
					<li><a href="QnA.jsp" data-toggle="tab">1:1����</a></li>
			</ul>
		</div>

		<!-- ===================== ���̵� �޴� �� ===================== -->		
		
		<div class="col-md-9" align="center">
			<h2 align=left>�������� <small>�۾���</small></h2> <hr/>
			<div>
				<h5>��й�ȣ�� �Է��� �ּ���.</h5>
				<form name=form method=post action="Delete.jsp" >
					<input type="hidden" name="notice_num" value="<%=num%>"/>
					<input type=password name="pass" size=17 maxlength=15>
				</form>
			</div>	 
			<br/>
			<br/>
		
			<!-- ��ư�� -->
			<div class="form-inline" align="center">
				<a class="btn btn-default btn-xs" onClick="check()" role="button">����</a>
				<a class="btn btn-default btn-xs" onClick="history.back()" role="button">���</a>
				<a class="btn btn-default btn-xs" href="main_customerCenter.jsp" role="button">���</a>
				
			</div> <br/><hr/>
			
		</div>
	</div>
</div>

<%@ include file="../commons/_footer.jspf" %>
</body>
</html>
