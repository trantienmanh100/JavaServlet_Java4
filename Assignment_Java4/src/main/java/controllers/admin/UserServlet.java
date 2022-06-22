package controllers.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.UserDAO;
import entities.User;
import utils.EnCryptUtil;

@MultipartConfig
@WebServlet({
	"/admin/users/index",
	"/admin/users/create",
	"/admin/users/store",
	"/admin/users/edit",
	"/admin/users/update",
	"/admin/users/delete",
	"/admin/users/show",
})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;  
    
    public UserServlet() {
        super();
        this.userDAO = new UserDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			 this.index(request, response);
		} else if (uri.contains("create")) {
			 this.create(request, response);
		} else if (uri.contains("edit")) {
			 this.edit(request, response);
		} else if (uri.contains("show")) {
			 this.show(request, response);
		} else if (uri.contains("delete")) {
			 this.delete(request, response);
		} else {
			// redirect 404
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		if (uri.contains("store")) {
			 this.store(request, response);
		} else if (uri.contains("update")) {
			 this.update(request, response);
		} else {
			
		}
	}
	private void index(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			List<User> ds = this.userDAO.getAll();		
			request.setAttribute("list", ds);
			request.setAttribute("view",
				"/views/admin/users/indexUser.jsp");
			
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
				.forward(request, response);
		}

		private void create(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			request.setAttribute("view",
				"/views/admin/users/create.jsp");
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
			.forward(request, response);
		}

		private void edit(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			User entity = this.userDAO.findById(id);
			request.setAttribute("user", entity);
			request.setAttribute("view",
				"/views/admin/users/edit.jsp");
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
			.forward(request, response);
		}

		private void show(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
		}

		private void delete(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			 HttpSession session = request.getSession(); 
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			User entity = this.userDAO.findById(id);
			try {
				this.userDAO.delete(entity);
				session.setAttribute("message", "Xóa thành công");
				// TODO: Thông báo thành công
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("error", "Xóa thất bại");
			}

			response.sendRedirect("/Assignment_Java4"
				+ "/admin/users/index");
		}

		private void store(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			HttpSession session = request.getSession();
			try {
				User entity = new User();
				BeanUtils.populate(entity, request.getParameterMap());
				String encrypted = EnCryptUtil.encrypt(
					request.getParameter("password")
				);
				
				entity.setPassword(encrypted);
				
				File dir= new File(request.getServletContext().getRealPath("/files"));
	            if (!dir.exists()) {
	                dir.mkdirs();
	            } 
	            Part photoPart= request.getPart("avatar");
	            String namePtString=photoPart.getSubmittedFileName();
	            entity.setAvatar(namePtString);
	            File photoFile = new File(dir,photoPart.getSubmittedFileName());
	            System.out.println(dir);
	            photoPart.write(photoFile.getAbsolutePath());
	            
	            
				this.userDAO.create(entity);
				session.setAttribute("message",
					"Thêm mới thành công");
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/users/index");
			} catch (Exception e) {
				e.printStackTrace();

				session.setAttribute("error",
					"Thêm mới thất bại");
				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/users/create");
			}
		}

		private void update(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			try {
				User entity = new User();
			
				BeanUtils.populate(entity, request.getParameterMap());
				String encrypted = EnCryptUtil.encrypt(
					request.getParameter("password")
				);
				
				entity.setPassword(encrypted);
				
				File dir= new File(request.getServletContext().getRealPath("/files"));
	            if (!dir.exists()) {
	                dir.mkdirs();
	            } 
	            Part photoPart= request.getPart("avatar");
	            String namePtString=photoPart.getSubmittedFileName();
	            entity.setAvatar(namePtString);
	            File photoFile = new File(dir,photoPart.getSubmittedFileName());
	            photoPart.write(photoFile.getAbsolutePath());

				this.userDAO.update(entity);
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/users/index");
			} catch (Exception e) {
				e.printStackTrace();

				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/users/create");
			}
		}

}
