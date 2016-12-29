<%@page import="prj.novel.piece.Master_piece_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="masdao" class="prj.novel.piece.Master_piece_DAO" />
<jsp:useBean id="masdto" class="prj.novel.piece.Master_piece_DTO" />
<jsp:useBean id="serdao" class="prj.novel.piece.Piece_serially_DAO" />
<jsp:useBean id="serdto" class="prj.novel.piece.Piece_serially_DTO" />
<jsp:setProperty property="*" name="masdto" />
<jsp:setProperty property="*" name="serdto" />
<%
	String action = request.getParameter("action");
	String num = request.getParameter("b_num");

	if (action.equals("maslist")) {
		ArrayList<Master_piece_DTO> datas = masdao.getDBList("","");
		request.setAttribute("datas", datas);
		pageContext.forward("piece_piecePersonal.jsp");

	} else if (action.equals("masinsert")) {
		if (masdao.insertDB(masdto)) {
			response.sendRedirect("piece_pieceControl.jsp?action=maslist");
		} else {
			throw new Exception("DB 입력 오류");
		}

	} else if (action.equals("maslimit")) {
		Master_piece_DTO editdto = masdao.getDB(masdto.getMaster_piecenum(),"0");
		//if(){// 수정페이지 요청 세션을 이용해 아이디 비교
		//}else{}
		request.setAttribute("masdao", editdto);
		pageContext.forward("piece_piecePersonalEdit.jsp");

	} else if (action.equals("masedit")) {
		if(masdao.updateDB(masdto)) {
			response.sendRedirect("piece_pieceControl.jsp?action=maslist");
		}else{
			throw new Exception("DB 수정 오류");
		}
	}
	else if (action.equals("masdelete")) {
		if (masdao.deleteDB(masdto.getMaster_piecenum())) {
			response.sendRedirect("piece_pieceControl.jsp?action=maslist");
		} else {
			throw new Exception("DB 삭제 오류");
		}

	} else if (action.equals("serlist")) {
		ArrayList<Master_piece_DTO> datas = masdao.getDBList("","");
		request.setAttribute("datas", datas);
		pageContext.forward("piece_piecePersonal.jsp");

	} else if (action.equals("serinsert")) {
		if (serdao.insertDB(serdto)) {
			response.sendRedirect("piece_pieceControl.jsp?action=maslist");
		} else {
			throw new Exception("DB 등록 오류");
		}

	} else if (action.equals("serlimit")) {
		if (masdao.updateDB(masdto)) {
			response.sendRedirect("piece_pieceControl.jsp?action=maslist");
		} else {
			throw new Exception("DB 갱신 오류");
		}

	} else if (action.equals("serdelete")) {
		if (masdao.deleteDB(masdto.getMaster_piecenum())) {
			response.sendRedirect("piece_pieceControl.jsp?action=maslist");
		} else {
			throw new Exception("DB 삭제 오류");
		}
		
	} else if (action.equals("serread")) {
		//if()
	}

	else {
		out.println("<script>alert('action 파라미터 재확인 요망')</script>");
	}
%>