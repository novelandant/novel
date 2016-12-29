<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이텝 샵</title>
<link rel="stylesheet" href="/Test/sinnara/assets/css/bootstrap.min.css" />
<!-- 부트스트렙에서 자바스크립트를 쓰려면, jquery도 있어야 함. jquery가 반드시 먼저, 임포트 -->

<script src="/Test/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/Test/sinnara/assets/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<h3>아이템 샵</h3>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#tab1" data-toggle="tab">이용권
							구매 ></a></li>
					<li><a href="#tab2" data-toggle="tab">딱지 충전</a></li>
					<li><a href="#tab3" data-toggle="tab">쿠폰 등록</a></li>
					<li><a href="#tab4" data-toggle="tab">홍보 아이템</a></li>
					<li><a href="#tab5" data-toggle="tab">예약 아이템</a></li>
					<li><a href="#tab6" data-toggle="tab">후원 쿠폰</a></li>
					<li><a href="#tab7" data-toggle="tab">비회원 이용권 안내</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				
				<!-- tabs-below tab 메뉴 밑에 내용이 나온다. -->
				<!-- id 지정해주고, data-toggle을 이용해서 연결함 -->

				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
					<form method="post" action="Util_Pur_Proc.jsp">
					<h4><img src="http://www.joara.com/images/content/itemshop/t_utilize_select.gif" alt="이용권 선택"></h4>
					
						<br><br><br>
						
						
						<table class="table table-hover table-bordered" >
							<colgroup>
								<col style="width: 30px;">
								<col style="width: 100px;">
								<col style="width: 30px;">
							</colgroup>
							<thead>
								<tr align="center">
									<th style="text-align : center;">분류</th>
									<th style="text-align : center;">이용권 종류</th>
									<th style="text-align : center;">금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="vertical-align : middle;"  bgcolor="#ffcccc" class="sub_tit" rowspan="12" ><strong >성인 이용권</strong></td>
									<td><label><input type="radio"
											name="pur_history" value="노블레스 자유 1일 이용권 , 2400" >노블레스 자유 <strong class="day"
											style="width: 34px;">1</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>2,400 원</strong><span
										></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 자유 3일 이용권 , 4900">노블레스
											자유 <strong class="day" style="width: 34px;">3</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>4,900 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_32.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 자유 30일 이용권 , 24900">노블레스 자유 <strong class="day"
											style="width: 34px;">30</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>24,900 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_65.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 자유 60일 이용권 , 39900">노블레스 자유 <strong class="day"
											style="width: 34px;">60</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>39,900 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_72.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 자유 90일 이용권 , 49900">노블레스 자유 <strong class="day"
											style="width: 34px;">90</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>49,900 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_77.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc"><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 1일 이용권 , 1500">로맨스 장르전용 <strong
											class="day" style="width: 34px;">1</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>1,500 원</strong><span
										></span></td>
								</tr>
								<tr>
									<td  bgcolor="#ffffcc"><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 3일 이용권 , 3000">로맨스 장르전용 <strong
											class="day" style="width: 34px;">3</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>3,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_33.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 30일 이용권 , 17000">로맨스 장르전용 <strong
											class="day" style="width: 34px;">30</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>17,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_62.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 60일 이용권 , 23000">로맨스 장르전용 <strong
											style="width: 34px;">60</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>23,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_74.gif"></span></td>
								</tr>
								<tr >
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 90일 이용권 , 27000">로맨스 장르전용 <strong
											style="width: 34px;">90</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>27,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_80.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 야간 1일 이용권 , 1200">노블레스 야간 <strong
											class="day" style="width: 34px;">1</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>1,200 원</strong><span
										></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 야간 30일 이용권 , 13000">노블레스 야간 <strong class="day"
											style="width: 34px;">30</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>13,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_64.gif"></span></td>
								</tr>
								<tr>
									<td style="vertical-align : middle;"  bgcolor="#99CCFF" class="sub_tit" rowspan="8"><strong>청소년 이용권</strong></td>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 청소년 자유 1일 이용권 , 1500">노블레스 청소년 자유 <strong class="day"
											style="width: 34px;">1</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>1,500 원</strong><span
										></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 청소년 자유 30일 이용권 , 17000">노블레스 청소년 자유 <strong class="day"
											style="width: 34px;">30</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>17,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_62.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 청소년 자유 60일 이용권 , 23000">노블레스 청소년 자유 <strong class="day"
											style="width: 34px;">60</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>23,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_74.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="노블레스 청소년 자유 90일 이용권 , 27000">노블레스 청소년 자유 <strong class="day"
											style="width: 34px;">90</strong>일 이용권</label></td>
									<td style="text-align: right;"><strong>27,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_80.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 청소년 , 1200">로맨스 장르전용 청소년 <strong
											class="day" style="width: 34px;">1</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>1,200 원</strong><span
										></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 청소년 30일 이용권 , 13000">로맨스 장르전용 청소년 <strong
											class="day" style="width: 34px;">30</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>13,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_64.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 청소년 60일 이용권 , 19900">로맨스 장르전용 청소년 <strong
											class="day" style="width: 34px;">60</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>19,900 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_72.gif"></span></td>
								</tr>
								<tr>
								<!-- ex ) int a = 30; -->
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="로맨스 장르전용 청소년 90일 이용권 , 25000">로맨스 장르전용 청소년<strong
											class="day" style="width: 34px;">90</strong>일 이용권</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>25,000 원</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_77.gif"></span></td>
								</tr>
								
                                      <!-- On rows -->
					</tbody>
						</table>
						
							<br><br><br>
						
						<!-- 결제 수단 선택 -->
						<h4><img src="http://www.joara.com/images/content/itemshop/t_payment.gif" alt="결제 수단 선택"
								 style="vertical-align:middle"/></h4>
								 
								 <br><br><br>
								 
						<table id="payment1" class="table table-hovor table-bordered">
							<colgroup>
								<col style="width:160px;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
							<tr>
								<th class="style2">신용카드/계좌이체</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="신용카드"> 신용카드</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="가상계좌"> 가상계좌</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="계좌이체"> 계좌이체</label>
								</td>
							</tr>
							<tr>
								<th class="style2">휴대폰/유선전화</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="핸드폰"
																	checked> 핸드폰</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="ARS 전화 (KT)"> ARS 전화 (KT)
									</label>
								</td>
							</tr>
							<tr>
								<th class="style2">상품권</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="상품권"> 상품권</label>
								</td>
							</tr>
							<tr>
								<th class="style2">OK CASHBAG</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	
																	value="OK CASHBAG"> OK CASHBAG</label>
								</td>
							</tr>
							<!-- 회원만 가능한 메뉴 -->
							<tr>
								<th class="style2">딱지/마나</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="딱지 구매"
																	> 딱지 구매</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="마나 구매"> 마나 구매</label>
								</td>
							</tr>
							<!-- 회원만 가능한 메뉴 -->
							</tbody>
						</table>
						
						<br><br><br>
						
						<div class="col-md-9" >
							<h3 align ="center"><button type="submit" class="btn btn-primary btn-lg btn-block" value="결제">결제</button></h3>
						</div>	
					</form>
					</div>
					<div class="tab-pane" id="tab2">연락처</div>
					<div class="tab-pane" id="tab3">정보</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>