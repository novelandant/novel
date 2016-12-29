<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="/sinnara/commons/_header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ������</title>
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
          <h1>�ų��� <small>ȸ������</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method=post action="member_proc.jsp">
            <div class="form-group">
              <label for="username">�̸�</label>
              <input type="text" class="form-control" name="member_name" id="username" placeholder="�̸��� �Է��� �ּ���" required>
            </div>
            <div class="form-group">
              <label for="username">���̵�</label>
              <input type="text" class="form-control" name="member_id" id="userid" placeholder="���̵� �Է��� �ּ���" required>
            </div>
            <div class="form-group">
              <label for="InputEmail">�̸��� �ּ�</label>
              <input type="email" class="form-control" name="member_email" id="InputEmail" placeholder="�̸��� �ּ�" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">��й�ȣ</label>
              <input type="password" class="form-control" name="member_pass" id="InputPassword1" placeholder="��й�ȣ" required>
            </div>
            <div class="form-group">
              <label for="InputPassword2">��й�ȣ Ȯ��</label>
              <input type="password" class="form-control" name="member_passcheck" id="InputPassword2" placeholder="��й�ȣ Ȯ��" required>
              <p class="help-block">��й�ȣ Ȯ���� ���� �ٽ��ѹ� �Է� �� �ּ���</p>
            </div>
            <div class="form-group">
                <label>��� ����</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
               <a href="#" title="�̿� ���" data-toggle="popover" data-trigger="focus" data-content="�ų��� ���Ű��� ȯ���մϴ�. ��̰� �̿����ֽø� �˴ϴ�.">�̿���</a> �� �����մϴ�.
              </div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">ȸ������<i class="fa fa-check spaceLeft"></i></button>
              <button onclick="goBack()" class="btn btn-warning">�������<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </article>
<%@ include file="/sinnara/commons/_footer.jspf" %>
</body>
</html>