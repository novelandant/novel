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
					<th><label for="subject">��ǰ ��</label></th>
					<td colspan="2"><input type="text" id="subject" name="master_piece"
						value="" title="��ǰ ��" size="10" class="input_text mb"
						style="width: 580px;" /></td>
				</tr>
				<tr>
					<th>��ǰ ����</th>
					<td colspan="2" class="radio">
						<style>
.mypage_area .tbl_write td.radio label {
	margin-right: 15px
}
</style> <label><input type="radio" id="default_chkkind" name="master_kindcode"
							value="series" class="inputRadio" checked> ������ǰ</label> <label><input
							type="radio" id="chkkind_short" name="master_kindcode" value="short"
							class="inputRadio"> ������ǰ</label> <label><input
							type="radio" id="chkkind_exer" name="master_kindcode" value="exer"
							class="inputRadio"> ����</label> <br />
					</td>
				</tr>
				<tr>
					<th>��ǰ �з�</th>
					<td colspan="2">��ǰ ���� : <select id="cate_no" name="master_fendencycode"
						class="fe_select">
							<option value="">�з�</option>
							<option value="1">������</option>
							<option value="2">������</option>
					</select> | ī�װ� : <select id="category" name="master_bigcategory" class="s_ev"
						style="width: 80px;">
							<option value="fantasy">��Ÿ��</option>
							<option value="love">�θǽ�</option>
							<option value="rofan">�θǽ���Ÿ��</option>
							<option value="muhyep">����</option>
							<option value="fusion">ǻ��</option>
							<option value="game">����</option>
							<option value="history">����</option>
							<option value="sports">������</option>
							<option value="ltnovel">����Ʈ�뺧</option>
							<option value="bl">BL</option>
							<option value="parody">�з���</option>
							<option value="fanfic">����</option>
							<option value="sf">SF</option>
							<option value="military">�и��͸�</option>
							<option value="poem">��</option>
							<option value="novel">�Ҽ�</option>
							<option value="essay">����</option>
							<option value="horror">����</option>
							<option value="detect">�߸�</option>
							<option value="child">�Ƶ�</option>
							<option value="play">�ó�����/���</option>
							<option value="criticism">����</option>
					</select> ���� ī�װ� : <select id="sub_category" name="master_smallcategory"
						class="fe_select">
							<option value="">�����ϼ���</option>
							<option value="fantasy">��Ÿ��</option>
							<option value="love">�θǽ�</option>
							<option value="rofan">�θǽ���Ÿ��</option>
							<option value="muhyep">����</option>
							<option value="fusion">ǻ��</option>
							<option value="game">����</option>
							<option value="history">����</option>
							<option value="sports">������</option>
							<option value="ltnovel">����Ʈ�뺧</option>
							<option value="bl">BL</option>
							<option value="parody">�з���</option>
							<option value="fanfic">����</option>
							<option value="sf">SF</option>
							<option value="military">�и��͸�</option>
							<option value="poem">��</option>
							<option value="novel">�Ҽ�</option>
							<option value="essay">����</option>
							<option value="horror">����</option>
							<option value="detect">�߸�</option>
							<option value="child">�Ƶ�</option>
							<option value="play">�ó�����/���</option>
							<option value="criticism">����</option>
					</select>
				</tr>
				<tr>
					<th><label for="intro">��ǰ �Ұ�</label> <br> <span
						class="txt_gray">(�ٰŸ�)</span></th>
					<td class="write" colspan="2"><textarea id="intro"
							name="master_pieceintroduce" rows="5" cols="50" class="textarea"
							style="width: 580px; height: 98px;"></textarea></td>
				</tr>
				<tr>
					<th><label for="book_keyword">Ű����</label></th>
					<td colspan="2"><input type="text" id="book_keyword"
						name="master_keyword" value="" title="Ű����" size="10"
						class="input_text mb" style="width: 580px;"></td>
				</tr>
				<tr>
					<th>ǥ�� �̹���</th>
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
										class="inputRadio" checked> �θǽ� ���׽�Ʈ 1</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk22" name="defaultimg" value="22"
										class="inputRadio"> �θǽ� ���׽�Ʈ 2</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk23" name="defaultimg" value="23"
										class="inputRadio"> �θǽ� ���׽�Ʈ 3</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk24" name="defaultimg" value="24"
										class="inputRadio"> �θǽ� ���׽�Ʈ 4</label></li>

							</ul>


							<p class="thum" id="defaultimg21"
								style="clear: both; margin: 10px 0 0 5px; display: block">
								<img src="http://cf.joara.com/literature_file/default21_new.jpg"
									alt="�⺻ǥ��21" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg22"
								style="clear: both; margin: 10px 0 0 5px; display: none">
								<img src="http://cf.joara.com/literature_file/default22_new.jpg"
									alt="�⺻ǥ��22" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg23"
								style="clear: both; margin: 10px 0 0 5px; display: none">
								<img src="http://cf.joara.com/literature_file/default23_new.jpg"
									alt="�⺻ǥ��23" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg24"
								style="clear: both; margin: 10px 0 0 5px; display: none">
								<img src="http://cf.joara.com/literature_file/default24_new.jpg"
									alt="�⺻ǥ��24" width="67" height="96">
							</p>
						</div>
						<div class="cover_img">
							<ul class="check_list">
								<li><label><input type="radio" id="defaultimg_chk1"
										name="defaultimg" value="1" class="inputRadio" checked>
										�⺻ǥ�� 1</label></li>
								<li><label><input type="radio" id="defaultimg_chk2"
										name="defaultimg" value="2" class="inputRadio"> �⺻ǥ�� 2</label></li>
								<li><label><input type="radio" id="defaultimg_chk3"
										name="defaultimg" value="3" class="inputRadio"> �⺻ǥ�� 3</label></li>
								<li><label><input type="radio" id="defaultimg_chk4"
										name="defaultimg" value="4" class="inputRadio"> �⺻ǥ�� 4</label></li>
								<li><label><input type="radio" id="defaultimg_chk5"
										name="defaultimg" value="5" class="inputRadio"> �⺻ǥ�� 5</label></li>
								<li><label><input type="radio" id="defaultimg_chk6"
										name="defaultimg" value="6" class="inputRadio"> �⺻ǥ�� 6</label></li>
								<li><label><input type="radio" id="defaultimg_chk7"
										name="defaultimg" value="7" class="inputRadio"> �⺻ǥ�� 7</label></li>
								<li><label><input type="radio" id="defaultimg_chk8"
										name="defaultimg" value="8" class="inputRadio"> �⺻ǥ�� 8</label></li>
								<li><label><input type="radio" id="defaultimg_chk9"
										name="defaultimg" value="9" class="inputRadio"> �⺻ǥ�� 9</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk10" name="defaultimg" value="10"
										class="inputRadio"> �⺻ǥ�� 10</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk11" name="defaultimg" value="11"
										class="inputRadio"> �⺻ǥ�� 11</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk12" name="defaultimg" value="12"
										class="inputRadio"> �⺻ǥ�� 12</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk13" name="defaultimg" value="13"
										class="inputRadio"> �⺻ǥ�� 13</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk14" name="defaultimg" value="14"
										class="inputRadio"> �⺻ǥ�� 14</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk15" name="defaultimg" value="15"
										class="inputRadio"> �⺻ǥ�� 15</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk16" name="defaultimg" value="16"
										class="inputRadio"> �⺻ǥ�� 16</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk17" name="defaultimg" value="17"
										class="inputRadio"> �⺻ǥ�� 17</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk18" name="defaultimg" value="18"
										class="inputRadio"> �⺻ǥ�� 18</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk19" name="defaultimg" value="19"
										class="inputRadio"> �⺻ǥ�� 19</label></li>
								<li><label><input type="radio"
										id="defaultimg_chk20" name="defaultimg" value="20"
										class="inputRadio"> �⺻ǥ�� 20</label></li>
							</ul>
							<p class="thum" id="defaultimg1" style="display: block">
								<img src="http://cf.joara.com/literature_file/default1_new.jpg"
									alt="�⺻ǥ��1" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg2" style="display: none">
								<img src="http://cf.joara.com/literature_file/default2_new.jpg"
									alt="�⺻ǥ��2" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg3" style="display: none">
								<img src="http://cf.joara.com/literature_file/default3_new.jpg"
									alt="�⺻ǥ��3" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg4" style="display: none">
								<img src="http://cf.joara.com/literature_file/default4_new.jpg"
									alt="�⺻ǥ��4" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg5" style="display: none">
								<img src="http://cf.joara.com/literature_file/default5_new.jpg"
									alt="�⺻ǥ��5" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg6" style="display: none">
								<img src="http://cf.joara.com/literature_file/default6_new.jpg"
									alt="�⺻ǥ��6" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg7" style="display: none">
								<img src="http://cf.joara.com/literature_file/default7_new.jpg"
									alt="�⺻ǥ��7" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg8" style="display: none">
								<img src="http://cf.joara.com/literature_file/default8_new.jpg"
									alt="�⺻ǥ��8" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg9" style="display: none">
								<img src="http://cf.joara.com/literature_file/default9_new.jpg"
									alt="�⺻ǥ��9" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg10" style="display: none">
								<img src="http://cf.joara.com/literature_file/default10_new.jpg"
									alt="�⺻ǥ��10" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg11" style="display: none">
								<img src="http://cf.joara.com/literature_file/default11_new.jpg"
									alt="�⺻ǥ��11" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg12" style="display: none">
								<img src="http://cf.joara.com/literature_file/default12_new.jpg"
									alt="�⺻ǥ��12" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg13" style="display: none">
								<img src="http://cf.joara.com/literature_file/default13_new.jpg"
									alt="�⺻ǥ��13" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg14" style="display: none">
								<img src="http://cf.joara.com/literature_file/default14_new.jpg"
									alt="�⺻ǥ��14" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg15" style="display: none">
								<img src="http://cf.joara.com/literature_file/default15_new.jpg"
									alt="�⺻ǥ��15" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg16" style="display: none">
								<img src="http://cf.joara.com/literature_file/default16_new.jpg"
									alt="�⺻ǥ��16" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg17" style="display: none">
								<img src="http://cf.joara.com/literature_file/default17_new.jpg"
									alt="�⺻ǥ��17" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg18" style="display: none">
								<img src="http://cf.joara.com/literature_file/default18_new.jpg"
									alt="�⺻ǥ��18" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg19" style="display: none">
								<img src="http://cf.joara.com/literature_file/default19_new.jpg"
									alt="�⺻ǥ��19" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg20" style="display: none">
								<img src="http://cf.joara.com/literature_file/default20_new.jpg"
									alt="�⺻ǥ��20" width="67" height="96">
							</p>
							<p class="thum" id="defaultimg999" style="display: none">
								<img id="defaultimg999_img" src="" alt="��������" width="67"
									height="96">
							</p>
						</div>
						<div class="select_file">
							<label id="defaultimg_chk_999"><input type="radio"
								id="defaultimg_chk999" name="defaultimg" value="999"
								onclick="uploadUserFile();"> ��������</label> <input type="text"
								id="bookimg" name="master_imageroute" onfocus="blur()" class="input_text"
								style="width: 255px;" onclick="uploadUserFile();"> <img
								src="/images/content/customer/bg_file_add.gif"
								style="cursor: pointer" onclick="uploadUserFile();"><input
								type="hidden" id="bookimg_real" name="bookimg_real" value="">
						</div>
					</td>
				</tr>
				<tr>
					<th rowspan="3">��ǰ �� ����</th>
					<td class="bg">���� ����</td>
					<td class="radio"><label><input type="radio"
							name="master_reviewavailyn" value="y" checked class="inputRadio">
							���</label> <label><input type="radio" name="master_reviewavailyn"
							value="n" class="inputRadio"> �����</label></td>
				</tr>
				<tr>
					<td class="bg">�ڸ�Ʈ ����</td>
					<td class="radio"><label><input type="radio"
							name="master_commentavailyn" value="y" checked class="inputRadio">
							���</label> <label><input type="radio" name="master_commentavailyn" value="n"
							class="inputRadio"> �����</label></td>
				</tr>
				<tr>
					<td class="bg">�� ����</td>
					<td class="radio"><label><input type="radio"
							name="master_evalavailyn" value="y" class="inputRadio"> ���</label> <label><input
							type="radio" name="master_evalavailyn" value="n" checked class="inputRadio">
							�����</label></td>
				</tr>
			</table>
		
		<div class="btn_area">
			<p class="btnL">
				<!-- <a href="/mypage/notebook/literature_list.html?lit_type=&kind="
					class="btn_basic_w"><span>���� ���</span></a> -->
				<a href="piece_piecePersonal.jsp">���� ������� ���ư���</a>
			</p>
			<p class="btnR">
				<input type="submit" value="���">
				<!-- <a href="#" id="btn_write" class="btn_basic_b ls10"><span>���</span></a> -->
				<a href="#" id="btn_cancle" class="btn_basic_w ls10"><span>���</span></a>
			</p>
		</div>
		</form>
	</div>
</body>
</html>