
<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js"
	charset="euc-kr"></script>
<script src="/se2/js/jquery-3.1.1.min.js" charset="euc-kr"></script>
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>



	<!-- �Խñ� ���  -->

	<form name="pieceWriteForm" method="post"
		action="piece_pieceControl.jsp">
		<input type="hidden" name="b_ip" value="<%=request.getRemoteAddr() %>" />
		<input type="hidden" name="action" value="serinsert">
		<div align="center">
			<table border="1">
				<tr>
					<th>������</th>
					<td><textarea cols="100" rows="1" name="piece_smallsubject"
							maxlength="40"></textarea></td>
				</tr>
				<tr>
					<th>��ǰ ����</th>
					<td><textarea name="piece_content" id="piece_content" rows="10" cols="100"
							style="width: 700px; height: 350px;"></textarea></td>
					
					<!--  <td><textarea cols="60" rows="30" name="piece_content"></textarea></td>-->
				</tr>
				<tr>
					<th>��ǰ �ı�</th>
					<td><textarea cols="100" rows="10" name="piece_epilogue"></textarea></td>
				</tr>
			</table>
			<input type="submit" id="submit_button" value="���" onclick="submitContents(this)">
			<a href="piece_pieceControl.jsp?action=maslist"><input type="button" value="���ư���"></a>
			<input type="reset" value="�ٽ� �ۼ�" />
		</div>
	</form>


	<script>
		// �����塯 ��ư�� ������ �� ������ ���� �׼��� ���� �� submitContents�� ȣ��ȴٰ� �����Ѵ�.
		function submitContents(elClickedObj) {
		    // �������� ������ textarea�� ����ȴ�.
		    oEditors.getById["piece_content"].exec("UPDATE_CONTENTS_FIELD", []);
		 
		    // �������� ���뿡 ���� �� ������ �̰�����
		    // document.getElementById("piece_content").value�� �̿��ؼ� ó���Ѵ�.
		 
		    try {
		        elClickedObj.pieceWriteForm.submit();
		    } catch(e) {}
		    </script>
		    <script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef : oEditors,
							elPlaceHolder : "piece_content",
							sSkinURI : "se2/SmartEditor2Skin.html",
							fCreator : "createSEditor2"
						});
						function submitContents(elClickedObj) {
							oEditors.getById["piece_content"].exec("UPDATE_CONTENTS_FIELD", []);	// �������� ������ textarea�� ����˴ϴ�. 
							// �������� ���뿡 ���� �� ������ �̰����� document.getElementById("ir1").value�� �̿��ؼ� ó���ϸ� �˴ϴ�.
						try {
							elClickedObj.form.submit();
							} catch(e) {}
						}
			</script>
			<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>

</html>