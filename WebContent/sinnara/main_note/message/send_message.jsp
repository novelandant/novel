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
			
			$("#note_receiveid").change(function(){
				$.get("received_id_check.jsp", {sendID:$("#note_receiveid").val()}, 
						function(data){
							alert(data);
					});
			});
		});
	</script>
</head>

<body id="body_m" class="" >
	<div id="dialog" title="�˸�" style="display:none">
	  <p>���� ���� ������ �Է� �ϼ���.</p>
	</div>

	<jsp:useBean id="dao" class="prj.novel.note.NoteGetDao" />
	
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
						<option value="send_message.jsp" selected>���� ������</option>
					</select>
				</div>
			</div>
			<form id="messageForm" method="post" action="send_message_proc.jsp">
				<input type="hidden" id="message_mode" name="message_mode" value="">
				<input type="hidden" id="note_sendid" name="note_sendid" value="${loginID}">
					
				<section class="message_box_area viewer_work_write">
					<table class="tbl_write border">
						<colgroup>
							<col style="width:146px">
							<col style="width:auto;">
						</colgroup>
						<tr>
							<th><label for="la_id">�޴»�� ���̵�</label></th>
							<td><input type="text" id="note_receiveid" name="note_receiveid" title="�޴»�� ���̵�" size="10" class="input_text" style="width:95%;" required="required"/></td>
						</tr>
						<tr>
							<th><label for="la_subject">����</label></th>
							<td><input type="text" id="note_subject" name="note_subject" title="����" size="10" class="input_text" style="width:95%;" required/></td>
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
</body>
</html>