package controllers.user;


import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import DAO.CartDAO;
import DAO.CategoryDAO;
import DAO.HoaDonDAO;
import DAO.ProductDAO;
import entities.Cart;

import entities.Category;
import entities.Hoadon;
import entities.Product;
import entities.User;



@WebServlet({"/user/sell/index","/user/sell/store","/user/sell/quantity-inc-dec",
	"/user/sell/show"})
public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     ProductDAO proDAO ;
     CategoryDAO cateDAO;
     CartDAO cartDAO;
     HoaDonDAO HDDAO;
    
    public SellServlet() {
        super();
        proDAO =new ProductDAO();
        cateDAO=new CategoryDAO();
        cartDAO =new CartDAO();
        HDDAO =new HoaDonDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			this.index(request,response);
		}
		else if (uri.contains("create")) {
			 this.create(request, response);
		}
		else if (uri.contains("store")) {
			 this.store(request, response);
		} 
		else if (uri.contains("quantity-inc-dec")) {
			this.tangGiam(request,response);
		}
		else if (uri.contains("show")) {
			this.show(request,response);
		}
		
		
	}

	
	private void tangGiam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();;
		String action = request.getParameter("action");
		String idStr =request.getParameter("id") ;
		int id =Integer.parseInt(idStr);
		Cart entity =cartDAO.findById(id);
		int soLuong =entity.getSoLuong();
		if(action.equals("dec")&&soLuong==1) {
			entity.setSoLuong(soLuong);
		}
		else if(action.equals("dec")) {
			entity.setSoLuong(soLuong-1);
		}
		else {
			entity.setSoLuong(soLuong+1);
		}
		
		cartDAO.update(entity);
		List<Cart> listCart = this.cartDAO.getAll();
		request.setAttribute("listCart", listCart);
		session.setAttribute("cart", listCart);
		int total =0;
		if(session.getAttribute("cart")!=null) {
			
			for (Cart cart : listCart) {
					
					total += (cart.getProduct().getDonGia() * cart.getSoLuong());
						
			}
		}
		session.setAttribute("total", total);
		
		request.setAttribute("view", "/views/cart.jsp");

		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			// Thông báo lỗi
			response.sendRedirect("/Assignment_Java4"
				+ "/user/sell/index");
		}
	}


	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Product> listPro ;
		List<Category> listCategories =this.cateDAO.getAll();
		
		String idStr =request.getParameter("id") ;
		//System.out.println(idStr);
		
		
		if(idStr==null||idStr.trim().equals("all")) {
			listPro = this.proDAO.getAll();
		}
		else {
			int id = Integer.parseInt(idStr);
			listPro =this.proDAO.getTheoDanhMuc(id);
		}
		
		
		request.setAttribute("listCate", listCategories);
		request.setAttribute("ds", listPro);		
		request.setAttribute("view", "/views/sell.jsp");

		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		
	}
	
	private void create(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
		HttpSession session = request.getSession();
			List<Cart> listCart = this.cartDAO.getAll();
			request.setAttribute("listCart", listCart);
			

		}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
	}
	private void store(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			HttpSession session = request.getSession();
			try {
				Cart entity = new Cart();
				
				int idPro = Integer.parseInt(request.getParameter("id")) ;
				Product product = proDAO.findById(idPro);
				entity.setProduct(product);
				entity.setSoLuong(1);
				entity.setThanhTien(product.getDonGia());
				User u =(User)session.getAttribute("user");
				entity.setUser(u);
				this.cartDAO.create(entity);
				
				

				List<Cart> listCart = this.cartDAO.getAll();
				request.setAttribute("listCart", listCart);
				session.setAttribute("cart", listCart);
				int total =0;
				if(session.getAttribute("cart")!=null) {
					
					for (Cart cart : listCart) {
							
							total += (cart.getProduct().getDonGia() * cart.getSoLuong());
								
					}
				}
				session.setAttribute("total", total);
				
				request.setAttribute("view", "/views/cart.jsp");
				request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();

				session.setAttribute("error",
					"Thêm mới thất bại");
				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/product/create");
			}
		}
	private void show(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
			HttpSession session = request.getSession();
			try {
				
				List<Cart> listCart = this.cartDAO.getAll();
				request.setAttribute("listCart", listCart);
				session.setAttribute("cart", listCart);
				int total =0;
				if(session.getAttribute("cart")!=null) {
					
					for (Cart cart : listCart) {
							
							total += (cart.getProduct().getDonGia() * cart.getSoLuong());
								
					}
				}
				//session.setAttribute("id", );
				session.setAttribute("total", total);
				
				request.setAttribute("view", "/views/cart.jsp");
				request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();

				session.setAttribute("error",
					"Thêm mới thất bại");
				// Thông báo lỗi
				response.sendRedirect("/Assignment_Java4"
					+ "/admin/product/create");
			}
		}
	
	

	
}
