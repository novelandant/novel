<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" href="/SinnaraPrj/sinnara/assets/css/bootstrap.min.css" />
<script src="/SinnaraPrj/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/SinnaraPrj/sinnara/assets/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover();   
	});
	
	function goBack() {
	    window.history.back();
	}
</script>
</head>
<body>
      <article class="container">
        <div class="page-header">
          <h1>신나라 <small>회원가입</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method=post action="member_proc.jsp">
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" name="member_name" id="username" placeholder="이름을 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label for="username">아이디</label>
              <input type="text" class="form-control" name="member_id" id="userid" placeholder="아이디를 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label for="InputEmail">이메일 주소</label>
              <input type="email" class="form-control" name="member_email" id="InputEmail" placeholder="이메일 주소" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" name="member_pass" id="InputPassword1" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" name="member_passcheck" id="InputPassword2" placeholder="비밀번호 확인" required>
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
               <a href="#" title="이용 약관" data-toggle="popover" data-trigger="focus" data-content="신나라에 오신것을 환영합니다. 즐겁게 이용해주시면 됩니다.">이용약관</a> 에 동의합니다.
              </div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button onclick="goBack()" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </article>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>