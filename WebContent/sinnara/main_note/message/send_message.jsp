<%@page import="prj.novel.note.NoteGetDto"%>
<%@ page import="prj.novel.note.NoteGetDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<title>신나라 : 문화의 시작 - </title>
	
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
	
	<!-- JQueryUI관련... -->
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
	<div id="dialog" title="알림" style="display:none">
	  <p>보낼 쪽지 내용을 입력 하세요.</p>
	</div>

	<jsp:useBean id="dao" class="prj.novel.note.NoteGetDao" />
	
	<div id="wrap">
		<%@ include file="../inc/message_header.jsp"%>
	
		<div id="container" class="clearfix">
			<%@ include file="../inc/message_left.jsp"%>

			<div id="content">
				<div class="title">
				<h3><img src="../images/message/t_inbox_send.gif" alt="쪽지  보내기"></h3>
				<div class="path">
					홈 &gt; 쪽지 &gt; 
					<select class="fe_select" onchange="location.href=this.value">
						<option value="receive_message_list.jsp" >받은 쪽지함</option>
						<option value="receive_message_list.jsp?page=send" >보낸 쪽지함</option>
						<option value="receive_message_list.jsp?page=r_store" >받은 쪽지 보관함</option>
						<option value="receive_message_list.jsp?page=s_store" >보낸 쪽지 보관함</option>
						<option value="send_message.jsp" selected>쪽지 보내기</option>
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
							<th><label for="la_id">받는사람 아이디</label></th>
							<td><input type="text" id="note_receiveid" name="note_receiveid" title="받는사람 아이디" size="10" class="input_text" style="width:95%;" required="required"/></td>
						</tr>
						<tr>
							<th><label for="la_subject">제목</label></th>
							<td><input type="text" id="note_subject" name="note_subject" title="제목" size="10" class="input_text" style="width:95%;" required/></td>
						</tr>
						<tr>
							<th><label for="la_cont">내용</label></th>
							<td class="write">
								<textarea id="note_content" name="note_content" rows="5" cols="50" class="textarea" placeholder="이용약관에 어긋나는 스팸 및 광고, 음란, 폭력적 등의 내용은 제재 될 수 있습니다." style="width:580px; height:210px;"></textarea>
								<p class="mess_keep"><label><input type="checkbox" name="note_keepyn" value="s" class="inputCheck" /> 보낸 쪽지함에 보관</label></p>
							</td>
						</tr>
					</table>
					<div class="btnC">
						<a id="btn_write" class="common_btn btn3"><span>보내기</span></a>
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
			<li id="layer_member_goyard"><a href="#" target="_blank">뜰 바로가기</a></li>
			<li id="layer_member_memberinfo"><a href="#">회원정보</a></li>
			<li id="friend_reg"><a href="#">이웃등록</a></li>
			<li id="bad_friend_reg"><a href="#">불량이웃등록</a></li>
			<li id="layer_member_messagesend"><a href="#">쪽지보내기</a></li>
			<li id="layer_member_report"><a href="#">신고하기</a></li>
		</ul>
	</div>
</body>
</html>