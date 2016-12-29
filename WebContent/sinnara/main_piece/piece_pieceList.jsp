<%@page import="prj.novel.piece.Piece_serially_DTO"%>
<%@page import="prj.novel.piece.Master_piece_DTO"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/SinnaraPrj/sinnara/assets/css/bootstrap.min.css" />
<script src="/SinnaraPrj/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/SinnaraPrj/sinnara/assets/js/bootstrap.min.js"></script>
<title>게시글 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	function fnRead(num){
		document.read.b_num.value = num;
		document.read.submit();
	}
</script>
</head>
<body>
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"></jsp:useBean>
	<jsp:useBean id="masdao" class="prj.novel.piece.Master_piece_DAO"></jsp:useBean>
	<%
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		List list = masdao.getDBList(keyField, keyWord);
		//////////////////////////////////////////////
		// Paging 기법

		int totalRecord = 0; // 전체 글의 갯수
		int numPerPage = 5; // 한 페이지 당 보여질 글의 갯수
		int pagePerBlock = 3; // 한 블럭 당 페이지 수
		int totalPage = 0; // 전체 페이지 수
		int totalBlock = 0; // 전체 블록의 수
		int nowPage = 0; // 현재 페이지 번호
		int nowBlock = 0; // 현재 블럭 번호
		int beginPerPage = 0; // 페이지 당 시작번호

		totalRecord = list.size();
		totalPage = (int) Math.ceil(((double) totalRecord / numPerPage));
		totalBlock = (int) Math.ceil(((double) totalPage / pagePerBlock));

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		beginPerPage = nowPage * numPerPage;
	%>
	<!-- 게시글 목록  -->

	<!-- 연재작품, 성실연재, 단편작품 탭 / 부트스트랩 -->
	<%
		Master_piece_DTO masdto = new Master_piece_DTO();
	%>
	<table class="table table-striped" align="center" border="0" width="80%">
		<tr>
			<td align="left">Total : Articles( <font color="red"><%=nowPage + 1%>
					/ <%=totalPage%></font>)
			</td>
		</tr>
	</table>

	<table  class="table table-striped" align="center" width="80%" border="0" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
				<table class="table table-striped" border="0" width="50%" cellpadding="2">
					<tr align="center" bgcolor="d0d0d0" hight="120%">
						<td>글 번호</td>
						<td>종류</td>
						<td>장르</td>
						<td>제목</td>
						<td>작성자</td>
					</tr>
					
					<% if(list.size() == 0){ %>
					<tr>
						<td>등록된 글이 없습니다.</td>
					</tr>
					<% }
					
					else{
						for(int i=beginPerPage; i<beginPerPage+numPerPage; i++){
							if(i == totalRecord)
								break;
								Master_piece_DTO dto = (Master_piece_DTO)list.get(i);
							%>

					<tr align="center">
						<td><%=masdto.getMaster_piecenum() %></td>
						 
						<td><%=masdto.getMaster_kindcode()%></td>
							<td><%=masdto.getMaster_bigcategory()%> / <%=masdto.getMaster_smallcategory() %></td>
							<td><a href="javascript:fnRead('<%=masdto.getMaster_piecenum()%>')"><%=masdto.getMaster_piece()%></a></td>
							<td><!-- 멤버 아이디 --></td> 
						</tr>
						<%}
							}%>
				</table>
			</td>
		</tr>
		<tr>
		<td><br/></td>
		</tr>
		<tr>
	<td align="left">Go to Page &nbsp;&nbsp;&nbsp;
	<a href="">이전 <%=pagePerBlock%>개</a>:::&nbsp;&nbsp;&nbsp;
	<%
		for(int i=0; i<pagePerBlock; i++){
	%>
		<a href="piece_pieceList.jsp?nowPage=<%=i+(nowBlock*pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock*pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
	<% 
		}
	%>
	<%if(totalBlock > nowBlock+1){ %>
	::: <a href="piece_pieceList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">다음 <%=pagePerBlock%>개</a>
	<%} %>
	</td>
	<td align=right>
		<a href="piece_piecePersonalView.jsp">[글쓰기]</a>
		<a href="main_piece.jsp">[처음으로]</a>
	</td>
</tr>
</table>
<BR>
<form action="piece_pieceList.jsp" name="search" method="post">
	<table width="527" align="center" cellpadding="4">
	<tr>
		<td align="center" valign="bottom">
			<select name="keyField" size="1">
				<option value="b_name"> 이름
				<option value="b_subject"> 제목
				<option value="b_content"> 내용
			</select>

			<input type="text" size="16" name="keyWord" >
			<input type="button" value="찾기" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
</center>	

<form name="read" method="post" action="piece_pieceRead.jsp">
	<input type="hidden" name="b_num"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
</form>
</body>
</html>