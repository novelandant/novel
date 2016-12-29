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
</head>

<body>
<jsp:useBean id="dao" class="prj.novel.qna.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("qna_num"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	BoardDto dto = dao.getBoard(num, "read");
%>
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
			<h2 align=left>고객센터 <small>1:1문의</small></h2> <hr/>
			<table class="table">
				<thead>
					<th width="70%"><%=dto.getQna_subject()%></th>
					<th width="30%"><%=dto.getQna_regdate()%></th>
					<th width="20%"><%=dto.getQna_count()%></th>
				</thead>
				<tbody>
					<tr>
					<td><%=dto.getQna_content().replace("\n", "<br/>")%></td>
					</tr>
				</tbody>
		</table>
		<hr/>
		</div>
		<div class="col-md-12 form-inline" align="right">	
			<a class="btn btn-default btn-xs" href="QnA.jsp" role="button">목록</a>
			<a class="btn btn-default btn-xs" href="QnaUpdate.jsp?qna_num=<%=num%>" role="button">수정</a>
			<a class="btn btn-default btn-xs" href="QnaDelete.jsp?qna_num=<%=num%>" role="button">삭제</a>
			<a class="btn btn-default btn-xs" href="QnaReply.jsp?qna_num=<%=num%>" role="button">답변</a>
		</div>
	</div>
</div>					
<br><br><br><br><br><br><br>
<%@ include file="../commons/_footer.jspf" %>

</body>
</html>
