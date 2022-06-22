package controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.CategoryDAO;
import entities.Category;
import entities.User;






@WebServlet({ "/admin/category/index", "/admin/category/create", "/admin/category/store", "/admin/category/delete","/admin/category/edit",
	"/admin/category/update",
})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDAO CateDAO;
    public CategoryServlet() {
        super();
        CateDAO =new CategoryDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			 this.index(request, response);
		} else if (uri.contains("create")) {
			 this.create(request, response);
		} else if (uri.contains("edit")) {
			 this.edit(request, response);
		
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
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		Category entity = this.CateDAO.findMyId(id);
		try {
			this.CateDAO.delete(entity);
			// TODO: Thông báo thành công
		} catch (Exception e) {
			// TODO: Thông báo lỗi
			e.printStackTrace();
		}
//		List<User> listUser = this.daoUser.all();
//		request.setAttribute("ListTen", listUser);

		response.sendRedirect("/Assignment_Java4"
				+ "/admin/category/index");

	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("view",
				"/views/admin/category/create.jsp");
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
			.forward(request, response);
		
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> listCate = this.CateDAO.getAll();
		System.out.println(listCate);
		request.setAttribute("listCate", listCate);
		request.setAttribute("view",
			"/views/admin/category/index.jsp");
		
		request.getRequestDispatcher("/views/layoutAdmin.jsp")
			.forward(request, response);
	}


	private void store(HttpServletRequest request, HttpServletResponse response) {
		String tenDM =request.getParameter("tenDM");
		HttpSession session = request.getSession();
		try {
			Category entity = new Category();
			
			
			System.out.println(tenDM+"tendm");
			entity.setTen(tenDM);
			User u = (User)session.getAttribute("user");
			entity.setUser(u);
			this.CateDAO.create(entity);
			
			session.setAttribute("message",
					"Thêm mới thành công");
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/category/index");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}
	private void edit(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
		HttpSession session = request.getSession();
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			Category entity = CateDAO.findById(id);
			session.setAttribute("cate", entity);
			request.setAttribute("view",
				"/views/admin/category/edit.jsp");
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
			.forward(request, response);
		}
	private void update(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
		HttpSession session = request.getSession();
			try {
				Category entity = (Category)session.getAttribute("cate");
				//BeanUtils.populate(entity, request.getParameterMap());
				User u =(User)session.getAttribute("user");
				
				entity.setUser(u);
				
				entity.setTen(request.getParameter("ten"));
				//entity.setTen(cate.getTen());
				//entity.setId(cate.getId());
				this.CateDAO.update(entity);
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/category/index");
			} catch (Exception e) {
				e.printStackTrace();

				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/category/index");
			}
		}
}
