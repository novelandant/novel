package prj.novel.note;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReceiveListCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		/*
		if (loginUser==null || loginUser=="") {
			return "/SinnaraPrj/sinnara/index.jsp";
		}
		*/
		getMessageList(req);
		
		viewUrl = "/sinnara/main_note/message/receive_message_list.jsp?page=receive";
		return viewUrl;
	}
	
	// ���� ������ ����Ʈ�� �ҷ����� Daoȣ��
	private void getMessageList(HttpServletRequest req ) {
		NoteGetDao noteDao = new NoteGetDao();
		ArrayList noteList = null;

		String page = req.getParameter("page");
		
		noteList = noteDao.getNoteList(page, loginUser);
		session.setAttribute("ReceiveNoteList", noteList);
	}

}
