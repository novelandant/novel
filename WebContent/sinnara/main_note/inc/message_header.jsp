<%@ page contentType="text/html; charset=EUC-KR"%>

		<header id="header">
			<div class="topBar_wrap">
				<div class="topBar">
					<div class="info">
						<strong class="user">�Ȱ����� �� &nbsp;
							<span class="member_nickname" member_id="supercjm" style="cursor: pointer;">
								<img src="../images/common/btn_seletor_pop.gif" alt="" class="img_sel" />
							</span> 
						</strong>
						���� <a href="#" class="blue">0</a>
						<span class="line">|</span>
						���� <a href="#" class="blue">
							<span id="member_point">1,100</span>M
						</a>
						<span class="line">|</span> <a href="#" class="blue">����������</a>
						<span class="line">|</span> <a href="#">�̺�Ʈ</a>
						<span class="line">|</span> <a href="#">����������</a>
						<a href="#" class="btn_img"><img
							src="../images/common/btn_top_logout.gif" alt="�α׾ƿ�"></a>
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
					<a href="/SinnaraPrj/sinnara/index.jsp"><img src="../images/common/logo3-dark.png" width="125"	height="30" alt="SINARA"></a>
				</h1>
				<div class="webtoon_logo" style="">
					<a href="/SinnaraPrj/sinnara/index.jsp"> 
						<span style="margin-left: 20px"><img src="../images/common/h2_webso_on.png" alt="���Ҽ�" /></span>
					</a> 
					<img src="../images/common/img_h1bg.gif" alt=""	style="margin-left: 10px" /> 
				</div>
				<form name="mainSearchForm" method="get" class="totalSearchArea" action="/search/search.html" onsubmit="return mainSearch(this);">
				</form>
			
				<div class="banner">
					<div class="roll_banner" name="0" style="display: none"></div>
					<div class="roll_banner" name="1" style="display: none"></div>
					<div class="roll_banner" name="2" style="display: none">
						<span class='random_banner' style='display: none'></span>
						<a href="#"
								hidefocus='true' target='_blank'>
							<IMG height=54 src="http://cf.joara.com/banner_file/20130807_123101.gif" width=174 border=0>
						</a>
						<img src='http://banner.joara.com/banner/bannerView.inc.php?idx=1607' style='display: none'>
					</div>
					<div class="roll_banner" name="3" style="display: none">
						<span class='random_banner' style='display: none'></span>
						<a href="#"
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
					<li><a href="#"><img src="../images/common/nav_gnb1.gif" alt="��ǰ"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb2.gif" alt="���� ��ǰ"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb3.gif" alt="�����̾�"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb9_1.gif" alt="�θǽ�"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb10.gif" alt="�ϰ���ǰ��" /></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb4.gif" alt="����Ʈ"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb5.gif" alt="Ŀ�´�Ƽ"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb7.gif" alt="�����ۼ�"></a></li>
					<li><a href="#"><img src="../images/common/nav_gnb8.gif" alt="������"></a></li>
				</ul>
				
				<div class="allview_open">
					<a href="#" id="allview_btn" class="more all_more"></a>
					<!-- ��ü���� layer -->
					<div id="all_view_layer" class="all_view_layer">
				</div>
				
				<div style="position: absolute; top: 75px; left: -150px; z-index: 10;">
					<a href="http://www.joara.com/award2016/main.html" target="_blank">
						<img src="/images/main/20161107_award.png"/>
					</a>
				</div>
			</nav>
		</div>
		
		