<%@page import="prj.novel.itemshop.ItemShop_Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>구매 내역</title>
<link rel="stylesheet" href="/Test/sinnara/assets/css/bootstrap.min.css" />
<!-- 부트스트렙에서 자바스크립트를 쓰려면, jquery도 있어야 함. jquery가 반드시 먼저, 임포트 -->

<script src="/Test/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/Test/sinnara/assets/js/bootstrap.min.js"></script>

<script>
$( function(){
	$("#btn_search").click(
			function(){
			var before_y = $("#s_year option:selected").val();
			var	before_m = $("#s_month option:selected").val();
			var before_d = $("#s_day option:selected").val();
			var before = before_y+"-"+before_m+"-"+before_d;
			
			var after_y = $("#e_year option:selected").val();
			var	after_m = $("#e_month option:selected").val();
			var after_d = $("#e_day option:selected").val();
			var after = after_y+"-"+after_m+"-"+after_d;
			
			location.href=""
			alert(before +"에서 부서 " + after + "까지의 내역");
	});
});
	
</script>
</head>
<body>
	<jsp:useBean id="dao" class="prj.novel.itemshop.ItemShop_Dao" scope="request"/>
	<%
		//getParameter는 String 값으로 값을 가져옴.
		//String pur_num=request.getParameter("pur_num");
		
		request.setCharacterEncoding("euc-kr");
		String id = (String)session.getAttribute("loginID");
		ArrayList list = (ArrayList)dao.getUtilList(id);
	%>
	<center>
		<div class="container">
			<div class="row">
				<!-- content -->
				<div id="content">
					<!-- title -->

					<!-- title -->
					<div class="title">
						<h3>
							<img
								src="http://www.joara.com/images/content/mypage/t_utilization_mana.gif"
								alt="이용권 관리">
						</h3>

					</div>

					<div class="date_srch">
						<form name="searchForm" method="POST"
							action="Util_Pur_Proc.jsp">
							<input type="hidden" name="mode" value="" /> <input
								type="hidden" name="old" value="" /> 
								<select id="s_year" name="s_year" class="fe_select">
								<option value=-1>년</option>
								<option value='2010'>2010년</option>
								<option value='2011'>2011년</option>
								<option value='2012'>2012년</option>
								<option value='2013'>2013년</option>
								<option value='2014'>2014년</option>
								<option value='2015'>2015년</option>
								<option value='2016' selected>2016년</option>

							</select> <select id="s_month" name="s_month" class="fe_select">
								<option value='-1'>선택</option>
								<option value='1'>1 월</option>
								<option value='2'>2 월</option>
								<option value='3'>3 월</option>
								<option value='4'>4 월</option>
								<option value='5'>5 월</option>
								<option value='6'>6 월</option>
								<option value='7'>7 월</option>
								<option value='8'>8 월</option>
								<option value='9'>9 월</option>
								<option value='10'>10 월</option>
								<option value='11' selected>11 월</option>
								<option value='12'>12 월</option>

							</select> <select id="s_day" name="s_day" class="fe_select">
								<option value='-1'>선택</option>
								<option value='1'>1 일</option>
								<option value='2'>2 일</option>
								<option value='3'>3 일</option>
								<option value='4'>4 일</option>
								<option value='5'>5 일</option>
								<option value='6'>6 일</option>
								<option value='7'>7 일</option>
								<option value='8'>8 일</option>
								<option value='9'>9 일</option>
								<option value='10'>10 일</option>
								<option value='11'>11 일</option>
								<option value='12'>12 일</option>
								<option value='13'>13 일</option>
								<option value='14'>14 일</option>
								<option value='15'>15 일</option>
								<option value='16'>16 일</option>
								<option value='17'>17 일</option>
								<option value='18'>18 일</option>
								<option value='19'>19 일</option>
								<option value='20'>20 일</option>
								<option value='21'>21 일</option>
								<option value='22'>22 일</option>
								<option value='23'>23 일</option>
								<option value='24'>24 일</option>
								<option value='25'>25 일</option>
								<option value='26'>26 일</option>
								<option value='27' selected>27 일</option>
								<option value='28'>28 일</option>
								<option value='29'>29 일</option>
								<option value='30'>30 일</option>
								<option value='31'>31 일</option>
							</select> ~ <select id="e_year" name="e_year" class="fe_select">
								<option value=-1>년</option>
								<option value='2010'>2010년</option>
								<option value='2011'>2011년</option>
								<option value='2012'>2012년</option>
								<option value='2013'>2013년</option>
								<option value='2014'>2014년</option>
								<option value='2015'>2015년</option>
								<option value='2016' selected>2016년</option>
							</select> <select id="e_month" name="e_month" class="fe_select">
								<option value='-1'>선택</option>
								<option value='1'>1 월</option>
								<option value='2'>2 월</option>
								<option value='3'>3 월</option>
								<option value='4'>4 월</option>
								<option value='5'>5 월</option>
								<option value='6'>6 월</option>
								<option value='7'>7 월</option>
								<option value='8'>8 월</option>
								<option value='9'>9 월</option>
								<option value='10'>10 월</option>
								<option value='11'>11 월</option>
								<option value='12' selected>12 월</option>

							</select> <select id="e_day" name="e_day" class="fe_select">
								<option value='-1'>선택</option>
								<option value='1'>1 일</option>
								<option value='2'>2 일</option>
								<option value='3'>3 일</option>
								<option value='4'>4 일</option>
								<option value='5'>5 일</option>
								<option value='6'>6 일</option>
								<option value='7'>7 일</option>
								<option value='8'>8 일</option>
								<option value='9'>9 일</option>
								<option value='10'>10 일</option>
								<option value='11'>11 일</option>
								<option value='12'>12 일</option>
								<option value='13'>13 일</option>
								<option value='14'>14 일</option>
								<option value='15'>15 일</option>
								<option value='16'>16 일</option>
								<option value='17'>17 일</option>
								<option value='18'>18 일</option>
								<option value='19'>19 일</option>
								<option value='20'>20 일</option>
								<option value='21'>21 일</option>
								<option value='22'>22 일</option>
								<option value='23'>23 일</option>
								<option value='24'>24 일</option>
								<option value='25'>25 일</option>
								<option value='26'>26 일</option>
								<option value='27' selected>27 일</option>
								<option value='28'>28 일</option>
								<option value='29'>29 일</option>
								<option value='30'>30 일</option>
								<option value='31'>31 일</option>
							</select> 
							<input type="button" id="btn_search" value="검색" />
					</form>
					</div>
					

				<br/><br>


				<div class="col-md-12">
					<table class="table table-hover table-bordered">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
						</colgroup>
						<thead>
							<tr>
								<th style="text-align : center;">결제 일시</th>
								<th style="text-align : center;">구매 방법</th>
								<th style="text-align : center;">구매 금액</th>
								<th style="text-align : center;">이용권 종류</th>
							</tr>
						</thead>
						<tbody>

							<%
								if (list.size() == 0) {
							%>
							<tr>
								<td class="cen" colspan="4">*이용권 내역이 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < list.size(); i++) {
										// 행 한 줄
										ItemShop_Dto dto = (ItemShop_Dto) list.get(i);
							%>
							<tr>
								<td><%=dto.getPur_date()%></td>
								<td><%=dto.getPur_way()%></td>
								<td><%=dto.getSum()+"(원)"%></td>
								<td><%=dto.getUtil_kind()%></td>
							</tr>
							<%
								}
								}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</center>
</body>
</html>