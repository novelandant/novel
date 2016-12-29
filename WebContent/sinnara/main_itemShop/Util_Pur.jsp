<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>������ ��</title>
<link rel="stylesheet" href="/Test/sinnara/assets/css/bootstrap.min.css" />
<!-- ��Ʈ��Ʈ������ �ڹٽ�ũ��Ʈ�� ������, jquery�� �־�� ��. jquery�� �ݵ�� ����, ����Ʈ -->

<script src="/Test/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/Test/sinnara/assets/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<h3>������ ��</h3>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#tab1" data-toggle="tab">�̿��
							���� ></a></li>
					<li><a href="#tab2" data-toggle="tab">���� ����</a></li>
					<li><a href="#tab3" data-toggle="tab">���� ���</a></li>
					<li><a href="#tab4" data-toggle="tab">ȫ�� ������</a></li>
					<li><a href="#tab5" data-toggle="tab">���� ������</a></li>
					<li><a href="#tab6" data-toggle="tab">�Ŀ� ����</a></li>
					<li><a href="#tab7" data-toggle="tab">��ȸ�� �̿�� �ȳ�</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				
				<!-- tabs-below tab �޴� �ؿ� ������ ���´�. -->
				<!-- id �������ְ�, data-toggle�� �̿��ؼ� ������ -->

				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
					<form method="post" action="Util_Pur_Proc.jsp">
					<h4><img src="http://www.joara.com/images/content/itemshop/t_utilize_select.gif" alt="�̿�� ����"></h4>
					
						<br><br><br>
						
						
						<table class="table table-hover table-bordered" >
							<colgroup>
								<col style="width: 30px;">
								<col style="width: 100px;">
								<col style="width: 30px;">
							</colgroup>
							<thead>
								<tr align="center">
									<th style="text-align : center;">�з�</th>
									<th style="text-align : center;">�̿�� ����</th>
									<th style="text-align : center;">�ݾ�</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="vertical-align : middle;"  bgcolor="#ffcccc" class="sub_tit" rowspan="12" ><strong >���� �̿��</strong></td>
									<td><label><input type="radio"
											name="pur_history" value="����� ���� 1�� �̿�� , 2400" >����� ���� <strong class="day"
											style="width: 34px;">1</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>2,400 ��</strong><span
										></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� ���� 3�� �̿�� , 4900">�����
											���� <strong class="day" style="width: 34px;">3</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>4,900 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_32.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� ���� 30�� �̿�� , 24900">����� ���� <strong class="day"
											style="width: 34px;">30</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>24,900 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_65.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� ���� 60�� �̿�� , 39900">����� ���� <strong class="day"
											style="width: 34px;">60</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>39,900 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_72.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� ���� 90�� �̿�� , 49900">����� ���� <strong class="day"
											style="width: 34px;">90</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>49,900 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_77.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc"><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� 1�� �̿�� , 1500">�θǽ� �帣���� <strong
											class="day" style="width: 34px;">1</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>1,500 ��</strong><span
										></span></td>
								</tr>
								<tr>
									<td  bgcolor="#ffffcc"><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� 3�� �̿�� , 3000">�θǽ� �帣���� <strong
											class="day" style="width: 34px;">3</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>3,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_33.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� 30�� �̿�� , 17000">�θǽ� �帣���� <strong
											class="day" style="width: 34px;">30</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>17,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_62.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� 60�� �̿�� , 23000">�θǽ� �帣���� <strong
											style="width: 34px;">60</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>23,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_74.gif"></span></td>
								</tr>
								<tr >
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� 90�� �̿�� , 27000">�θǽ� �帣���� <strong
											style="width: 34px;">90</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>27,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_80.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� �߰� 1�� �̿�� , 1200">����� �߰� <strong
											class="day" style="width: 34px;">1</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>1,200 ��</strong><span
										></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� �߰� 30�� �̿�� , 13000">����� �߰� <strong class="day"
											style="width: 34px;">30</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>13,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_64.gif"></span></td>
								</tr>
								<tr>
									<td style="vertical-align : middle;"  bgcolor="#99CCFF" class="sub_tit" rowspan="8"><strong>û�ҳ� �̿��</strong></td>
									<td ><label><input type="radio"
											name="pur_history" value="����� û�ҳ� ���� 1�� �̿�� , 1500">����� û�ҳ� ���� <strong class="day"
											style="width: 34px;">1</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>1,500 ��</strong><span
										></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� û�ҳ� ���� 30�� �̿�� , 17000">����� û�ҳ� ���� <strong class="day"
											style="width: 34px;">30</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>17,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_62.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� û�ҳ� ���� 60�� �̿�� , 23000">����� û�ҳ� ���� <strong class="day"
											style="width: 34px;">60</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>23,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_74.gif"></span></td>
								</tr>
								<tr>
									<td ><label><input type="radio"
											name="pur_history" value="����� û�ҳ� ���� 90�� �̿�� , 27000">����� û�ҳ� ���� <strong class="day"
											style="width: 34px;">90</strong>�� �̿��</label></td>
									<td style="text-align: right;"><strong>27,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_80.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� û�ҳ� , 1200">�θǽ� �帣���� û�ҳ� <strong
											class="day" style="width: 34px;">1</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>1,200 ��</strong><span
										></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� û�ҳ� 30�� �̿�� , 13000">�θǽ� �帣���� û�ҳ� <strong
											class="day" style="width: 34px;">30</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>13,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_64.gif"></span></td>
								</tr>
								<tr>
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� û�ҳ� 60�� �̿�� , 19900">�θǽ� �帣���� û�ҳ� <strong
											class="day" style="width: 34px;">60</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>19,900 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_72.gif"></span></td>
								</tr>
								<tr>
								<!-- ex ) int a = 30; -->
									<td bgcolor="#ffffcc" ><label><input type="radio"
											name="pur_history" value="�θǽ� �帣���� û�ҳ� 90�� �̿�� , 25000">�θǽ� �帣���� û�ҳ�<strong
											class="day" style="width: 34px;">90</strong>�� �̿��</label></td>
									<td bgcolor="#ffffcc" style="text-align: right;"><strong>25,000 ��</strong><span
										><img
											src="http://www.joara.com/images/content/itemshop/ico_discount_77.gif"></span></td>
								</tr>
								
                                      <!-- On rows -->
					</tbody>
						</table>
						
							<br><br><br>
						
						<!-- ���� ���� ���� -->
						<h4><img src="http://www.joara.com/images/content/itemshop/t_payment.gif" alt="���� ���� ����"
								 style="vertical-align:middle"/></h4>
								 
								 <br><br><br>
								 
						<table id="payment1" class="table table-hovor table-bordered">
							<colgroup>
								<col style="width:160px;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
							<tr>
								<th class="style2">�ſ�ī��/������ü</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="�ſ�ī��"> �ſ�ī��</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="�������"> �������</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="������ü"> ������ü</label>
								</td>
							</tr>
							<tr>
								<th class="style2">�޴���/������ȭ</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="�ڵ���"
																	checked> �ڵ���</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="ARS ��ȭ (KT)"> ARS ��ȭ (KT)
									</label>
								</td>
							</tr>
							<tr>
								<th class="style2">��ǰ��</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="��ǰ��"> ��ǰ��</label>
								</td>
							</tr>
							<tr>
								<th class="style2">OK CASHBAG</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	
																	value="OK CASHBAG"> OK CASHBAG</label>
								</td>
							</tr>
							<!-- ȸ���� ������ �޴� -->
							<tr>
								<th class="style2">����/����</th>
								<td class="left">
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="���� ����"
																	> ���� ����</label>
									<label class="la_select"><input type="radio" name="pur_way" class="pur_way"
																	 value="���� ����"> ���� ����</label>
								</td>
							</tr>
							<!-- ȸ���� ������ �޴� -->
							</tbody>
						</table>
						
						<br><br><br>
						
						<div class="col-md-9" >
							<h3 align ="center"><button type="submit" class="btn btn-primary btn-lg btn-block" value="����">����</button></h3>
						</div>	
					</form>
					</div>
					<div class="tab-pane" id="tab2">����ó</div>
					<div class="tab-pane" id="tab3">����</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>