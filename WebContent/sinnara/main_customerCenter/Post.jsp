<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>신나라 공지사항 등록</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<%@ include file="../commons/_header.jspf" %>
</head>

<body>


<!-- 글쓰기 폼 -->

<div class="container">
	<div class="row">
		<!-- ===================== 사이드 메뉴 ===================== -->
		<div class="col-md-3">
			<h3><a href="main_customerCenter.jsp"> 고객센터</a></h3>
			<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#tab1" data-toggle="tab">공지사항</a></li>
					<li><a href="#tab2" data-toggle="tab">이벤트</a></li>
					<li><a href="#tab3" data-toggle="tab">1:1문의</a></li>
			</ul>
		</div>
		
		<!-- ===================== 사이드 메뉴 끝 ===================== -->		

		
		<div class="col-md-9">	
			<form class="form-horizontal" name=post method=post action="PostProc.jsp">
				<h2 align=left>공지사항 <small>글쓰기</small></h2> <hr/>
				<input type="hidden" name="notice_ip" value="<%=request.getRemoteAddr() %>" />
			
				<!-- 제목 -->
				<div class="form-group">
					<label for="notice_subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="notice_subject" placeholder="제목을 입력하세요">
					</div>
				</div>
			  
				<!-- 비밀번호 -->		  
				<div class="form-group">
					<label for="notice_pass" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="notice_pass" placeholder="****">
					</div>
				</div>
			  
			  	<!-- 내용 -->	
				<div class="form-group">
			    	<label for="notice_content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="10" name="notice_content" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
			  
			  	<!-- 파일 업로드 -->	
				<div class="form-group">
				<label for="exampleInputFile" class="col-sm-2 control-label">파일 업로드</label>
					<div class="col-sm-8">
					<input type="file" id="exampleInputFile">
					</div>
				</div>
				
				<hr/>
				<!-- 버튼 판 -->
				<div class="col-md-12" align="center">	
					<input class="btn btn-default btn-sm" type="submit" value="등록">
					<input class="btn btn-default btn-sm" type="reset" value="취소">
					<input class="btn btn-default btn-sm" type="reset" value="뒤로" onClick="history.back()">
					
				</div>

			</form>
		</div>	
	</div>
</div>
<br><br><br><br><br><br><br>
<%@ include file="../commons/_footer.jspf" %>

</body>
</html>