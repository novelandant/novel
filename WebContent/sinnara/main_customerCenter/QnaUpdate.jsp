<%@page import="prj.novel.qna.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head> 
<title>JSPBoard</title>

	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- IE���� �������� ���� �� ���� �ֽ� �������� ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- �ش� ����̽��� ���缭 �ִ��� ȭ�鿡 �µ��� ����ȭ ������� ��ȯ-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<%@ include file="../commons/_header.jspf" %>
<script>
	function qnaCheck() {
	   if (document.form.qna_pass.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
	     form.qna_pass.focus();
		 return false;
		 }
	   document.form.submit();
	}
</script>
</head>
<body>
<jsp:useBean id="dao" class="prj.novel.qna.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("qna_num"));
	BoardDto dto = dao.getBoard(num, "update");
%>

<div class="container">
	<div class="row">
		<!-- ===================== ���̵� �޴� ===================== -->
		<div class="col-md-3">
			<h3><a href="main_customerCenter.jsp"> ������</a></h3>
			<ul class="nav nav-pills nav-stacked">
					<li><a href="main_customerCenter.jsp">��������</a></li>
					<li><a href="#tab2" data-toggle="tab">�̺�Ʈ</a></li>
					<li class="active"><a href="QnA.jsp">1:1����</a></li>
			</ul>
		</div>

		<!-- ===================== ���̵� �޴� �� ===================== -->		


		<!-- ===================== �� ���� �� ���� ===================== -->
	
		<div class="col-md-9">	
			<form class="form-horizontal" name=form method=post action="QnaUpdateProc.jsp" >
				<h2 align=left>1:1���� <small>�۾���</small></h2> <hr/>
				<input type="hidden" name="qna_num" value="<%=num%>"/>
			
				<!-- ���� -->
				<div class="form-group">
					<label for="qna_subject" class="col-sm-2 control-label">����</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="qna_subject" value="<%=dto.getQna_subject()%>">
					</div>
				</div>
			  
				<!-- ��й�ȣ -->		  
				<div class="form-group">
					<label for="qna_pass" class="col-sm-2 control-label">��й�ȣ</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="qna_pass" placeholder="****">
					</div>
				</div>
			  
			  	<!-- ���� -->	
				<div class="form-group" align="left">
			    	<label for="qna_content" class="col-sm-2 control-label">����</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="10" name="qna_content">
						<%=dto.getQna_content()%></textarea>
					</div>
				</div>
			  
			  	<!-- ���� ���ε� -->	
				<div class="form-group">
				<label for="exampleInputFile" class="col-sm-2 control-label">���� ���ε�</label>
					<div class="col-sm-8">
					<input type="file" id="exampleInputFile">
					</div>
				</div>
				
				<hr/>
				<!-- ��ư �� -->
				<div class="col-md-12" align="center">	
					<input class="btn btn-default btn-sm" type="submit" value="�����Ϸ�" onClick="qnaCheck()">
					<input class="btn btn-default btn-sm" type="reset" value="�ٽþ���">
					<input class="btn btn-default btn-sm" type="reset" value="�ڷ�" onClick="history.back()">
					
				</div>
				
			</form>
		</div>	
		<!-- ===================== �� ���� �� �� ===================== -->
	</div>
</div>	
<br><br><br><br><br><br><br>
<%@ include file="../commons/_footer.jspf" %>
</body>
</html>