<%@ page import="java.util.ArrayList"%>
<%@ page import="prj.novel.note.NoteGetDao"%>
<%@ page import="prj.novel.note.NoteSendDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<title>�ų��� : ��ȭ�� ���� - </title>
	
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
						var msg="���� �����Ͻðڽ��ϱ�?";
					}else{
						var msg="���������� �̵� �Ͻðڽ��ϱ�?";
					}
	
					if(confirm(msg) ) {
						$("#message_mode").val(mode);
						$("#messageListForm").submit();
					} else {
						return false;
					}
				} else {
					alert("���õ� ������ �����ϴ�.");
					
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
						alert('������ 1:1�� �����մϴ�. �ϳ��� ������ ������ �ּ���');
						return false;
					}else{
						var rev_id=$('input:checkbox[name="message_idx"]:checked').attr('rev_id');
						location.href="reply_message.jsp?page="+$("#page").val()+"&rev_id="+rev_id;
					}
				} else {
					alert("���õ� ������ �����ϴ�.");
					return false;
				}
			});

		});
	</script>
</head>

<body id="body_m" class="" >
	<c:set var="loginID" value="testid1" scope="session" />
	<c:set var="page_gubun" value="${param.page}" scope="session"/>

	<div id="wrap">
		<%@ include file="../inc/message_header.jsp"%>
		
		<div id="container" class="clearfix">
			<%@ include file="../inc/message_left.jsp"%>

			<div id="content">
				<div class="title">
					<h3>
						<img id="send_img" src="../images/message/t_send_message.gif" alt="���� ������">
					</h3>
					<div class="path">Ȩ &gt; ���� &gt; 
						<select class="fe_select" onchange="location.href=this.value">
							<option value="receive_message_list.jsp?page=receive" selected>���� ������</option>
							<option value="send_message_list.jsp?page=send">���� ������</option>
							<option value="receive_message_list.jsp?page=r_store">���� ���� ������</option>
							<option value="send_message_list.jsp?page=s_store">���� ���� ������</option>
							<option value="send_message.jsp">���� ������</option>
						</select>
					</div>
				</div>

				<c:choose>
					<c:when test="${page_gubun=='send'}">
						<script>
							$(function(){
								$("#send_img").attr("src", "../images/message/t_send_message.gif");
								$(".fe_select option:eq(1)").attr("selected", "selected");
							})
						</script>
					</c:when>
					<c:when test="${page_gubun=='r_store'}">
						<script>
							$(function(){
								$("#send_img").attr("src", "../images/message/t_message_box.gif");
								$(".fe_select option:eq(2)").attr("selected", "selected");
							})
						</script>
					</c:when>
					<c:when test="${page_gubun=='s_store'}">
						<script>
							$(function(){
								$("#send_img").attr("src", "../images/message/t_message_box.gif");
								$(".fe_select option:eq(3)").attr("selected", "selected");
							})
						</script>
					</c:when>
				</c:choose>

				<jsp:useBean id="dao" class="prj.novel.note.NoteSendDao" />
		
				<%
					String pGubun = (String)session.getAttribute("page_gubun");
					String loginUser = (String)session.getAttribute("loginID");
					
					ArrayList noteList = null;
					
					if (pGubun==null || pGubun=="") {pGubun="send";}
					
					noteList = dao.getNoteSendList(pGubun, loginUser);
					pageContext.setAttribute("noteList", noteList);
				%>
	
				<form id="messageListForm" method="post" action="receive_message_list_proc.jsp">
					<input type="hidden" id="message_type" name="message_type" value="SEND">
					<input type="hidden" id="message_gubun" name="message_gubun" value="SEND">
					<input type="hidden" id="message_mode" name="message_mode">
					<input type="hidden" id="page" name="page" value="send">

					<section class="message_box_area mypage_area">
						<div class="sub_info_area">
							<div class="in_box">
								<ul class="list">
									<li class="last"><strong>��ü ���� : <span>${noteList.size()}</span></strong> ��</li>
								</ul>
							</div>
						</div>

						<div class="tbl_sub_bar">
							<a href="#" id="btn_motion" class="btn_delete" mode="message_del"><span>����</span></a>
							<a href="#" id="btn_motion" class="btn_message"	mode="message_store"><span>����</span></a> 
							<a href="send_message.jsp" class="btn_r btn_message"><span>����	����</span></a>
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
									<th>�޴� ���</th>
									<th>����</th>
									<th>��¥</th>
									<th>���� ���� </th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noteList}" var="sendNote">
								<tr>
									<td class="cen"><input type="checkbox"
										name="message_idx" id="message_idx" value="${sendNote.getNote2_sendnum()}"
										rev_id="${sendNote.getNote2_receiveid()}"></td>
									<td class="cen">${sendNote.getNote2_receiveid()}</td>
									<td class="left"><a	href="view_send_message.jsp?msgNum=${sendNote.getNote2_sendnum()}">${sendNote.getNote2_subject()}</a></td>
									<td class="cen">${sendNote.getNote2_regdate()}</td>
									<td class="cen">${sendNote.getNote2_getidentify()}</td></td>
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