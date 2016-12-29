
<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 쓰기</title>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js"
	charset="euc-kr"></script>
<script src="/se2/js/jquery-3.1.1.min.js" charset="euc-kr"></script>
<%@ include file="/sinnara/commons/_header.jspf" %>
</head>
<body>



	<!-- 게시글 등록  -->

	<form name="pieceWriteForm" method="post"
		action="piece_pieceControl.jsp">
		<input type="hidden" name="b_ip" value="<%=request.getRemoteAddr() %>" />
		<input type="hidden" name="action" value="serinsert">
		<div align="center">
			<table border="1">
				<tr>
					<th>소제목</th>
					<td><textarea cols="100" rows="1" name="piece_smallsubject"
							maxlength="40"></textarea></td>
				</tr>
				<tr>
					<th>작품 내용</th>
					<td><textarea name="piece_content" id="piece_content" rows="10" cols="100"
							style="width: 700px; height: 350px;"></textarea></td>
					
					<!--  <td><textarea cols="60" rows="30" name="piece_content"></textarea></td>-->
				</tr>
				<tr>
					<th>작품 후기</th>
					<td><textarea cols="100" rows="10" name="piece_epilogue"></textarea></td>
				</tr>
			</table>
			<input type="submit" id="submit_button" value="등록" onclick="submitContents(this)">
			<a href="piece_pieceControl.jsp?action=maslist"><input type="button" value="돌아가기"></a>
			<input type="reset" value="다시 작성" />
		</div>
	</form>


	<script>
		// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
		    // 에디터의 내용이 textarea에 적용된다.
		    oEditors.getById["piece_content"].exec("UPDATE_CONTENTS_FIELD", []);
		 
		    // 에디터의 내용에 대한 값 검증은 이곳에서
		    // document.getElementById("piece_content").value를 이용해서 처리한다.
		 
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
							oEditors.getById["piece_content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다. 
							// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
						try {
							elClickedObj.form.submit();
							} catch(e) {}
						}
			</script>
			<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>

</html>