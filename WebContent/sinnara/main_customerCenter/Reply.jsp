<%@page import="prj.novel.notice.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head> <title>�亯 �ޱ�</title>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- IE���� �������� ���� �� ���� �ֽ� �������� ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- �ش� ����̽��� ���缭 �ִ��� ȭ�鿡 �µ��� ����ȭ ������� ��ȯ-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<%@ include file="../commons/_header.jspf" %>
<script>
   function check() {
      if (document.form.notice_pass.value == "") {
       alert("����� ���� �н����带 �Է��ϼ���.");
        form.notice_pass.focus();
       return false;
       }
      document.form.submit();
   }
</script>
</head>
<body>
<jsp:useBean id="dao" class="prj.novel.notice.BoardDao"/>
<%
   int num = Integer.parseInt(request.getParameter("notice_num"));
   BoardDto dto = dao.getBoard(num, "reply");
%>


<!-- �۾��� �� -->

<div class="container">
	<div class="row">
		<!-- ===================== ���̵� �޴� ===================== -->
		<div class="col-md-3">
			<h3>������</h3>
			<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#tab1" data-toggle="tab">��������</a></li>
					<li><a href="#tab2" data-toggle="tab">�̺�Ʈ</a></li>
					<li><a href="#tab3" data-toggle="tab">1:1����</a></li>
			</ul>
		</div>

		<!-- ===================== ���̵� �޴� �� ===================== -->		

		<div class="col-md-9">	
			<form class="form-horizontal" name=form method=post action="ReplyProc.jsp" >
				<h2 align=left>�������� <small>�۾���</small></h2> <hr/>
				<input type="hidden" name="notice_num" value="<%=num%>" />
				
				<!-- ���� -->
				<div class="form-group">
					<label for="notice_subject" class="col-sm-2 control-label">����</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="notice_subject" placeholder="������ �Է��ϼ���" value=<%=dto.getNotice_subject()%>>
					</div>
				</div>
			  
				<!-- ��й�ȣ -->		  
				<div class="form-group">
					<label for="notice_pass" class="col-sm-2 control-label">��й�ȣ</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="notice_pass" placeholder="****">
					</div>
				</div>
			  
			  	<!-- ���� -->	
				<div class="form-group">
			    	<label for="notice_content" class="col-sm-2 control-label">����</label>
					<div class="col-sm-8">
						<textarea class="form-control" align="left" rows="10" name="notice_content"></textarea>
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
					<input class="btn btn-default btn-sm" type="submit" value="�亯���">
					<input class="btn btn-default btn-sm" type="reset" value="�ٽþ���">
					<input class="btn btn-default btn-sm" type="reset" value="�ڷ�" onClick="history.back()">
				</div>
				
			</form>
		</div>	
	</div>
</div>	
<br><br><br><br><br><br><br>
<%@ include file="../commons/_footer.jspf" %>
</body>
</html>