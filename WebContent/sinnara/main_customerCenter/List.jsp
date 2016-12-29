<%@page import="prj.novel.notice.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<HTML>
<head>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- IE���� �������� ���� �� ���� �ֽ� �������� ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- �ش� ����̽��� ���缭 �ִ��� ȭ�鿡 �µ��� ����ȭ ������� ��ȯ-->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<title>������ ��������</title>
	<script>
		function check(){
			if(document.search.keyWord.value == ""){
				alert("�˻�� �Է��ϼ���.");
				document.search.keyWord.focus();
				return;
			}
			document.search.submit();
		}
		function fnNoticeRead(num){
			document.noticeRead.notice_num.value = num;
			document.noticeRead.submit();
		}
	</script>
	<style>
		.table-hover>tbody>tr:hover {
			background-color: #dddddd;
		}
	</style>

</head>

<BODY>
<jsp:useBean id="dao" class="prj.novel.notice.BoardDao" />
<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	List list = dao.getBoardList(keyField, keyWord);
	/////////////////////////////////////////////////////
	// Paging ���
	int totalRecord = 0;	//��ü ���� ����
	int numPerPage = 7;		// �� ������ �� ������ ���� ����
	int pagePerBlock = 3;	// �� �� �� ������ ��
	int totalPage = 0;		// ��ü ������ ��
	int totalBlock = 0;		// ��ü �� ��
	int nowPage = 0;		// ���� ������ ��ȣ
	int nowBlock = 0;		// ���� �� ��ȣ
	int beginPerPage = 0;	// ������ �� ���� ��ȣ
	
	totalRecord = list.size();
	totalPage = (int)Math.ceil(((double)totalRecord/numPerPage));
	totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	beginPerPage = nowPage * numPerPage;
%>


<h2 align=left>������ <small>��������</small></h2> <hr/>
<p align=right>������(<%=nowPage+1%>/<%=totalPage%>) </p>

<!-- �������� �Խ��� -->
<div class="row">
	<div class="col-md-12">	
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th width="10%" class="text-center"> No. </th>
				<th width="60%" class="text-center"> ���� </th>
				<th width="20%" class="text-center"> ��¥ </th>
				<th width="10%" class="text-center"> ��ȸ�� </th>
			</tr>
		</thead>

		<tbody>	
			<%
				if(list.size() == 0){
			%>
					<tr><td>��ϵ� ���� �����ϴ�.</td></tr>
			<%	
				}
				else{
					for(int i=beginPerPage; i<beginPerPage+numPerPage; i++){
						if(i == totalRecord)
							break;
						
						BoardDto dto = (BoardDto)list.get(i);
			%>
					<tr align="center">
						<td><%=dto.getNotice_num()%></td>
						<td align="left">
						<%=dao.useDepth(dto.getNotice_depth())%>
						<%
							if(dto.getNotice_depth()>0){
						%>
							<img src="http://imgur.com/a/3Ok7q"/>
						<%
							}
						%>
						<a href="javascript:fnNoticeRead('<%=dto.getNotice_num()%>')"><%=dto.getNotice_subject()%></a></td>
						<td><%=dto.getNotice_regdate() %></td>
						<td><%=dto.getNotice_count() %></td>
					</tr>
			<% 
					}
				}
			%>
		</tbody>
	</table>
	

	</div>
</div>


<div class="col-md-12">
	<!-- ������ �̵� -->
	<div class="col-md-6" align="left">
		<%if(nowBlock > 0){%>
		<a href="List.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">��</a> ...
		<%}%>
		<%
			for(int i=0; i<pagePerBlock; i++){
				if(i+(nowBlock * pagePerBlock) == totalPage)
					break;
		%>
		<a href="List.jsp?nowPage=<%=i+(nowBlock*pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock*pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
		<%
			}
		%>
		<% if(totalBlock > nowBlock+1){ %>
		... <a href="List.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">��</a> 
		<% } %>	
	</div>

	<!-- ��ư �� -->
	<div class="col-md-6 form-inline" align="right">
		<a class="btn btn-default btn-xs" href="Post.jsp" role="button">�۾���</a>
		<a class="btn btn-default btn-xs" href="main_customerCenter.jsp" role="button">���</a>
	</div>
	<br/><hr/>
	
	<!-- �˻� �� -->
	<form class="form-inline" action="List.jsp" name="search" method="post" align="center">
		<div class="form-group">
				
				<select name="keyField" size="1" class="form-control select-sm">
					<option value="notice_subject">����</option>
					<option value="notice_content">����</option>
				</select>
	
				<input type="search" class="form-control input-sm" placeholder="�˻�" name="keyWord">
				<a class="btn btn-default" onClick="check()" role="button">
					 <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
				<input type="hidden" name="page" value= "0">
		 </div>
	</form>
</div>




<!--  �̰� ���� �𸣰ھ� ����? -->
<form name="noticeRead" method="post" action="Read.jsp">
	<input type="hidden" name="notice_num"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
</form>

</BODY>
</HTML>