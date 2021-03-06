package prj.novel.note;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReplyCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		viewReceiveMessage(req);
		
		viewUrl = "/sinnara/main_note/message/reply_message.jsp?";
		return viewUrl;
	}
	
	// 받은 쪽지 상세 보기 DAO호출
	private void viewReceiveMessage(HttpServletRequest req) {
		NoteGetDao noteDao = new NoteGetDao();

		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		
		NoteGetDto noteDto = noteDao.getNoteByGetNum(msgNum, "read");
		session.setAttribute("noteDto", noteDto);
	}

}



