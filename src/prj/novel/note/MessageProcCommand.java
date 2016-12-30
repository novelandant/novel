package prj.novel.note;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MessageProcCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		MessageProc(req);
		
		viewUrl = "/sinnara/main_note/message/message_proc.jsp?";
		return viewUrl;
	}

	private void MessageProc(HttpServletRequest req) {
		String messsageGubun = req.getParameter("message_gubun");
		String messageMode = req.getParameter("message_mode");
		
		int messageNum = Integer.parseInt(req.getParameter("message_num"));
		
		NoteGetDao noteDao = new NoteGetDao();
		
		if (messageMode.equals("message_del")) {
			noteDao.deleteNote(messageNum, messsageGubun);
		}
		else {
			noteDao.keepMessage(messageNum, messsageGubun);
		}
	}
}
