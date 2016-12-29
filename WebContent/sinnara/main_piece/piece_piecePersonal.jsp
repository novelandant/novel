
<%@page import="prj.novel.piece.Piece_serially_DTO"%>
<%@page import="prj.novel.piece.Master_piece_DTO"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function onclick() {
		document.location.href = '/piece_pieceControl.jsp';
	}
	function delcheck(){
		result = confirm("������ �����Ͻðڽ��ϱ�?");
		
		if(result == true){
			document.setform.action.value="masdelete";
			document.setform.submit();
		}
		else return;
	}
	function fnRead(num){
		document.read.b_num.value = num;
		document.read.submit();
	}
</script>

</head>
<body>

	<%
		String str;
		Piece_serially_DTO serdto = new Piece_serially_DTO();
		for (Master_piece_DTO dto : (ArrayList<Master_piece_DTO>) datas) {
	%>

	<table class="tbl_management" border="1">
		<colgroup>
			<col style="width: 470px;">
			<col style="width: auto;">
		</colgroup>
		<tbody>
			<tr class="title_info">
				<td class="title"> [<%=dto.getMaster_piecenum()%>][<%=dto.getMaster_kindcode()%>
						/ <%=dto.getMaster_fendencycode()%>][<%=dto.getMaster_bigcategory()%>
						/ <%=dto.getMaster_smallcategory()%>] <a href="javascript:fnRead('<%=dto.getMaster_piecenum()%>)"><%=dto.getMaster_piece()%></a>
				</td>
				<td><span class="bookmark">�κм��� &amp; ����</span> <select
					id="sortno_1160839">
						
					

						<option value=""> ȸ</option> <!-- �߰� -->
						
				</select><a href="#"><input type="button" value="�̵�"></a></td>
			</tr>
			<tr class="work_info">
				<td>
					<div class="book_info info2">
						<p class="book">
							<a href="/literature/view/book_intro.html?book_code=1160839"><img
								src="http://cf.joara.com/literature_file/default1_new.jpg"
								alt="åǥ��"></a></p>
								<p>�̹��� ��� : <%=dto.getMaster_imageroute()%>
						</p>
						<ul class="long">
							<li><strong>�ֱ� ��� ��</strong> 2016.12.23 10:49</li>
							<li><strong>�Ϲ���ȸ</strong> 0</li>
							<li><strong>��õ / ����</strong> 0 / 0</li>
							<li><strong>�ڸ�Ʈ / ����</strong> 0 / 0</li>
							<li>Ű���� : <%=dto.getMaster_keyword()%>
							<li>��ǰ �Ұ� : <%=dto.getMaster_pieceintroduce()%></li>
						</ul>
						<p class="btn">
							<a href="#">���� ����</a><br>
							<a href="#">�ڸ�Ʈ</a> <br />
							
						</p>
					</div>
				</td>
				<td>
					<div class="btn_set">
						<!-- <a
							href="literature_part_write.html?mode=next&amp;book_code=1160839&amp;sortno=2&amp;lit_type=series&amp;kind=series&amp;page_no=1">
							<img src="/images/content/mypage/btn_story_composing.gif"
							alt="�̾��"> -->
						
							<a href="piece_pieceWrite.jsp">
							<input type="submit" value="�� ����"></a>

						<!-- <a href="/mypage/write/literature_write.html?book_code=1160839&lit_type=series&kind=series&page_no=1"><img src="/images/content/mypage/btn_modify_delete.gif" alt="����/����"></a> -->
							
							<br>
							<br>

						���� ��� ���� :
						<%=dto.getMaster_reviewavailyn()%><br> �ڸ�Ʈ ��� ���� :
						<%=dto.getMaster_commentavailyn()%><br> �� ��� ���� :
						<%=dto.getMaster_evalavailyn()%><br>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<table>
		<tr>
			<td colspan="2">
				<div class="btn_gather">
				<form name="read" method="post" action="piece_piecePersonalEdit.jsp">
					<a href="#"><input type="button" value="��ǰ ���� �Խ���"></a>			
					<a href="main_piece.jsp"><input type="button" value="�� ������� ���ư���"></a>
					<a href="piece_piecePersonalSet.jsp"><input type="button" value="���ο� ��ǰ �ۼ�"></a>
						<input type="submit" value="���� �� ����">
						<input type="hidden" name="b_num"/>
					</form>
					
				</div>
			</td>
		</tr>
	</table>
	<%
		}
	%>
	
	<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>