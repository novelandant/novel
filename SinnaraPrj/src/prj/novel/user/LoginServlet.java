package prj.novel.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		// User user = Database.findByUserId(id);
		// User user = Database.findByUserEmail(email);
		
		
		/*
		try {
			User.loginEmail(email, pass);
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("/SinnaraPrj/sinnara/index.jsp");
		} catch (UserNotFoundException e) { // 사용자가 없을 때	
			request.setAttribute("errorMessage", "존재하지 않는 사용자입니다.");
			
			RequestDispatcher rd = request.getRequestDispatcher("/SinnaraPrj/sinnara/index.jsp");
			rd.forward(request, response);
		} catch (PasswordMismatchException e) { // 비밀번호 틀릴 때
			request.setAttribute("errorMessage", "비밀번호가 틀립니다.");
			
			RequestDispatcher rd = request.getRequestDispatcher("/SinnaraPrj/sinnara/index.jsp");
			rd.forward(request, response);
		}
		*/
		
			
		response.sendRedirect("/SinnaraPrj/sinnara/index.jsp");


	}


}
