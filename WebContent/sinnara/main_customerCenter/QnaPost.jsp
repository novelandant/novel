<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>������ 1:1����</title>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- IE���� �������� ���� �� ���� �ֽ� �������� ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- �ش� ����̽��� ���缭 �ִ��� ȭ�鿡 �µ��� ����ȭ ������� ��ȯ-->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>

<body>


<!-- �۾��� �� -->

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

		
		<div class="col-md-9">	
			<form class="form-horizontal" name=post method=post action="QnaPostProc.jsp">
				<h2 align=left>1:1���� <small>�۾���</small></h2> <hr/>
				<input type="hidden" name="qna_ip" value="<%=request.getRemoteAddr() %>" />
			
				<!-- ���� -->
				<div class="form-group">
					<label for="qna_subject" class="col-sm-2 control-label">����</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="qna_subject" placeholder="������ �Է��ϼ���">
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
				<div class="form-group">
			    	<label for="qna_content" class="col-sm-2 control-label">����</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="10" name="qna_content" placeholder="������ �Է��ϼ���"></textarea>
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
					<input class="btn btn-default btn-sm" type="submit" value="���">
					<input class="btn btn-default btn-sm" type="reset" value="���">
				</div>
				
			</form>
		</div>	
	</div>
</div>



</body>
</html>