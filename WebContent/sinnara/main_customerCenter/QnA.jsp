<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>������ 1:1����</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<%@ include file="../commons/_header.jspf" %>
</head>
<body>

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
			<div class="tabbable tabs-below">
				<div class="tab-content">
					<div class="tab-pane" id="tab1">
						<jsp:include page ="List.jsp"></jsp:include>
					</div>
					<div class="tab-pane" id="tab2"> �̺�Ʈ ������ </div>
					<div class="tab-pane active" id="tab3">
						<jsp:include page ="QnaList.jsp"></jsp:include>
					</div>
				</div>

			</div>
		</div>
		
		
	</div>
</div>
<br><br><br><br><br><br><br>
<%@ include file="../commons/_footer.jspf" %>
	
</body>
</html>