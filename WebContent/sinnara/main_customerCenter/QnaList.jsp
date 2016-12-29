<%@page import="prj.novel.qna.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<HTML>
<head>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- IE에서 페이지가 열릴 때 가장 최신 버전으로 오픈 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 해당 디바이스에 맞춰서 최대한 화면에 맞도록 최적화 사이즈로 변환-->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<title>고객센터 1:1문의</title>
	<script>
		function check(){
			if(document.search.keyWord.value == ""){
				alert("검색어를 입력하세요.");
				document.search.keyWord.focus();
				return;
			}
			document.search.submit();
		}
		function fnQnaRead(num){
			document.qnaRead.qna_num.value = num;
			document.qnaRead.submit();
		}
	</script>
	<style>
		.table-hover>tbody>tr:hover {
			background-color: #dddddd;
		}
	</style>
</head>

<BODY>
<jsp:useBean id="dao" class="prj.novel.qna.BoardDao" />
<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	List list = dao.getBoardList(keyField, keyWord);
	/////////////////////////////////////////////////////
	// Paging 기법
	int totalRecord = 0;	//전체 글의 개수
	int numPerPage = 7;		// 한 페이지 당 보여질 글의 개수
	int pagePerBlock = 3;	// 한 블럭 당 페이지 수
	int totalPage = 0;		// 전체 페이지 수
	int totalBlock = 0;		// 전체 블럭 수
	int nowPage = 0;		// 현재 페이지 번호
	int nowBlock = 0;		// 현재 블럭 번호
	int beginPerPage = 0;	// 페이지 당 시작 번호
	
	totalRecord = list.size();
	totalPage = (int)Math.ceil(((double)totalRecord/numPerPage));
	totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	beginPerPage = nowPage * numPerPage;
%>


<h2 align=left>고객센터 <small>1:1문의</small></h2> <hr/>
<p align=right>페이지(<%=nowPage+1%>/<%=totalPage%>) </p>

<!-- 공지사항 게시판 -->
<div class="row">
	<div class="col-md-12">	
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th width="10%" class="text-center"> No. </th>
				<th width="60%" class="text-center"> 제목 </th>
				<th width="20%" class="text-center"> 날짜 </th>
				<th width="10%" class="text-center"> 조회수 </th>
			</tr>
		</thead>

		<tbody>	
			<%
				if(list.size() == 0){
			%>
					<tr><td>등록된 글이 없습니다.</td></tr>
			<%	
				}
				else{
					for(int i=beginPerPage; i<beginPerPage+numPerPage; i++){
						if(i == totalRecord)
							break;
						
						BoardDto dto = (BoardDto)list.get(i);
			%>
					<tr align="center">
						<td><%=dto.getQna_num()%></td>
						<td align="left">
						<%=dao.useDepth(dto.getQna_depth())%>
						<%
							if(dto.getQna_depth()>0){
						%>
							<img src="../images/re.gif"/>
						<%
							}
						%>
						<a href="javascript:fnQnaRead('<%=dto.getQna_num()%>')"><%=dto.getQna_subject()%></a></td>
						<td><%=dto.getQna_regdate() %></td>
						<td><%=dto.getQna_count() %></td>
					</tr>
			<% 
					}
				}
			%>
		</tbody>
	</table>
	

	</div>
</div>


<div class="col-md-12">
	<!-- 페이지 이동 -->
	<div class="col-md-6" align="left">
		<%if(nowBlock > 0){%>
		<a href="Qna_List.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">이전 <%=pagePerBlock%> page</a> ...
		<%}%>
		<%
			for(int i=0; i<pagePerBlock; i++){
				if(i+(nowBlock * pagePerBlock) == totalPage)
					break;
		%>
		<a href="Qna_List.jsp?nowPage=<%=i+(nowBlock*pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock*pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
		<%
			}
		%>
		<% if(totalBlock > nowBlock+1){ %>
		... <a href="Qna_List.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">▶</a> 
		<% } %>	
	</div>

	<!-- 버튼 판 -->
	<div class="col-md-6 form-inline" align="right">
		<a class="btn btn-default btn-xs" href="QnaPost.jsp" role="button">글쓰기</a>
		<a class="btn btn-default btn-xs" href="QnA.jsp" role="button">목록</a>
	</div>
	<br/><hr/>
	
	<!-- 검색 폼 -->
	<form class="form-inline" action="Qna_List.jsp" name="search" method="post" align="center">
		<div class="form-group">
				
				<select name="keyField" size="1" class="form-control select-sm">
					<option value="qna_subject">제목</option>
					<option value="qna_content">내용</option>
				</select>
	
				<input type="search" class="form-control input-sm" placeholder="검색" name="keyWord">
				<a class="btn btn-default" onClick="check()" role="button">
					 <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
				<input type="hidden" name="page" value= "0">
		 </div>
	</form>
</div>




<!--  이거 뭔지 모르겠어 뭐야? -->
<form name="qnaRead" method="post" action="QnaRead.jsp">
	<input type="hidden" name="qna_num"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
</form>


</BODY>
</HTML>