package prj.novel.note;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/message")
public class NoteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		
		String cmd = req.getParameter("cmd");
		String url = "";
		
		resp.setCharacterEncoding("euc-kr");

		NoteFactoryCommand Nfactory = NoteFactoryCommand.newInstance();
		INoteCommand iNoteCmd = Nfactory.createCommand(cmd);
		
		url = (String)iNoteCmd.processCommand(req, resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}
	
}
