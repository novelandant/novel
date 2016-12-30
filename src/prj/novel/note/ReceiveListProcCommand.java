package prj.novel.note;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReceiveListProcCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		receiveMessageProc(req);
		
		viewUrl = "/sinnara/main_note/message/receive_message_list_proc.jsp?";
		return viewUrl;
	}

	private void receiveMessageProc(HttpServletRequest req) {
		String[] messageNums = req.getParameterValues("message_idx");
		String messsageGubun = req.getParameter("message_gubun");
		String messageMode = req.getParameter("message_mode");
		
		NoteGetDao noteDao = new NoteGetDao();
		
		for (int i=0; i<messageNums.length; i++) {
			int messageNum = Integer.parseInt(messageNums[i]);
			
			if (messageMode.equals("message_del")) {
				noteDao.deleteNote(messageNum, messsageGubun);
			}
			else if (messageMode.equals("message_store")) {
				noteDao.keepMessage(messageNum, messsageGubun);
			}
		}
	}
}
