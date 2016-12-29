<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function delcheck(){
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result == true){
			document.setform.action.value="masdelete";
			document.setform.submit();
		}
		else return;
	}
</script>
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>
<jsp:useBean id="dto" scope="request" class="prj.novel.piece.Master_piece_DTO"></jsp:useBean>
<%
	String num = request.getParameter("b_num");
%>

	<div align="center">
		<form name="setform" method="post" action="piece_pieceControl.jsp">
			<input type="hidden" name="action" value="masedit">
			<input type="hidden" name="b_num" value="<%=num %>">
			<table border="1">
				<tr>
					<th><label for="subject">작품 명</label></th>
					<td colspan="2"><input type="text" id="subject" name="master_piece"
					 title="작품 명" size="10" class="input_text mb" value="<%=dto.getMaster_piece() %>"
						style="width: 580px;" /></td>
				</tr>
				<tr>
					<th>작품 종류</th>
					<td colspan="2" class="radio">
						<style>
.mypage_area .tbl_write td.radio label {
	margin-right: 15px
}
</style> <label><input type="radio" id="default_chkkind" name="master_kindcode"
							value="series" class="inputRadio" checked> 연재작품</label> <label><input
							type="radio" id="chkkind_short" name="master_kindcode" value="short"
							class="inputRadio"> 단편작품</label> <label><input
							type="radio" id="chkkind_exer" name="master_kindcode" value="exer"
							class="inputRadio"> 습작</label> <br />
					</td>
				</tr>
				<tr>
					<th>작품 분류</th>
					<td colspan="2">작품 성향 : <select id="cate_no" name="master_fendencycode"
						class="fe_select">
							<option value="">분류</option>
							<option value="1">남성향</option>
							<option value="2">여성향</option>
					</select> | 카테고리 : <select id="category" name="master_bigcategory" class="s_ev"
						style="width: 80px;">
							<option value="fantasy">판타지</option>
							<option value="love">로맨스</option>
							<option value="rofan">로맨스판타지</option>
							<option value="muhyep">무협</option>
							<option value="fusion">퓨전</option>
							<option value="game">게임</option>
							<option value="history">역사</option>
							<option value="sports">스포츠</option>
							<option value="ltnovel">라이트노벨</option>
							<option value="bl">BL</option>
							<option value="parody">패러디</option>
							<option value="fanfic">팬픽</option>
							<option value="sf">SF</option>
							<option value="military">밀리터리</option>
							<option value="poem">시</option>
							<option value="novel">소설</option>
							<option value="essay">수필</option>
							<option value="horror">공포</option>
							<option value="detect">추리</option>
							<option value="child">아동</option>
							<option value="play">시나리오/희곡</option>
							<option value="criticism">비평</option>
					</select> 세부 카테고리 : <select id="sub_category" name="master_smallcategory"
						class="fe_select">
							<option value="">선택하세요</option>
							<option value="fantasy">판타지</option>
							<option value="love">로맨스</option>
							<option value="rofan">로맨스판타지</option>
							<option value="muhyep">무협</option>
							<option value="fusion">퓨전</option>
							<option value="game">게임</option>
							<option value="history">역사</option>
							<option value="sports">스포츠</option>
							<option value="ltnovel">라이트노벨</option>
							<option value="bl">BL</option>
							<option value="parody">패러디</option>
							<option value="fanfic">팬픽</option>
							<option value="sf">SF</option>
							<option value="military">밀리터리</option>
							<option value="poem">시</option>
							<option value="novel">소설</option>
							<option value="essay">수필</option>
							<option value="horror">공포</option>
							<option value="detect">추리</option>
							<option value="child">아동</option>
							<option value="play">시나리오/희곡</option>
							<option value="criticism">비평</option>
					</select>
				</tr>
				<tr>
					<th><label for="intro">작품 소개</label> <br> <span
						class="txt_gray">(줄거리)</span></th>
					<td class="write" colspan="2"><textarea id="intro"
							name="master_pieceintroduce" rows="5" cols="50" class="textarea"
							style="width: 580px; height: 98px;"><%=dto.getMaster_pieceintroduce() %></textarea></td>
				</tr>
				<tr>
					<th><label for="book_keyword">키워드</label></th>
					<td colspan="2"><input type="text" id="book_keyword"
						name="master_keyword" value="<%=dto.getMaster_keyword() %>" title="키워드" size="10"
						class="input_text mb" style="width: 580px;"></td>
				</tr>
				<tr>
					<th>표지 이미지</th>
					<td colspan="2">

						<div class="cover_img1" style="display: none">
							<style>
.cover_img1 li {
	float: left;
	display: inline-block;
	margin-right: 5px;
}

.cover_img1 li:last-child {
	margin-right: 20px;
}
</style>
							<ul class="check_list">
								<li><label><input type="radio"
										id="defaultimg_chk21" name="defaultimg" value="21"
										class="inputRadio" checked> 로맨스 콘테스트 1</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk22" name="defaultimg" value="22"
										class="inputRadio"> 로맨스 콘테스트 2</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk23" name="defaultimg" value="23"
										class="inputRadio"> 로맨스 콘테스트 3</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk24" name="defaultimg" value="24"
										class="inputRadio"> 로맨스 콘테스트 4</label></li>

							</ul>


							<p class="thum" id="defaultimg21"
								style="clear: both; margin: 10px 0 0 5px; display: block">
								<img src="http://cf.joara.com/literature_file/default21_new.jpg"
									alt="기본표지21" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg22"
								style="clear: both; margin: 10px 0 0 5px; display: none">
								<img src="http://cf.joara.com/literature_file/default22_new.jpg"
									alt="기본표지22" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg23"
								style="clear: both; margin: 10px 0 0 5px; display: none">
								<img src="http://cf.joara.com/literature_file/default23_new.jpg"
									alt="기본표지23" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg24"
								style="clear: both; margin: 10px 0 0 5px; display: none">
								<img src="http://cf.joara.com/literature_file/default24_new.jpg"
									alt="기본표지24" width="67" height="96">
							</p>
						</div>
						<div class="cover_img">
							<ul class="check_list">
								<li><label><input type="radio" id="defaultimg_chk1"
										name="defaultimg" value="1" class="inputRadio" checked>
										기본표지 1</label></li>
								<li><label><input type="radio" id="defaultimg_chk2"
										name="defaultimg" value="2" class="inputRadio"> 기본표지 2</label></li>
							</ul>
							<p class="thum" id="defaultimg1" style="display: block">
								<img src="http://cf.joara.com/literature_file/default1_new.jpg"
									alt="기본표지1" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg2" style="display: none">
								<img src="http://cf.joara.com/literature_file/default2_new.jpg"
									alt="기본표지2" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg999" style="display: none">
								<img id="defaultimg999_img" src="" alt="직접선택" width="67"
									height="96">
							</p>
						</div>
						<div class="select_file">
							<label id="defaultimg_chk_999"><input type="radio"
								id="defaultimg_chk999" name="defaultimg" value="999"
								onclick="uploadUserFile();"> 직접선택</label> <input type="text"
								id="bookimg" name="master_imageroute" onfocus="blur()" class="input_text"
								style="width: 255px;" onclick="uploadUserFile();"> <img
								src="/images/content/customer/bg_file_add.gif"
								style="cursor: pointer" onclick="uploadUserFile();"><input
								type="hidden" id="bookimg_real" name="bookimg_real" value="">
						</div>
					</td>
				</tr>
				<tr>
					<th rowspan="3">작품 상세 설정</th>
					<td class="bg">서평 여부</td>
					<td class="radio"><label><input type="radio"
							name="master_reviewavailyn" value="y" checked class="inputRadio">
							허용</label> <label><input type="radio" name="master_reviewavailyn"
							value="n" class="inputRadio"> 비허용</label></td>
				</tr>
				<tr>
					<td class="bg">코멘트 여부</td>
					<td class="radio"><label><input type="radio"
							name="master_commentavailyn" value="y" checked class="inputRadio">
							허용</label> <label><input type="radio" name="master_commentavailyn" value="n"
							class="inputRadio"> 비허용</label></td>
				</tr>
				<tr>
					<td class="bg">평가 여부</td>
					<td class="radio"><label><input type="radio"
							name="master_evalavailyn" value="y" class="inputRadio"> 허용</label> <label><input
							type="radio" name="master_evalavailyn" value="n" checked class="inputRadio">
							비허용</label></td>
				</tr>
			</table>
		
		<div class="btn_area">
			<p class="btnL">
				<!-- <a href="/mypage/notebook/literature_list.html?lit_type=&kind="
					class="btn_basic_w"><span>연재 목록</span></a> -->
				<!-- <a href="piece_pieceControl.jsp?action=maslist"> -->
				<a href="piece_pieceControl.jsp?action=maslist">
				<input type="button" value="연재 목록으로 돌아가기"></a>
				<a href="piece_piecePersonalEditProc.jsp?b_num=<%=num%>">
				<input type="submit" value="수정"></a>
				<!-- <a href="#" id="btn_write" class="btn_basic_b ls10"><span>등록</span></a> -->
				<input type="button" value="삭제" onclick="delcheck()">
			</p>
		</div>
		</form>
	</div>
	<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>