package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import entities.User;
import utils.EnCryptUtil;



@WebServlet({"/login","/logout"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;    
   
    public LoginServlet() {
        super();
        this.userDAO =new UserDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("login")) {
			this.index(request, response);
		} else if (uri.contains("logout")) {
			this.logout(request, response);
		}
	}
	protected void index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"),
				pwd = request.getParameter("password");

			User u = this.userDAO.findByEmail(email);
			boolean check = EnCryptUtil.check(pwd, u.getPassword());
			HttpSession session = request.getSession();
			
			if (check == true) {
				// Đăng nhập thành công
				System.out.println("Đăng nhập thành công");
				session.setAttribute("user", u);
				if (u.getRole()==1) {
					response.sendRedirect("/Assignment_Java4/admin/users/index");
				} else {
					response.sendRedirect("/Assignment_Java4/user/sell/index");
					
				}
					
			} else {
				System.out.println("Đăng nhập thất bại");
				// Đăng nhập thất bại
			}
	}
	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.sendRedirect("/Assignment_Java4/login");
	}
	

}
