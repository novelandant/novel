<%@ page contentType="text/html; charset=EUC-KR"%>

		<header id="header">
			<div class="topBar_wrap">
				<div class="topBar">
					<div class="menu">
						<a href="www.joara.com" title="joara.com" class="bookmark">즐겨찾기</a><a
							href="https://play.google.com/store/apps/details?id=com.joara.mobile"
							target="_blank" class="app">신나라 앱 다운로드
						</a>
					</div>
					<div class="info">
						<strong class="user">팔강공주 님 &nbsp;
							<span class="member_nickname" member_id="supercjm" style="cursor: pointer;">
								<img src="../images/common/btn_seletor_pop.gif" alt="" class="img_sel" />
							</span> 
						</strong>
						쪽지 <a href="/message/" class="blue">0</a>
						<span class="line">|</span>
						마나 <a href="/mypage/item/point_list.html" class="blue">
							<span id="member_point">1,100</span>M
						</a>
						<span class="line">|</span> <a href="/mypage/" class="blue">마이페이지</a>
						<span class="line">|</span> <a href="/cs/event/">이벤트</a>
						<span class="line">|</span> <a href="/member/get_mana.html">마나모으기</a>
						<a href="/logOut.html" class="btn_img"><img
							src="../images/common/btn_top_logout.gif" alt="로그아웃"></a>
					</div>
				</div>
			</div>
			<div style="width: 990px; margin: 0 auto; overflow: hidden; position: relative">
				<style>
					.webtoon_logo {
						float: left;
						margin-top: 32px
					}
	
					.webtoon_logo img {
						vertical-align: middle
					}
				</style>
				<h1 style="margin-top: 25px;">
					<a href="/"><img src="/images/common/logo.gif" width="125"	height="30" alt="SINARA"></a>
				</h1>
				<div class="webtoon_logo" style="">
					<a href="/"> 
						<span style="margin-left: 20px"><img src="../images/common/h2_webso_on.png" alt="웹소설" /></span>
					</a> 
					<img src="../images/common/img_h1bg.gif" alt=""	style="margin-left: 10px" /> 
					<a href="/webtoon/">
						<span style="margin-left: 10px;">
							<img src="../images/common/h2_webtoon_off.png" alt="웹툰" />
						</span>
					</a>
				</div>
				<form name="mainSearchForm" method="get" class="totalSearchArea" action="/search/search.html" onsubmit="return mainSearch(this);">
					<fieldset>
						<legend>통합검색</legend>
						<input type="hidden" name="sl_search" value="book"> 
						<input type="text" id="search" name="sl_keyword" value="" title="검색어 입력" size="10" class="inputText">
						<input type="image"	src="../images/common/btn_totalSearch.gif" alt="검색"> 
						<span style="position: relative;">
							<img src="../images/common/img_beta.gif" alt="" />
						</span>
					</fieldset>
				</form>
			
				<div class="banner">
					<div id="roll_banner_control" class="pagt" style="z-index: 100">
						<strong><span id="cur_roll_banner_count">1</span></strong>/
						<span id="max_roll_banner_count">0</span>
						<a href="#"	onclick="return false" name="prev">
							<img src="../images/common/btn_prev.gif" alt="이전">
						</a>
						<a href="#"	onclick="return false" name="next">
							<img src="../images/common/btn_next.gif" alt="다음">
						</a>
					</div>
					
					<div class="roll_banner" name="0" style="display: none"></div>
					<div class="roll_banner" name="1" style="display: none"></div>
					<div class="roll_banner" name="2" style="display: none">
						<span class='random_banner' style='display: none'></span>
						<a href="http://banner.joara.com/banner/bannerGoUrl.inc.php?idx=1607&url=https%3A%2F%2Fwww.joara.com%2Fmember%2Fjoin%2Fjoin.html"
								hidefocus='true' target='_blank'>
							<IMG height=54 src="http://cf.joara.com/banner_file/20130807_123101.gif" width=174 border=0>
						</a>
						<img src='http://banner.joara.com/banner/bannerView.inc.php?idx=1607' style='display: none'>
					</div>
					<div class="roll_banner" name="3" style="display: none">
						<span class='random_banner' style='display: none'></span>
						<a href="http://banner.joara.com/banner/bannerGoUrl.inc.php?idx=1708&url=http%3A%2F%2Fwww.joara.com%2Fcs%2Ffaq%2F%3Fcategory1%3Djoara%26category2%3Dmembership"
							hidefocus='true' target='_blank'>
							<IMG height=54 src="http://cf.joara.com/banner_file/20140328_170116.gif" width=174 border=0>
						</a>
						<img src='http://banner.joara.com/banner/bannerView.inc.php?idx=1708' style='display: none'>
					</div>
				</div>
			</div>
		</header>
		
		<div class="gb" style="width: 100%; background: url('/images/main/img_gnbbg.gif') repeat; height: 45px; position: relative; z-index: 6; top: 6px; margin-bottom: 7px;">
			<nav id="gnb">
				<ul>
					<li><a href="/literature/"><img src="../images/common/nav_gnb1.gif" alt="작품"></a></li>
					<li><a href="/nobless/"><img src="../images/common/nav_gnb2.gif" alt="연재 작품"></a></li>
					<li><a href="/premium_new/"><img src="../images/common/nav_gnb3.gif" alt="프리미엄"></a></li>
					<li><a href="/romancebl/"><img src="../images/common/nav_gnb9_1.gif" alt="로맨스"></a></li>
					<li><a href="/finish/"><img src="../images/common/nav_gnb10.gif" alt="완결작품관" /></a></li>
					<li><a href="/best/"><img src="../images/common/nav_gnb4.gif" alt="베스트"></a></li>
					<li><a href="/board/"><img src="../images/common/nav_gnb5.gif" alt="커뮤니티"></a></li>
					<li><a href="/itemshop/"><img src="../images/common/nav_gnb7.gif" alt="아이템샵"></a></li>
					<li><a href="/cs/"><img src="../images/common/nav_gnb8.gif" alt="고객센터"></a></li>
				</ul>
				
				<div class="allview_open">
					<a href="#" id="allview_btn" class="more all_more"></a>
					<!-- 전체보기 layer -->
					<div id="all_view_layer" class="all_view_layer">
						<div class="category">
							<ul class="list">
								<li style="width: 110px;">
									<a href="/literature/">
										<img src="/images/common/txt_category1.gif" alt="작품">
									</a>
									<ul class="menu">
										<li><a href="/literature/view/book_list.html">연재 작품</a></li>
										<li><a href="/webtoon/">웹툰</a></li>
										<li><a href="/literature/writer/list.html">작가 소개</a></li>
										<li><a href="/literature/review/list.html">작품 서평</a></li>
										<li><a href="/literature/ad/list.html">작품 홍보</a></li>
										<li><a href="/literature/board/board_list.html">작품 게시판</a></li>
									</ul>
								</li>
								<li style="width: 110px;">
									<a href="/nobless/">
										<img src="/images/common/txt_category2.gif" alt="노블레스">
									</a>
									<ul class="menu">
										<li><a href="/nobless/bookNomalList.html?bookKind=all">연재작품</a></li>
										<li><a href="/nobless/bookBestList.html?bookKind=all">베스트</a></li>
										<li><a href="/nobless/bookFinishList.html?bookKind=all">완결작품</a></li>
									</ul>
								</li>
								<li style="width: 85px;">
									<a href="/premium_new/">
										<img src="/images/common/txt_category3.gif" alt="프리미엄">
									</a>
								</li>
								<li style="width: 116px;">
									<a href="/romancebl/">
										<img src="/images/common/txt_category9.gif" alt="로맨스" />
									</a>
									<ul class="menu">
										<li><a href="/romancebl/view/book_list.html">연재작품</a></li>
										<li><a href="/romancebl/review/list.html">작품서평</a></li>
										<li><a href="/romancebl/ad/list.html">작품홍보</a></li>
										<li><a href="/romancebl/board/board_list.html">장르전용 게시판</a></li>
									</ul>
								</li>
								<li style="width: 129px;">
									<a href="/best/">
										<img src="/images/common/txt_category4.gif" alt="베스트">
									</a>
									<ul class="menu">
										<li><a href="/best/today_best_list.html?page_no=1&sl_subcategory=all">투데이 베스트</a></li>
										<li><a href="/best/weekly_best_list.html?page_no=1&sl_subcategory=all">주간 베스트</a></li>
										<li><a href="/best/monthly_best_list.html?page_no=1&sl_subcategory=all">월간 베스트</a></li>
										<li><a href="/best/best_of_best_list.html?page_no=1&sl_orderby=cnt_favorite">BEST of BEST</a></li>
									</ul>
								</li>
								<li style="width: 170px;">
									<a href="/board/">
										<img src="/images/common/txt_category5.gif" alt="커뮤니티">
									</a>
									<ul class="menu">
										<li><a href="/board/free_board_list.html">자유게시판</a></li>
										<li><a href="/board/talk_board_list.html">신나라 Talk!	 Talk! Talk!</a></li>
										<li><a href="http://yard.joara.com/main.html">뜰</a></li>
										<li><a href="/board/community_list.html">커뮤니티</a></li>
									</ul>
								</li>
								<li style="width: 130px;">
									<a href="/itemshop/">
										<img src="/images/common/txt_category6.gif" alt="아이템샵">
									</a>
									<ul class="menu">
										<li><a href="/itemshop/ticket_nobless.html">이용권 구매</a></li>
										<li><a href="/itemshop/cash_charge.html">딱지 충전</a></li>
										<li><a href="/itemshop/plus_promotion.html">홍보 아이템</a></li>
										<li><a href="/itemshop/book_reservation.html">예약 아이템</a></li>
										<li><a href="/itemshop/grow_item.html">후원쿠폰</a></li>
									</ul>
								</li>
								<li style="width: 97px;">
									<a href="/cs/">
										<img src="/images/common/txt_category7.gif" alt="고객센터">
									</a>
									<ul class="menu">
										<li><a href="/cs/faq/">자주하는 질문</a></li>
										<li><a href="/cs/qna/">1 : 1 문의</a></li>
										<li><a href="/cs/notice/">공지사항</a></li>
										<li><a href="/cs/event/">이벤트</a></li>
										<li><a href="/cs/ad/">광고/제휴문의</a></li>
										<li><a href="/copyright/">저작권 보호센터</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="category2">
							<div class="event">
								<h2>
									<img src="/images/common/txt_ing_event.gif" alt="진행중인 이벤트"/>
								</h2>
								<ul class="ing_event">
									<li>
										<a href="/cs/event/view.html?idx=276">
											<img src="http://cf.joara.com/event_file/20161128_161455.jpg"
												width="189" height="47" alt="하나멤버스 제휴이벤트"/>
										</a>
									</li>
									<li>
										<a href="/cs/event/view.html?idx=274">
											<img src="http://cf.joara.com/event_file/20161125_155743.jpg"
												width="189" height="47" alt="민앤지 제휴이벤트"/>
										</a>
									</li>
								</ul>
							</div>
							<div class="notice">
								<h2>
									<img src="/images/common/txt_notice.gif" alt="공지사항">
								</h2>
								<ul class="news_list">
									<li>
										<a href="/cs/notice/view.html?idx=253240">120-100 프로젝트 11월 후원 대상 작가 선정 안내</a>
									</li>
									<li>
										<a href="/cs/notice/view.html?idx=253218">‘이달의 수퍼루키’ 11월 대상 작품</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<script>
					$('.gb').css('z-index', '6')
					$('#allview_btn').toggle(function() {
						$('#all_view_layer').fadeIn(100);
						$('.all_more').addClass('close');
						$('.gb').css('z-index', '101')
					}, function() {
						$('#all_view_layer').fadeOut(100);
						$('.all_more').removeClass('close');
						$('.gb').css('z-index', '6')
					});
				</script>
				<div style="position: absolute; top: 75px; left: -150px; z-index: 10;">
					<a href="http://www.joara.com/award2016/main.html" target="_blank">
						<img src="/images/main/20161107_award.png"/>
					</a>
				</div>
			</nav>
		</div>
		
		