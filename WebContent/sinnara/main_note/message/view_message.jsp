<%@ page import="java.util.HashMap"%>
<%@ page import="prj.novel.note.NoteGetDto"%>
<%@ page import="prj.novel.note.NoteGetDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<title>�ų��� : ��ȭ�� ���� - </title>
	
	<link rel="shortcut icon" type="image/x-icon" href="/fcon.ico">
	<link rel="stylesheet" type="text/css" href="/SinnaraPrj/sinnara/main_note/joara_css/base.css" media="all">
	<link rel="stylesheet" type="text/css" href="/SinnaraPrj/sinnara/main_note/joara_css/content.css" media="all">
							
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<script	src="https://s3-ap-northeast-1.amazonaws.com/joara-cdn/js/user_func151027-1.min.js"></script>
	<script type="text/javascript" src="https://s3-ap-northeast-1.amazonaws.com/joara-cdn/js/jq.nyroModal.custom.js"></script>
	
	<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
	<link rel="stylesheet" href="/SinnaraPrj/sinnara/main_note/joara_css/nyroModal.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/SinnaraPrj/sinnara/main_note/message_css/sinara_message.css" media="all">

	<script type="text/javascript">
		$(function() {
			$(".nyroModal").nyroModal();
		});
	</script>
	
	<script>
		$(function() {
			$("a[id=btn_motion]").click(function(){
				var mode=$(this).attr("mode");

				if(mode=='message_del'){
					var msg="���� �����Ͻðڽ��ϱ�?";
				}else{
					var msg="���������� �̵� �Ͻðڽ��ϱ�?";
				}

				if(confirm(msg)) {
					$("#message_mode").val(mode);
					$("#messageViewForm").submit();
				} else {
					return false;
				}
			});
		});
	</script>
</head>

<body id="body_m" class="" >
	<div id="wrap">
		<%@ include file="/sinnara/main_note/inc/message_header.jsp"%>
	
		<form id="messageViewForm" method="post" action="/SinnaraPrj/message?cmd=MESSAGE_PROC">
			<input type="hidden" id="message_mode" name="message_mode" >
			<input type="hidden" id="message_gubun" name="message_gubun" value="RECEIVE">
			<input type="hidden" id="message_num" name="message_num" value="${noteDto.getNote_getnum()}">
			
			<input type="hidden" id="page" name="page" value="">
			<input type="hidden" id="message_idx[]" name="message_idx[]" value="${noteDto.getNote_getnum()}">
		</form>
	
		<div id="container" class="clearfix">
			<%@ include file="/sinnara/main_note/inc/message_left.jsp"%>
			
			<div id="content">
				<div class="title">
					<h3><img src="/SinnaraPrj/sinnara/main_note/images/message/t_inbox.gif" alt="���� ������"></h3>
					<div class="path">
						Ȩ &gt; ���� &gt; 
						<select class="fe_select" onchange="location.href=this.value">
							<option value="/SinnaraPrj/message?cmd=RECEIVE_MESSAGE_LIST&page=RECEIVE" selected>���� ������</option>
							<option value="/SinnaraPrj/message?cmd=SEND_MESSAGE_LIST&page=SEND">���� ������</option>
							<option value="/SinnaraPrj/message?cmd=RECEIVE_MESSAGE_LIST&page=R_STORE">���� ���� ������</option>
							<option value="/SinnaraPrj/message?cmd=SEND_MESSAGE_LIST&page=S_STORE">���� ���� ������</option>
							<option value="send_message.html" >���� ������</option>
						</select>
					</div>
				</div>
				<section class="message_box_area viewer_work_view">
					<div class="message_view_option">
						<a href="#" id="btn_motion" class="btn_delete" mode="message_del" ><span>����</span></a> 
						<a href="#" id="btn_motion" mode="message_store" class="btn_message" ><span>����</span></a>
						<a href="/SinnaraPrj/message?cmd=REPLY_MESSAGE&msgNum=${noteDto.getNote_getnum()}" class="btn_message"><span>����</span></a>
						<a href="/SinnaraPrj/message?cmd=RECEIVE_MESSAGE_LIST&page=RECEIVE" class="btn_view_list">���</a>
						<span class="list_btn">
							<a href="" class="prev" style="background:url('/SinnaraPrj/sinnara/main_note/images/message/btn_prev.gif') no-repeat left top;">����</a>|
							<a href="" class="next" style="background:url('/SinnaraPrj/sinnara/main_note/images/message/btn_next.gif') no-repeat right top;">����</a>
						</span>
					</div>
					<table class="tbl_list notice_view tbl_message">
						<thead>
							<tr>
								<th class="height">
									���� ��� : ${noteDto.getNote_sendid()}<br>
									���� �ð� : ${noteDto.getNote_regdate()}<span class="line">|</span>
									<span class="option">
										<a href="pop_report.html?msg_idx=${noteDto.getNote_getnum()}&friend_id=${noteDto.getNote_sendid()}" class="nyroModal">���� |  �Ű�</a>
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="view">
									<div class="view_cont2">
										${noteDto.getNote_content()}							
									</div>
									<ul class="view_info">
										<li>���� ������ 30�� �Ŀ� �ڵ����� �����˴ϴ�.</li>
										<li>���� ���� ������ 3���� �� �ڵ� �����˴ϴ�. </li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area">
						<div class="btnL">
							<a href="/SinnaraPrj/message?cmd=RECEIVE_MESSAGE_LIST&page=RECEIVE" class="common_btn"><span>���� ���</span></a> 
						</div>
						<div class="btnR">
							<a href="/SinnaraPrj/message?cmd=REPLY_MESSAGE&msgNum=${noteDto.getNote_getnum()}"  class="common_btn btn3"><span>����</span></a>					
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- side bar -->

	<c:if test="${msgMap.PREV>0}">
		<script>
			$(function(){$(".prev").attr("href", "/SinnaraPrj/message?cmd=VIEW_MESSAGE&page=RECEIVE&msgNum=${msgMap.PREV}")});
		</script>
	</c:if>
	<c:if test="${msgMap.PREV==0}">
		<script>
			$(function(){$(".prev").attr("href", "javascript:alert('���� ������ �����ϴ�.')")});
		</script>
	</c:if>
	<c:if test="${msgMap.NEXT>0}">
		<script>
			$(function(){$(".next").attr("href", "/SinnaraPrj/message?cmd=VIEW_MESSAGE&page=RECEIVE&msgNum=${msgMap.NEXT}")});
		</script>
	</c:if>
	<c:if test="${msgMap.NEXT==0}">
		<script>
			$(function(){$(".next").attr("href", "javascripT:alert('���� ������ �����ϴ�.')")});
		</script>
	</c:if>
	
	<%@ include file="/sinnara/main_note/inc/message_right.jsp"%>
<!-- wrap end -->
<!-- footer -->


<footer id="footer">
	<div class="footer_area"></div>
</footer>

</body>
</html>