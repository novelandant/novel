<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			<div id="left_cont">
			<!-- 개인정보 영역 -->
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
									<strong>팔강공주 </strong>님
								</p>
								<p class="setting">
									<a href="#">
										<img src="../images/mypage/btn_logout.gif" alt="로그아웃">
									</a>
								</p>
							</div>
							<div class="user_info">
								<ul>
									<li>쪽지 : <span class="info"><a href="#">0</a>개</span></li>
									<li>마나 : <span class="info"><a href="#">1,100</a>M</span></li>
								</ul>
							</div>
							<div class="user_info date">
								<p class="none">
									이용권이없습니다. 
									<a href="#"	class="btn_buy">
										<img src="../images/mypage/btn_buy.gif" alt="구매">
									</a>
								</p>
							</div>
							<div class="user_info style">
								<ul class="style">
									<li><span class="tit">하<span style="margin-left:11px;">트</span><img src="../images/mypage/ico_heart.gif" alt="하트"></span>:<span class="info">0 점</span></li>
									<li><span class="tit">인기도 <img src="../images/mypage/ico_star.gif" alt="인기도" class="img"></span>:<span class="info">519 점</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			
				<!-- 메뉴 영역 -->
				<div class="lnb mb0">
					<h2>
						<img src="../images/message/t_lnb_message.gif" alt="쪽지">
					</h2>
					<ul id="message_menu">
						<li><a href="receive_message_list.jsp?page=receive" class='current'>받은 쪽지함</a></li>
						<li><a href="send_message_list.jsp?page=send">보낸 쪽지함</a></li>
						<li><a href="receive_message_list.jsp?page=r_store">받은 쪽지 보관함</a></li>
						<li><a href="send_message_list.jsp?page=s_store">보낸 쪽지 보관함</a></li>
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
				
				
				<!-- 배너 영역 -->
				<div class="my_menu">
					<div class="inBox clearfix">
						<a href="#" class="btn">
							<img src="../images/common/btn_mymenu1.gif" alt="나의뜰 바로가기">
						</a>
						<a href="#" class="btn">
							<img src="../images/common/btn_mymenu2.gif" alt="작품등록 바로가기">
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
									<option value="">나의 메뉴</option>
								</select>
							</form>
						</div>
						<a href="#" class="set">관리</a>
					</div>
				</div>
				
				<div class="pL_L">
					<!-- 왼쪽 하단 배너 영역 -->
				</div>
			</div>
			<!-- left_cont -->