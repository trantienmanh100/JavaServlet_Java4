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

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entities.Category;
import entities.Product;
import entities.User;


@MultipartConfig
@WebServlet({ "/admin/product/index", "/admin/product/create", "/admin/product/store", "/admin/product/delete","/admin/product/edit",
	"/admin/product/update",
})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO proDAO; 
	private CategoryDAO cateDAO;

    public ProductServlet() {
        super();
        proDAO =new ProductDAO();
        cateDAO =new CategoryDAO();
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
			List<Product> ds = this.proDAO.getAll();

			request.setAttribute("listPro", ds);
			request.setAttribute("view",
				"/views/admin/product/index.jsp");
			
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
				.forward(request, response);
		}

		private void create(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			List<Category> listCate = this.cateDAO.getAll();
			request.setAttribute("listCate", listCate);
			//System.out.println(listCate.get(0).getTen());
			request.setAttribute("view",
				"/views/admin/product/create.jsp");
			request.getRequestDispatcher("/views/layoutAdmin.jsp")
			.forward(request, response);
		}

		private void edit(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			List<Category> listCate = this.cateDAO.getAll();
			request.setAttribute("listCate", listCate);
			
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			Product entity = this.proDAO.findById(id);
			Category cate =entity.getCategory();
			
			request.setAttribute("product", entity);
			request.setAttribute("view",
				"/views/admin/product/edit.jsp");
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
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			Product entity = this.proDAO.findById(id);
			try {
				this.proDAO.delete(entity);
				// TODO: Thông báo thành công
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: Thông báo lỗi
			}

			response.sendRedirect("/Assignment_Java4"
				+ "/admin/product/index");
		}

		private void store(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			HttpSession session = request.getSession();
			try {
				Product entity = new Product();
				BeanUtils.populate(entity, request.getParameterMap());
				
				File dir= new File(request.getServletContext().getRealPath("/imgProduct"));
	            if (!dir.exists()) {
	                dir.mkdirs();
	            } 
	            Part photoPart= request.getPart("img");
	            String namePtString=photoPart.getSubmittedFileName();
	            entity.setImg(namePtString);
	            File photoFile = new File(dir,photoPart.getSubmittedFileName());
	            photoPart.write(photoFile.getAbsolutePath());
				int id =Integer.parseInt(request.getParameter("categoryId")) ;
				Category c =cateDAO.findById(id);
				entity.setCategory(c);
				
	            
				this.proDAO.create(entity);
				session.setAttribute("message",
					"Thêm mới thành công");
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/product/index");
			} catch (Exception e) {
				e.printStackTrace();

				session.setAttribute("error",
					"Thêm mới thất bại");
				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/product/create");
			}
		}

		private void update(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			
			try {
				Product entity = new Product();
				BeanUtils.populate(entity, request.getParameterMap());
				String id = request.getParameter("categoryId");
				System.out.println(id);
				int idR =Integer.parseInt(id) ;
				Category cate = cateDAO.findById(idR);
				entity.setCategory(cate);
				///img
				File dir= new File(request.getServletContext().getRealPath("/imgProduct"));
	            if (!dir.exists()) {
	                dir.mkdirs();
	            } 
	            Part photoPart= request.getPart("img");
	            String namePtString=photoPart.getSubmittedFileName();
	            entity.setImg(namePtString);
	            File photoFile = new File(dir,photoPart.getSubmittedFileName());
	            photoPart.write(photoFile.getAbsolutePath());
				this.proDAO.update(entity);
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/product/index");
			} catch (Exception e) {
				e.printStackTrace();

				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/product/create");
			}
		}
	
	

}
