<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form name="setform" method="post" action="piece_pieceControl.jsp">
			<input type="hidden" name="action" value="insert">
			<table border="1">
				<tr>
					<th><label for="subject">작품 명</label></th>
					<td colspan="2"><input type="text" id="subject" name="master_piece"
						value="" title="작품 명" size="10" class="input_text mb"
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
							style="width: 580px; height: 98px;"></textarea></td>
				</tr>
				<tr>
					<th><label for="book_keyword">키워드</label></th>
					<td colspan="2"><input type="text" id="book_keyword"
						name="master_keyword" value="" title="키워드" size="10"
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
								<li><label><input type="radio" id="defaultimg_chk3"
										name="defaultimg" value="3" class="inputRadio"> 기본표지 3</label></li>
								<li><label><input type="radio" id="defaultimg_chk4"
										name="defaultimg" value="4" class="inputRadio"> 기본표지 4</label></li>
								<li><label><input type="radio" id="defaultimg_chk5"
										name="defaultimg" value="5" class="inputRadio"> 기본표지 5</label></li>
								<li><label><input type="radio" id="defaultimg_chk6"
										name="defaultimg" value="6" class="inputRadio"> 기본표지 6</label></li>
								<li><label><input type="radio" id="defaultimg_chk7"
										name="defaultimg" value="7" class="inputRadio"> 기본표지 7</label></li>
								<li><label><input type="radio" id="defaultimg_chk8"
										name="defaultimg" value="8" class="inputRadio"> 기본표지 8</label></li>
								<li><label><input type="radio" id="defaultimg_chk9"
										name="defaultimg" value="9" class="inputRadio"> 기본표지 9</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk10" name="defaultimg" value="10"
										class="inputRadio"> 기본표지 10</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk11" name="defaultimg" value="11"
										class="inputRadio"> 기본표지 11</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk12" name="defaultimg" value="12"
										class="inputRadio"> 기본표지 12</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk13" name="defaultimg" value="13"
										class="inputRadio"> 기본표지 13</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk14" name="defaultimg" value="14"
										class="inputRadio"> 기본표지 14</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk15" name="defaultimg" value="15"
										class="inputRadio"> 기본표지 15</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk16" name="defaultimg" value="16"
										class="inputRadio"> 기본표지 16</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk17" name="defaultimg" value="17"
										class="inputRadio"> 기본표지 17</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk18" name="defaultimg" value="18"
										class="inputRadio"> 기본표지 18</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk19" name="defaultimg" value="19"
										class="inputRadio"> 기본표지 19</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk20" name="defaultimg" value="20"
										class="inputRadio"> 기본표지 20</label></li>
							</ul>
							<p class="thum" id="defaultimg1" style="display: block">
								<img src="http://cf.joara.com/literature_file/default1_new.jpg"
									alt="기본표지1" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg2" style="display: none">
								<img src="http://cf.joara.com/literature_file/default2_new.jpg"
									alt="기본표지2" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg3" style="display: none">
								<img src="http://cf.joara.com/literature_file/default3_new.jpg"
									alt="기본표지3" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg4" style="display: none">
								<img src="http://cf.joara.com/literature_file/default4_new.jpg"
									alt="기본표지4" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg5" style="display: none">
								<img src="http://cf.joara.com/literature_file/default5_new.jpg"
									alt="기본표지5" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg6" style="display: none">
								<img src="http://cf.joara.com/literature_file/default6_new.jpg"
									alt="기본표지6" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg7" style="display: none">
								<img src="http://cf.joara.com/literature_file/default7_new.jpg"
									alt="기본표지7" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg8" style="display: none">
								<img src="http://cf.joara.com/literature_file/default8_new.jpg"
									alt="기본표지8" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg9" style="display: none">
								<img src="http://cf.joara.com/literature_file/default9_new.jpg"
									alt="기본표지9" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg10" style="display: none">
								<img src="http://cf.joara.com/literature_file/default10_new.jpg"
									alt="기본표지10" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg11" style="display: none">
								<img src="http://cf.joara.com/literature_file/default11_new.jpg"
									alt="기본표지11" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg12" style="display: none">
								<img src="http://cf.joara.com/literature_file/default12_new.jpg"
									alt="기본표지12" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg13" style="display: none">
								<img src="http://cf.joara.com/literature_file/default13_new.jpg"
									alt="기본표지13" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg14" style="display: none">
								<img src="http://cf.joara.com/literature_file/default14_new.jpg"
									alt="기본표지14" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg15" style="display: none">
								<img src="http://cf.joara.com/literature_file/default15_new.jpg"
									alt="기본표지15" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg16" style="display: none">
								<img src="http://cf.joara.com/literature_file/default16_new.jpg"
									alt="기본표지16" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg17" style="display: none">
								<img src="http://cf.joara.com/literature_file/default17_new.jpg"
									alt="기본표지17" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg18" style="display: none">
								<img src="http://cf.joara.com/literature_file/default18_new.jpg"
									alt="기본표지18" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg19" style="display: none">
								<img src="http://cf.joara.com/literature_file/default19_new.jpg"
									alt="기본표지19" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg20" style="display: none">
								<img src="http://cf.joara.com/literature_file/default20_new.jpg"
									alt="기본표지20" width="67" height="96">
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
				<a href="piece_piecePersonal.jsp">연재 목록으로 돌아가기</a>
			</p>
			<p class="btnR">
				<input type="submit" value="등록">
				<!-- <a href="#" id="btn_write" class="btn_basic_b ls10"><span>등록</span></a> -->
				<a href="#" id="btn_cancle" class="btn_basic_w ls10"><span>취소</span></a>
			</p>
		</div>
		</form>
	</div>
</body>
</html>