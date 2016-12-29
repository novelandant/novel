<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>신나라 로그인</title>
<link rel="stylesheet" href="/SinnaraPrj/sinnara/assets/css/bootstrap.min.css" />
<script src="/SinnaraPrj/sinnara/assets/js/jquery-3.1.1.min.js"></script>
<script src="/SinnaraPrj/sinnara/assets/js/bootstrap.min.js"></script>
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }

</style>
</head>
<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">신나라 로그인</div>
            </div>
            <div class="panel-body">
                <form id="login-form" method=post action="login_proc.jsp">
                    <div>
                        <input type="text" class="form-control" name="member_id" placeholder="아이디를 입력하세요" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="member_pass" placeholder="비밀번호를 입력하세요">
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
                <form action="/SinnaraPrj/sinnara/main_registMember/member.jsp">
                   <button type="submit" class="form-control btn btn-info">회원가입</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>