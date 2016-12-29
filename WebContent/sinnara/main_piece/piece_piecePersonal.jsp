
<%@page import="prj.novel.piece.Piece_serially_DTO"%>
<%@page import="prj.novel.piece.Master_piece_DTO"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function onclick() {
		document.location.href = '/piece_pieceControl.jsp';
	}
	function delcheck(){
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result == true){
			document.setform.action.value="masdelete";
			document.setform.submit();
		}
		else return;
	}
	function fnRead(num){
		document.read.b_num.value = num;
		document.read.submit();
	}
</script>

</head>
<body>

	<%
		String str;
		Piece_serially_DTO serdto = new Piece_serially_DTO();
		for (Master_piece_DTO dto : (ArrayList<Master_piece_DTO>) datas) {
	%>

	<table class="tbl_management" border="1">
		<colgroup>
			<col style="width: 470px;">
			<col style="width: auto;">
		</colgroup>
		<tbody>
			<tr class="title_info">
				<td class="title"> [<%=dto.getMaster_piecenum()%>][<%=dto.getMaster_kindcode()%>
						/ <%=dto.getMaster_fendencycode()%>][<%=dto.getMaster_bigcategory()%>
						/ <%=dto.getMaster_smallcategory()%>] <a href="javascript:fnRead('<%=dto.getMaster_piecenum()%>)"><%=dto.getMaster_piece()%></a>
				</td>
				<td><span class="bookmark">부분수정 &amp; 삭제</span> <select
					id="sortno_1160839">
						
					

						<option value=""> 회</option> <!-- 추가 -->
						
				</select><a href="#"><input type="button" value="이동"></a></td>
			</tr>
			<tr class="work_info">
				<td>
					<div class="book_info info2">
						<p class="book">
							<a href="/literature/view/book_intro.html?book_code=1160839"><img
								src="http://cf.joara.com/literature_file/default1_new.jpg"
								alt="책표지"></a></p>
								<p>이미지 경로 : <%=dto.getMaster_imageroute()%>
						</p>
						<ul class="long">
							<li><strong>최근 등록 일</strong> 2016.12.23 10:49</li>
							<li><strong>일반조회</strong> 0</li>
							<li><strong>추천 / 선작</strong> 0 / 0</li>
							<li><strong>코멘트 / 서평</strong> 0 / 0</li>
							<li>키워드 : <%=dto.getMaster_keyword()%>
							<li>작품 소개 : <%=dto.getMaster_pieceintroduce()%></li>
						</ul>
						<p class="btn">
							<a href="#">서평 보기</a><br>
							<a href="#">코멘트</a> <br />
							
						</p>
					</div>
				</td>
				<td>
					<div class="btn_set">
						<!-- <a
							href="literature_part_write.html?mode=next&amp;book_code=1160839&amp;sortno=2&amp;lit_type=series&amp;kind=series&amp;page_no=1">
							<img src="/images/content/mypage/btn_story_composing.gif"
							alt="이어쓰기"> -->
						
							<a href="piece_pieceWrite.jsp">
							<input type="submit" value="글 쓰기"></a>

						<!-- <a href="/mypage/write/literature_write.html?book_code=1160839&lit_type=series&kind=series&page_no=1"><img src="/images/content/mypage/btn_modify_delete.gif" alt="수정/삭제"></a> -->
							
							<br>
							<br>

						서평 허용 여부 :
						<%=dto.getMaster_reviewavailyn()%><br> 코멘트 허용 여부 :
						<%=dto.getMaster_commentavailyn()%><br> 평가 허용 여부 :
						<%=dto.getMaster_evalavailyn()%><br>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<table>
		<tr>
			<td colspan="2">
				<div class="btn_gather">
				<form name="read" method="post" action="piece_piecePersonalEdit.jsp">
					<a href="#"><input type="button" value="작품 관련 게시판"></a>			
					<a href="main_piece.jsp"><input type="button" value="글 목록으로 돌아가기"></a>
					<a href="piece_piecePersonalSet.jsp"><input type="button" value="새로운 작품 작성"></a>
						<input type="submit" value="수정 및 삭제">
						<input type="hidden" name="b_num"/>
					</form>
					
				</div>
			</td>
		</tr>
	</table>
	<%
		}
	%>
	
	<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>