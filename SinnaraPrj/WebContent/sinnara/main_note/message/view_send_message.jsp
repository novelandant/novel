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
	<title>신나라 : 문화의 시작 - </title>
	
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
					var msg="정말 삭제하시겠습니까?";
				}else{
					var msg="보관함으로 이동 하시겠습니까?";
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
					<h3><img src="../images/message/t_send_message.gif" alt="보낸 쪽지함"></h3>
					<div class="path">
						홈 &gt; 쪽지 &gt; 
						<select class="fe_select" onchange="location.href=this.value">
							<option value="receive_message_list.jsp?page=receive" selected>받은 쪽지함</option>
							<option value="send_message_list.jsp?page=send" >보낸 쪽지함</option>
							<option value="receive_message_list.jsp?page=r_store" >받은 쪽지 보관함</option>
							<option value="send_message_list.jsp?page=s_store" >보낸 쪽지 보관함</option>
							<option value="send_message.html" >쪽지 보내기</option>
						</select>
					</div>
				</div>
				<section class="message_box_area viewer_work_view">
					<div class="message_view_option">
						<a href="#" id="btn_motion" class="btn_delete" mode="message_del" ><span>삭제</span></a> 
						<a href="#" id="btn_motion" mode="message_store" class="btn_message" ><span>보관</span></a>

						<a href="send_message_list.jsp?page=send" class="btn_view_list">목록</a>
						<span class="list_btn">
							<a href="" class="prev" style="background:url('../images/message/btn_prev.gif') no-repeat left top;">이전</a>|
							<a href="" class="next" style="background:url('../images/message/btn_next.gif') no-repeat right top;">다음</a>
						</span>
					</div>
					<table class="tbl_list notice_view tbl_message">
						<thead>
							<tr>
								<th class="height">
									받는 사람 : ${noteDto.getNote2_receiveid()}<br>
									보낸 시간 : ${noteDto.getNote2_regdate()}<span class="line">|</span>
									<span class="option">
										<a href="pop_report.html?msg_idx=${noteDto.getNote2_sendnum()}&friend_id=${noteDto.getNote2_receiveid()}" class="nyroModal">차단 |  신고</a>
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
										<li>읽은 쪽지는 30일 후에 자동으로 삭제됩니다.</li>
										<li>읽지 않은 쪽지는 3개월 후 자동 삭제됩니다. </li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area">
						<div class="btnL">
							<a href="send_message_list.jsp?page=send" class="common_btn"><span>쪽지 목록</span></a> 
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
			$(function(){$(".prev").attr("href", "javascript:alert('이전 쪽지가 없습니다.')")});
		</script>
	</c:if>
	<c:if test="${msgMap.NEXT>0}">
		<script>
			$(function(){$(".next").attr("href", "view_send_message.jsp?msgNum=${msgMap.NEXT}")});
		</script>
	</c:if>
	<c:if test="${msgMap.NEXT==0}">
		<script>
			$(function(){$(".next").attr("href", "javascripT:alert('다음 쪽지가 없습니다.')")});
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
			<li id="layer_member_goyard"><a href="#" target="_blank">뜰 바로가기</a></li>
			<li id="layer_member_memberinfo"><a href="#">회원정보</a></li>
			<li id="friend_reg"><a href="#">이웃등록</a></li>
			<li id="bad_friend_reg"><a href="#">불량이웃등록</a></li>
			<li id="layer_member_messagesend"><a href="#">쪽지보내기</a></li>
			<li id="layer_member_report"><a href="#">신고하기</a></li>
		</ul>
	</div>
<script type="text/javascript">
  //  ga not defined 수정 (epkim 16.02.19)
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48261815-1', 'joara.com');
  ga('send', 'pageview');

</script>

<script type="text/javascript">
$(document).ready(function() {
	// 세션 storage 사용 (ie8 이상)
	if (window.sessionStorage) {
		var ss_login_value = sessionStorage.getItem('jw_login_log');
		if (ss_login_value != 'y') {
			// makeLoginLog();
			// 세션 storage 에 기록 남김
			console.log('log: session');
			sessionStorage.setItem('jw_login_log', 'y');
		} // end if
	}
	// 세션 storage 미지원인 경우 cookie 사용
	else {
		var ck_login_value = getCookie('jw_login_log'); // func.js 사용
		if (ck_login_value != 'y') {
			// makeLoginLog();
			// 쿠키에 기록 남김
			console.log('log: cookie');
			setCookie('jw_login_log', 'y'); // func.js 사용
		} // end if
	} // end of (window.sessionStorage)

});
</script>

</body>
</html>