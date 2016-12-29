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
<title>좌단 메뉴</title>
</head>
<body>
	<!-- 좌단 메뉴, 연재 작품, 작가 소개, 작품 서평, 작품 홍보, 작품 게시판  -->
	<div id="container" class="clearfix">

		<!-- lnb -->
		<div id="left_cont" style="position: relative; z-index: 1">
			<div class="lnb">
				<ul>
					<li><a href="/literature/view/" class="current">연재작품</a>
						<ul class="nav nav-tabs">
							<li><a href="/literature/view/book_list.html"
								class='current'>전체</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=fantasy">판타지</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=love">로맨스</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=rofan">로맨스판타지</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=muhyep">무협</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=fusion">퓨전</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=game">게임</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=history">역사</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=sports">스포츠</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=ltnovel">라이트노벨</a></li>
							<li><a href="/literature/view/book_list.html?sl_category=bl">BL</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=parody">패러디</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=fanfic">팬픽</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=etc">일반작품</a></li>
							<li><a
								href="/literature/view/book_list.html?sl_category=literature">문학작품</a></li>

						</ul></li>
					<!-- li><a href="/literature/webtoon/" >웹툰</a></li//-->
					<li><a href="/literature/review/">작품 서평</a></li>
				</ul>
			</div>
		</div>
		</div>

			
</body>
</html>