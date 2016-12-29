package prj.novel.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prj.novel.logininput.Database;



	public class SaveUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		

		User user = new User(id, pass, nickname, email);
		Database.addUser(user);
		
		response.sendRedirect("/");
	
	
	
	
	
	}
}
