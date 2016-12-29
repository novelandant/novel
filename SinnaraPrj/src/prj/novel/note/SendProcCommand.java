package prj.novel.note;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SendProcCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		writeMessage(req);
		
		viewUrl = "/sinnara/main_note/message/send_message_proc.jsp?";
		return viewUrl;
	}

	// 쪽지보내기 DAO호출
	private void writeMessage(HttpServletRequest req) {
		NoteGetDao noteDao = new NoteGetDao();
		NoteGetDto noteDto = new NoteGetDto();

		noteDto.setNote_subject(req.getParameter("note_subject"));
		noteDto.setNote_content(req.getParameter("note_content"));
		noteDto.setNote_sendid(req.getParameter("note_sendid"));
		noteDto.setNote_receiveid(req.getParameter("note_receiveid"));
		noteDto.setNote_keepyn(req.getParameter("note_keepyn"));
		
		noteDao.writeMessage(noteDto);
	}
}
