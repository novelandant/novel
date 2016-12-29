<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			<div id="left_cont">
			<!-- �������� ���� -->
				<div class="my_menu mb10">
					<div class="inBox clearfix">
						<div class="profile_area">
							<div class="user">
								<p class="photo">
									<img src="http://cf.joara.com/user_file/default_01.png"	width="53" height="53">
									<a href="#" class="edit">
									<img src="../images/mypage/btn_edit.gif" alt="edit"></a>
								</p>
								<p class="nickname">
									<strong>�Ȱ����� </strong>��
								</p>
								<p class="setting">
									<a href="#">
										<img src="../images/mypage/btn_logout.gif" alt="�α׾ƿ�">
									</a>
								</p>
							</div>
							<div class="user_info">
								<ul>
									<li>���� : <span class="info"><a href="#">0</a>��</span></li>
									<li>���� : <span class="info"><a href="#">1,100</a>M</span></li>
								</ul>
							</div>
							<div class="user_info date">
								<p class="none">
									�̿���̾����ϴ�. 
									<a href="#"	class="btn_buy">
										<img src="../images/mypage/btn_buy.gif" alt="����">
									</a>
								</p>
							</div>
							<div class="user_info style">
								<ul class="style">
									<li><span class="tit">��<span style="margin-left:11px;">Ʈ</span><img src="../images/mypage/ico_heart.gif" alt="��Ʈ"></span>:<span class="info">0 ��</span></li>
									<li><span class="tit">�α⵵ <img src="../images/mypage/ico_star.gif" alt="�α⵵" class="img"></span>:<span class="info">519 ��</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			
				<!-- �޴� ���� -->
				<div class="lnb mb0">
					<h2>
						<img src="../images/message/t_lnb_message.gif" alt="����">
					</h2>
					<ul id="message_menu">
						<li><a href="receive_message_list.jsp?page=receive" class='current'>���� ������</a></li>
						<li><a href="send_message_list.jsp?page=send">���� ������</a></li>
						<li><a href="receive_message_list.jsp?page=r_store">���� ���� ������</a></li>
						<li><a href="send_message_list.jsp?page=s_store">���� ���� ������</a></li>
					</ul>
				</div>
				
				<script>
					$(function() {
						$("#message_menu li").find("a").removeClass("current");
					})
				</script>
				
				<c:choose>
					<c:when test="${page_gubun=='send'}">
						<script>
							$(function(){
								$("#message_menu li:eq(1) a").addClass("current");
							})
						</script>
					</c:when>
					<c:when test="${page_gubun=='r_store'}">
						<script>
							$(function(){
								$("#message_menu li:eq(2) a").addClass("current");
							})
						</script>
					</c:when>
					<c:when test="${page_gubun=='s_store'}">
						<script>
							$(function(){
								$("#message_menu li:eq(3) a").addClass("current");
							})
						</script>
					</c:when>
					<c:otherwise>
						<script>
							$(function(){
								$("#message_menu li:eq(0) a").addClass("current");
							})
						</script>
					</c:otherwise>
				</c:choose>
				
				
				<!-- ��� ���� -->
				<div class="my_menu">
					<div class="inBox clearfix">
						<a href="#" class="btn">
							<img src="../images/common/btn_mymenu1.gif" alt="���Ƕ� �ٷΰ���">
						</a>
						<a href="#" class="btn">
							<img src="../images/common/btn_mymenu2.gif" alt="��ǰ��� �ٷΰ���">
						</a>

						<script>
							function goQuickMenu(form, url) {
								if (url != "")
									self.location = url;
							}
						</script>

						<div class="select open" id="my_menu" style="width: 114px;">
							<form name="quickForm">
								<select id="" class="select" style="width: 95px;" onchange="goQuickMenu(this.form, this.value);">
									<option value="">���� �޴�</option>
								</select>
							</form>
						</div>
						<a href="#" class="set">����</a>
					</div>
				</div>
				
				<div class="pL_L">
					<!-- ���� �ϴ� ��� ���� -->
				</div>
			</div>
			<!-- left_cont -->