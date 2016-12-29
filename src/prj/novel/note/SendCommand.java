package prj.novel.note;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SendCommand implements INoteCommand {
	private HttpSession session;
	private String loginUser;
	private String viewUrl;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		loginUser = (String)session.getAttribute("loginID");
		
		viewUrl = "/sinnara/main_note/message/send_message.jsp?";
		return viewUrl;
	}

}
