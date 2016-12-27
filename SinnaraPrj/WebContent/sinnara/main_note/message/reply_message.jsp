<%@page import="prj.novel.note.NoteGetDto"%>
<%@ page import="prj.novel.note.NoteGetDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<title>�ų��� : ��ȭ�� ���� - </title>
	
	<link rel="stylesheet" href="../bootstrap337/css/bootstrap.min.css"/>
	<script src="../bootstrap337/js/jquery-3.1.1.min.js"></script>
	<script src="../bootstrap337/js/bootstrap.min.js"></script>
	
	<link rel="shortcut icon" type="image/x-icon" href="/fcon.ico">
	<link rel="stylesheet" type="text/css" href="../joara_css/base.css" media="all">
	<link rel="stylesheet" type="text/css" href="../joara_css/content.css" media="all">
							
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
	<link rel="stylesheet" href="../joara_css/nyroModal.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" href="../message_css/sinara_message.css" media="all">
	
	<!-- JQueryUI����... -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
 	<script>
		$(function() {
			$("#rev_id").attr("readonly",true);
			$("#btn_write").click(function() {
				if ($("#note_content").val() == "") {
					$("#dialog").dialog();
					$("#note_content").focus();
				}
				else {
					$("#messageForm").submit();
				}
			});
		});
	</script>
</head>

<body id="body_m" class="" >
	<div id="dialog" title="�˸�" style="display:none">
	  <p>���� ���� ������ �Է� �ϼ���.</p>
	</div>

	<jsp:useBean id="dao" class="prj.novel.note.NoteGetDao" />
	<%
		int num = Integer.parseInt(request.getParameter("msgNum"));
		NoteGetDto noteDto = dao.getNoteByGetNum(num, "read");
		pageContext.setAttribute("noteDto", noteDto);
	%>
	
	<div id="wrap">
		<%@ include file="../inc/message_header.jsp"%>
	
		<div id="container" class="clearfix">
			<%@ include file="../inc/message_left.jsp"%>

			<div id="content">
				<div class="title">
				<h3><img src="../images/message/t_inbox_send.gif" alt="����  ������"></h3>
				<div class="path">
					Ȩ &gt; ���� &gt; 
					<select class="fe_select" onchange="location.href=this.value">
						<option value="receive_message_list.jsp" >���� ������</option>
						<option value="receive_message_list.jsp?page=send" >���� ������</option>
						<option value="receive_message_list.jsp?page=r_store" >���� ���� ������</option>
						<option value="receive_message_list.jsp?page=s_store" >���� ���� ������</option>
						<option value="send_message.html" selected>���� ������</option>
					</select>
				</div>
			</div>
			<form id="messageForm" method="post" action="send_message_proc.jsp">
				<input type="hidden" id="message_mode" name="message_mode" value="">
				
				<input type="hidden" id="note_subject" name="note_subject" value="${noteDto.getNote_subject()}">
				<input type="hidden" id="note_sendid" name="note_sendid" value="${noteDto.getNote_receiveid()}">
					
				<section class="message_box_area viewer_work_write">
					<table class="tbl_write border">
						<colgroup>
							<col style="width:146px">
							<col style="width:auto;">
						</colgroup>
						<tr>
							<th><label for="la_id">�޴»�� ���̵�</label></th>
							<td><input type="text" id="note_receiveid" name="note_receiveid" title="�޴»�� ���̵�" size="10" class="input_text" style="width:95%;" value="${noteDto.getNote_sendid()}"/></td>
						</tr>
						<tr>
							<th><label for="la_cont">����</label></th>
							<td class="write">
								<textarea id="note_content" name="note_content" rows="5" cols="50" class="textarea" placeholder="�̿����� ��߳��� ���� �� ����, ����, ������ ���� ������ ���� �� �� �ֽ��ϴ�." style="width:580px; height:210px;"></textarea>
								<p class="mess_keep"><label><input type="checkbox" name="note_keepyn" value="s" class="inputCheck" /> ���� �����Կ� ����</label></p>
							</td>
						</tr>
					</table>
					<div class="btnC">
						<a id="btn_write" class="common_btn btn3"><span>������</span></a>
					</div>
				</section>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="../inc/message_right.jsp"%>

	<!-- wrap end -->

	<!-- footer -->
	<footer id="footer">
	</footer>
<!-- member layer -->
	<div class="layer" id="layer_members" style="position:absolute;">
		<a href="#" class="close"><img src="/images/content/work/btn_close.gif" alt="close"></a>
		<ul class="set">
			<li id="layer_member_goyard"><a href="#" target="_blank">�� �ٷΰ���</a></li>
			<li id="layer_member_memberinfo"><a href="#">ȸ������</a></li>
			<li id="friend_reg"><a href="#">�̿����</a></li>
			<li id="bad_friend_reg"><a href="#">�ҷ��̿����</a></li>
			<li id="layer_member_messagesend"><a href="#">����������</a></li>
			<li id="layer_member_report"><a href="#">�Ű��ϱ�</a></li>
		</ul>
	</div>
	<script type="text/javascript">
<script type="text/javascript">
  //  ga not defined ���� (epkim 16.02.19)
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48261815-1', 'joara.com');
  ga('send', 'pageview');

</script>

<script type="text/javascript">
$(document).ready(function() {
	// ���� storage ��� (ie8 �̻�)
	if (window.sessionStorage) {
		var ss_login_value = sessionStorage.getItem('jw_login_log');
		if (ss_login_value != 'y') {
			// makeLoginLog();
			// ���� storage �� ��� ����
			console.log('log: session');
			sessionStorage.setItem('jw_login_log', 'y');
		} // end if
	}
	// ���� storage �������� ��� cookie ���
	else {
		var ck_login_value = getCookie('jw_login_log'); // func.js ���
		if (ck_login_value != 'y') {
			// makeLoginLog();
			// ��Ű�� ��� ����
			console.log('log: cookie');
			setCookie('jw_login_log', 'y'); // func.js ���
		} // end if
	} // end of (window.sessionStorage)

});
</script>

</body>
</html>