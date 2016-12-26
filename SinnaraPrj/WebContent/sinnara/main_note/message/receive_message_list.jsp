<%@ page import="java.util.ArrayList"%>
<%@ page import="prj.novel.note.NoteGetDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<title>신나라 : 문화의 시작 - </title>
	
	<link rel="stylesheet" type="text/css" href="../joara_css/base.css" media="all">
	<link rel="stylesheet" type="text/css" href="../joara_css/content.css" media="all">
	<link rel="stylesheet" type="text/css" href="../joara_css/nyroModal.css"  media="screen" />
	<link rel="stylesheet" type="text/css" href="../message_css/sinara_message.css" media="all">
							
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script	src="https://s3-ap-northeast-1.amazonaws.com/joara-cdn/js/user_func151027-1.min.js"></script>
	<script type="text/javascript" src="https://s3-ap-northeast-1.amazonaws.com/joara-cdn/js/jq.nyroModal.custom.js"></script>
	
	<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
	
	<script type="text/javascript">
		$(function() {
			$(".nyroModal").nyroModal();
		});
	</script>
	
	<script>
		$(function() {
			$("a[id=btn_motion]").click(function(){
				if ( $('input:checkbox[name="message_idx"]:checked').length > 0 ) {
					var mode=$(this).attr("mode");
	
					if(mode=='message_del'){
						var msg="정말 삭제하시겠습니까?";
					}else{
						var msg="보관함으로 이동 하시겠습니까?";
					}
	
					if(confirm(msg) ) {
						$("#message_mode").val(mode);
						$("#messageListForm").submit();
					} else {
						return false;
					}
				} else {
					alert("선택된 쪽지가 없습니다.");
					
					return false;
				}
			});
		
			$("#check_all_message").click(function(){
		    	if ($("#check_all_message").is(":checked")) { 
					$("input[name='message_idx']:checkbox").each(function() {
						$(this).attr("checked", true);
					});
				} 
		    	else { 
					$("input[name='message_idx']:checkbox").each(function() {
						$(this).attr("checked", false);
					});
				} 
		    });
			
			$("a[id=btn_reply]").click(function(){
				var chk=$('input:checkbox[name="message_idx"]:checked').length;
				if ( chk > 0 ){
					if ( chk > 1 ){ 
						alert('답장은 1:1로 가능합니다. 하나의 쪽지만 선택해 주세요');
						return false;
					}else{
						var rev_id=$('input:checkbox[name="message_idx"]:checked').attr('rev_id');
						location.href="reply_message.jsp?page="+$("#page").val()+"&rev_id="+rev_id;
					}
				} else {
					alert("선택된 쪽지가 없습니다.");
					return false;
				}
			});
		});
		
		// parameter parsing
		function getQuerystring(paramName){
			var _tempUrl = window.location.search.substring(1);
			var _tempArray = _tempUrl.split('&');
			
			for(var i = 0; _tempArray.length; i++) {
				var _keyValuePair = _tempArray[i].split('=');
				
				if(_keyValuePair[0] == paramName){ 
					return _keyValuePair[1];
				}
			}
		}
	</script>
</head>

<body id="body_m" class="" >
	<c:set var="loginID" value="testid1" scope="session" />
	<c:set var="page_gubun" value="${param.page}" scope="session"/>

	<jsp:include page="/sinnara/commons/_header.jspf"></jsp:include>
	<div id="wrap">
		<div id="container" class="clearfix">
			<%@ include file="../inc/message_left.jsp"%>

			<div id="content">
				<div class="title">
					<h3>
						<img id="receive_img" src="../images/message/t_inbox.gif" alt="받은 쪽지함">
					</h3>
					<div class="path">홈 &gt; 쪽지 &gt; 
						<select class="fe_select" onchange="location.href=this.value">
							<option value="receive_message_list.jsp?page=receive" selected>받은 쪽지함</option>
							<option value="send_message_list.jsp?page=send">보낸 쪽지함</option>
							<option value="receive_message_list.jsp?page=r_store">받은 쪽지 보관함</option>
							<option value="send_message_list.jsp?page=s_store">보낸 쪽지 보관함</option>
							<option value="send_message.jsp">쪽지 보내기</option>
						</select>
					</div>
				</div>

				<c:choose>
					<c:when test="${page_gubun=='send'}">
						<script>
							$(function(){
								$("#receive_img").attr("src", "../images/message/t_send_message.gif");
								$(".fe_select option:eq(1)").attr("selected", "selected");
							})
						</script>
					</c:when>
					<c:when test="${page_gubun=='r_store'}">
						<script>
							$(function(){
								$("#receive_img").attr("src", "../images/message/t_message_box.gif");
								$(".fe_select option:eq(2)").attr("selected", "selected");
							})
						</script>
					</c:when>
					<c:when test="${page_gubun=='s_store'}">
						<script>
							$(function(){
								$("#receive_img").attr("src", "../images/message/t_message_box.gif");
								$(".fe_select option:eq(3)").attr("selected", "selected");
							})
						</script>
					</c:when>
				</c:choose>

				<jsp:useBean id="dao" class="prj.novel.note.NoteGetDao" />
		
				<%
					String pGubun = (String)session.getAttribute("page_gubun");
					String loginUser = (String)session.getAttribute("loginID");
					
					ArrayList noteList = null;
					
					if (pGubun==null || pGubun=="") {pGubun="receive";}
					
					noteList = dao.getNoteList(pGubun, loginUser);
					pageContext.setAttribute("noteList", noteList);
				%>
	
				<form id="messageListForm" method="post" action="receive_message_list_proc.jsp">
					<input type="hidden" id="message_type" name="message_type" value="RECEIVED">
					<input type="hidden" id="message_gubun" name="message_gubun" value="RECEIVED">
					<input type="hidden" id="message_mode" name="message_mode">
					<input type="hidden" id="page" name="page" value="receive">

					<section class="message_box_area mypage_area">
						<div class="sub_info_area">
							<div class="in_box">
								<ul class="list">
									<li id="unreadLabel"><strong>읽지 않은 쪽지 : <span id="unreadNote">0</span></strong> 개</li>
									<li class="last"><strong>전체 쪽지 : <span>${noteList.size()}</span></strong> 개</li>
								</ul>
							</div>
						</div>

						<script>
							// 읽지 않은 쪽지의 갯수를 ajax로 받아오기
							$(function() {
								$.get("unread_message.jsp",  
									function(data){
										$("#unreadNote").text(data);
								});
							});
							
							// 쪽지 보관함에서는 '읽지 않은 쪽지' 가 보이지 않게 함
							if (getQuerystring("page")=="r_store")
								$("#unreadLabel").remove();
						</script>
						
						<div class="tbl_sub_bar">
							<a href="#" id="btn_motion" class="btn_delete" mode="message_del"><span>삭제</span></a>
							<a href="#" id="btn_motion" class="btn_message"	mode="message_store"><span>보관</span></a> 
							<a href="#"	id="btn_reply" class="btn_message"><span>답장</span></a> 
							<a href="receive_message_list.jsp?page=unread&view=not" class="no_read">읽지 않은 쪽지</a>
							<a href="send_message.jsp" class="btn_r btn_message"><span>쪽지	쓰기</span></a>
						</div>

						<table class="table_stats mb30">
							<colgroup>
								<col style="width: 34px;">
								<col style="width: 162px;">
								<col style="width: auto;">
								<col style="width: 126px;">
								<col style="width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="check_all_message" name="check_all_message"></th>
									<th>보낸 사람</th>
									<th>내용</th>
									<th>날짜</th>
									<th>차단 <span class="line">|</span> 신고 </th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noteList}" var="receiveNote">
									<tr> 
										<td class="cen"><input type="checkbox"
											name="message_idx" id="message_idx" value="${receiveNote.getNote_getnum()}"
											rev_id="${receiveNote.getNote_sendid()}"></td>
										<td class="cen">${receiveNote.getNote_sendid()}</td>
										<td class="left"><a	href="view_message.jsp?msgNum=${receiveNote.getNote_getnum()}">${receiveNote.getNote_subject()}</a></td>
										<td class="cen">${receiveNote.getNote_regdate()}</td>
										<td class="cen"><a href="pop_report.html?msgNum=4081901&friend_id=brianpark928&page="
											class="nyroModal">차단 <span class="line">|</span> 신고 </a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- pagination -->
						<div class="pagination">
							<a href="javascript:;" class="current">1</a>
						</div>
					</section>
				</form>
			</div>
		</div>
		<!-- container -->	

		<%@ include file="../inc/message_right.jsp"%>
	</div>

<!-- wrap end -->
<!-- footer -->
	
</body>
</html>