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
<title>���� ����</title>
<link rel="stylesheet" href="/Test/sinnara/assets/css/bootstrap.min.css" />
<!-- ��Ʈ��Ʈ������ �ڹٽ�ũ��Ʈ�� ������, jquery�� �־�� ��. jquery�� �ݵ�� ����, ����Ʈ -->

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
			alert(before +"���� �μ� " + after + "������ ����");
	});
});
	
</script>
</head>
<body>
	<jsp:useBean id="dao" class="prj.novel.itemshop.ItemShop_Dao" scope="request"/>
	<%
		//getParameter�� String ������ ���� ������.
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
								alt="�̿�� ����">
						</h3>

					</div>

					<div class="date_srch">
						<form name="searchForm" method="POST"
							action="Util_Pur_Proc.jsp">
							<input type="hidden" name="mode" value="" /> <input
								type="hidden" name="old" value="" /> 
								<select id="s_year" name="s_year" class="fe_select">
								<option value=-1>��</option>
								<option value='2010'>2010��</option>
								<option value='2011'>2011��</option>
								<option value='2012'>2012��</option>
								<option value='2013'>2013��</option>
								<option value='2014'>2014��</option>
								<option value='2015'>2015��</option>
								<option value='2016' selected>2016��</option>

							</select> <select id="s_month" name="s_month" class="fe_select">
								<option value='-1'>����</option>
								<option value='1'>1 ��</option>
								<option value='2'>2 ��</option>
								<option value='3'>3 ��</option>
								<option value='4'>4 ��</option>
								<option value='5'>5 ��</option>
								<option value='6'>6 ��</option>
								<option value='7'>7 ��</option>
								<option value='8'>8 ��</option>
								<option value='9'>9 ��</option>
								<option value='10'>10 ��</option>
								<option value='11' selected>11 ��</option>
								<option value='12'>12 ��</option>

							</select> <select id="s_day" name="s_day" class="fe_select">
								<option value='-1'>����</option>
								<option value='1'>1 ��</option>
								<option value='2'>2 ��</option>
								<option value='3'>3 ��</option>
								<option value='4'>4 ��</option>
								<option value='5'>5 ��</option>
								<option value='6'>6 ��</option>
								<option value='7'>7 ��</option>
								<option value='8'>8 ��</option>
								<option value='9'>9 ��</option>
								<option value='10'>10 ��</option>
								<option value='11'>11 ��</option>
								<option value='12'>12 ��</option>
								<option value='13'>13 ��</option>
								<option value='14'>14 ��</option>
								<option value='15'>15 ��</option>
								<option value='16'>16 ��</option>
								<option value='17'>17 ��</option>
								<option value='18'>18 ��</option>
								<option value='19'>19 ��</option>
								<option value='20'>20 ��</option>
								<option value='21'>21 ��</option>
								<option value='22'>22 ��</option>
								<option value='23'>23 ��</option>
								<option value='24'>24 ��</option>
								<option value='25'>25 ��</option>
								<option value='26'>26 ��</option>
								<option value='27' selected>27 ��</option>
								<option value='28'>28 ��</option>
								<option value='29'>29 ��</option>
								<option value='30'>30 ��</option>
								<option value='31'>31 ��</option>
							</select> ~ <select id="e_year" name="e_year" class="fe_select">
								<option value=-1>��</option>
								<option value='2010'>2010��</option>
								<option value='2011'>2011��</option>
								<option value='2012'>2012��</option>
								<option value='2013'>2013��</option>
								<option value='2014'>2014��</option>
								<option value='2015'>2015��</option>
								<option value='2016' selected>2016��</option>
							</select> <select id="e_month" name="e_month" class="fe_select">
								<option value='-1'>����</option>
								<option value='1'>1 ��</option>
								<option value='2'>2 ��</option>
								<option value='3'>3 ��</option>
								<option value='4'>4 ��</option>
								<option value='5'>5 ��</option>
								<option value='6'>6 ��</option>
								<option value='7'>7 ��</option>
								<option value='8'>8 ��</option>
								<option value='9'>9 ��</option>
								<option value='10'>10 ��</option>
								<option value='11'>11 ��</option>
								<option value='12' selected>12 ��</option>

							</select> <select id="e_day" name="e_day" class="fe_select">
								<option value='-1'>����</option>
								<option value='1'>1 ��</option>
								<option value='2'>2 ��</option>
								<option value='3'>3 ��</option>
								<option value='4'>4 ��</option>
								<option value='5'>5 ��</option>
								<option value='6'>6 ��</option>
								<option value='7'>7 ��</option>
								<option value='8'>8 ��</option>
								<option value='9'>9 ��</option>
								<option value='10'>10 ��</option>
								<option value='11'>11 ��</option>
								<option value='12'>12 ��</option>
								<option value='13'>13 ��</option>
								<option value='14'>14 ��</option>
								<option value='15'>15 ��</option>
								<option value='16'>16 ��</option>
								<option value='17'>17 ��</option>
								<option value='18'>18 ��</option>
								<option value='19'>19 ��</option>
								<option value='20'>20 ��</option>
								<option value='21'>21 ��</option>
								<option value='22'>22 ��</option>
								<option value='23'>23 ��</option>
								<option value='24'>24 ��</option>
								<option value='25'>25 ��</option>
								<option value='26'>26 ��</option>
								<option value='27' selected>27 ��</option>
								<option value='28'>28 ��</option>
								<option value='29'>29 ��</option>
								<option value='30'>30 ��</option>
								<option value='31'>31 ��</option>
							</select> 
							<input type="button" id="btn_search" value="�˻�" />
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
								<th style="text-align : center;">���� �Ͻ�</th>
								<th style="text-align : center;">���� ���</th>
								<th style="text-align : center;">���� �ݾ�</th>
								<th style="text-align : center;">�̿�� ����</th>
							</tr>
						</thead>
						<tbody>

							<%
								if (list.size() == 0) {
							%>
							<tr>
								<td class="cen" colspan="4">*�̿�� ������ �����ϴ�.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < list.size(); i++) {
										// �� �� ��
										ItemShop_Dto dto = (ItemShop_Dto) list.get(i);
							%>
							<tr>
								<td><%=dto.getPur_date()%></td>
								<td><%=dto.getPur_way()%></td>
								<td><%=dto.getSum()+"(��)"%></td>
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