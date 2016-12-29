<%@page import="prj.novel.qna.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head> 
	<title>고객센터 1:1문의</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- IE에서 페이지가 열릴 때 가장 최신 버전으로 오픈 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 해당 디바이스에 맞춰서 최대한 화면에 맞도록 최적화 사이즈로 변환-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<%@ include file="../commons/_header.jspf" %>
<script>
   function qnacheck() {
      if (document.form.qna_pass.value == "") {
       alert("등록을 위해 패스워드를 입력하세요.");
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
   BoardDto dto = dao.getBoard(num, "reply");
%>


<!-- 글쓰기 폼 -->

<div class="container">
	<div class="row">
		<!-- ===================== 사이드 메뉴 ===================== -->
		<div class="col-md-3">
			<h3><a href="main_customerCenter.jsp"> 고객센터</a></h3>
			<ul class="nav nav-pills nav-stacked">
					<li><a href="main_customerCenter.jsp">공지사항</a></li>
					<li><a href="#tab2" data-toggle="tab">이벤트</a></li>
					<li class="active"><a href="QnA.jsp">1:1문의</a></li>
			</ul>
		</div>

		<!-- ===================== 사이드 메뉴 끝 ===================== -->		

		<div class="col-md-9">	
			<form class="form-horizontal" name=form method=post action="ReplyProc.jsp" >
				<h2 align=left>1:1문의 <small>글쓰기</small></h2> <hr/>
				<input type="hidden" name="qna_num" value="<%=num%>" />
				
				<!-- 제목 -->
				<div class="form-group">
					<label for="qna_subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="qna_subject" placeholder="제목을 입력하세요" value=<%=dto.getQna_subject()%>>
					</div>
				</div>
			  
				<!-- 비밀번호 -->		  
				<div class="form-group">
					<label for="qna_pass" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="qna_pass" placeholder="****">
					</div>
				</div>
			  
			  	<!-- 내용 -->	
				<div class="form-group">
			    	<label for="qna_content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea class="form-control" align="left" rows="10" name="qna_content"></textarea>
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
					<input class="btn btn-default btn-sm" type="submit" value="답변등록">
					<input class="btn btn-default btn-sm" type="reset" value="다시쓰기">
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