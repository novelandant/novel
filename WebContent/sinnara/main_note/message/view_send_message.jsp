<%@page import="java.util.HashMap"%>
<%@page import="prj.novel.note.NoteSendDto"%>
<%@ page import="prj.novel.note.NoteSendDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<title>�ų��� : ��ȭ�� ���� - </title>
	
	<link rel="shortcut icon" type="image/x-icon" href="/fcon.ico">
	<link rel="stylesheet" type="text/css" href="../joara_css/base.css" media="all">
	<link rel="stylesheet" type="text/css" href="../joara_css/content.css" media="all">
							
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<script	src="https://s3-ap-northeast-1.amazonaws.com/joara-cdn/js/user_func151027-1.min.js"></script>
	<script type="text/javascript" src="https://s3-ap-northeast-1.amazonaws.com/joara-cdn/js/jq.nyroModal.custom.js"></script>
	
	<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
	<link rel="stylesheet" href="../joara_css/nyroModal.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" href="../message_css/sinara_message.css" media="all">

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

	<jsp:useBean id="dao" class="prj.novel.note.NoteSendDao" />
	<jsp:useBean id="Gdao" class="prj.novel.note.NoteGetDao" />
	
	<%
		int num = Integer.parseInt(request.getParameter("msgNum"));
		NoteSendDto noteDto = dao.getNoteSendBySendNum(num, "read");
		pageContext.setAttribute("noteDto", noteDto);

		String loginUser = (String)session.getAttribute("loginID");
		String pageGubun = (String)session.getAttribute("page_gubun");
		
		HashMap msgMap = new HashMap();
		msgMap = Gdao.getPrevNextNum(loginUser, pageGubun, num);
		
		pageContext.setAttribute("msgMap", msgMap);
	%>
	
	<div id="wrap">
		<%@ include file="../inc/message_header.jsp"%>
	
		<form id="messageViewForm" method="post" action="message_proc.jsp">
			<input type="hidden" id="message_mode" name="message_mode" >
			<input type="hidden" id="message_gubun" name="message_gubun" value="SEND">
			<input type="hidden" id="message_num" name="message_num" value="${noteDto.getNote2_sendnum()}">
			
			<input type="hidden" id="page" name="page" value="send">
			<input type="hidden" id="message_idx[]" name="message_idx[]" value="${noteDto.getNote2_sendnum()}">
		</form>
	
		<div id="container" class="clearfix">
			<%@ include file="../inc/message_left.jsp"%>
			
			<div id="content">
				<div class="title">
					<h3><img src="../images/message/t_send_message.gif" alt="���� ������"></h3>
					<div class="path">
						Ȩ &gt; ���� &gt; 
						<select class="fe_select" onchange="location.href=this.value">
							<option value="receive_message_list.jsp?page=receive" selected>���� ������</option>
							<option value="send_message_list.jsp?page=send" >���� ������</option>
							<option value="receive_message_list.jsp?page=r_store" >���� ���� ������</option>
							<option value="send_message_list.jsp?page=s_store" >���� ���� ������</option>
							<option value="send_message.html" >���� ������</option>
						</select>
					</div>
				</div>
				<section class="message_box_area viewer_work_view">
					<div class="message_view_option">
						<a href="#" id="btn_motion" class="btn_delete" mode="message_del" ><span>����</span></a> 
						<a href="#" id="btn_motion" mode="message_store" class="btn_message" ><span>����</span></a>

						<a href="send_message_list.jsp?page=send" class="btn_view_list">���</a>
						<span class="list_btn">
							<a href="" class="prev" style="background:url('../images/message/btn_prev.gif') no-repeat left top;">����</a>|
							<a href="" class="next" style="background:url('../images/message/btn_next.gif') no-repeat right top;">����</a>
						</span>
					</div>
					<table class="tbl_list notice_view tbl_message">
						<thead>
							<tr>
								<th class="height">
									�޴� ��� : ${noteDto.getNote2_receiveid()}<br>
									���� �ð� : ${noteDto.getNote2_regdate()}<span class="line">|</span>
									<span class="option">
										<a href="pop_report.html?msg_idx=${noteDto.getNote2_sendnum()}&friend_id=${noteDto.getNote2_receiveid()}" class="nyroModal">���� |  �Ű�</a>
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="view">
									<div class="view_cont2">
										${noteDto.getNote2_content()}							
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
							<a href="send_message_list.jsp?page=send" class="common_btn"><span>���� ���</span></a> 
						</div>
						<div class="btnR">
												
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- side bar -->

	<c:if test="${msgMap.PREV>0}">
		<script>
			$(function(){$(".prev").attr("href", "view_send_message.jsp?msgNum=${msgMap.PREV}")});
		</script>
	</c:if>
	<c:if test="${msgMap.PREV==0}">
		<script>
			$(function(){$(".prev").attr("href", "javascript:alert('���� ������ �����ϴ�.')")});
		</script>
	</c:if>
	<c:if test="${msgMap.NEXT>0}">
		<script>
			$(function(){$(".next").attr("href", "view_send_message.jsp?msgNum=${msgMap.NEXT}")});
		</script>
	</c:if>
	<c:if test="${msgMap.NEXT==0}">
		<script>
			$(function(){$(".next").attr("href", "javascripT:alert('���� ������ �����ϴ�.')")});
		</script>
	</c:if>
	
	<%@ include file="../inc/message_right.jsp"%>
<!-- wrap end -->
<!-- footer -->


<footer id="footer">
	<div class="footer_area"></div>
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