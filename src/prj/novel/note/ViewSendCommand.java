package prj.novel.note;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewSendCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		viewSendMessage(req);
		viewUrl = "/sinnara/main_note/message/view_send_message.jsp?";
		return viewUrl;
	}

	//보낸 쪽지 상세 보기 DAO호출
	private void viewSendMessage(HttpServletRequest req) {
		NoteSendDao noteDao = new NoteSendDao();
		NoteGetDao GDao = new NoteGetDao();
		ArrayList noteList = null;

		String pageGubun = req.getParameter("page");
		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		
		NoteSendDto noteDto = noteDao.getNoteSendBySendNum(msgNum, "read");
		session.setAttribute("noteDto", noteDto);

		HashMap msgMap = new HashMap();
		msgMap = GDao.getPrevNextNum(loginUser, pageGubun, msgNum);
		
		session.setAttribute("msgMap", msgMap);
	}
}
