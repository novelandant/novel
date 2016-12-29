package prj.novel.note;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SendListCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		getSendList(req);
		
		viewUrl = "/sinnara/main_note/message/send_message_list.jsp?page=send";
		return viewUrl;
	}
	
	// 보낸 쪽지함 리스트를 불러오는 Dao호출
	private void getSendList(HttpServletRequest req) {
		NoteSendDao noteDao = new NoteSendDao();
		ArrayList noteList = null;

		String pageGubun = req.getParameter("page");
		if (pageGubun==null || pageGubun=="") {pageGubun="SEND";}
		
		noteList = noteDao.getNoteSendList(pageGubun, loginUser);
		session.setAttribute("noteList", noteList);
	}
}
