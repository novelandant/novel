<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상단 메뉴</title>
</head>
<body>
	<!-- 상단 메뉴(다른 메뉴로 이동)  -->

	<div id="content">
		<!-- title -->
		<!-- title -->
		<div class="title" style="height: 25px;" align="right">
			<div class="path">
				홈 &gt; 작품 &gt; 연재작품 &gt; <select class="fe_select"
					onchange="location.href='/literature/view/book_list.html?sl_category='+this.value">
					<option value="">전체</option>
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
					<option value="etc">일반작품</option>
					<option value="literature">문학작품</option>
				</select>

			</div>
		</div>
		</div>
</body>
</html>