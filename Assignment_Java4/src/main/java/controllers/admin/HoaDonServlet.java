package controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;
import DAO.HoaDonDAO;
import entities.Cart;
import entities.Hoadon;
import entities.User;


@WebServlet({"/user/bill/index","/user/bill/create","/user/bill/update","/user/bill/userIndex","/user/bill/status"})
public class HoaDonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     CartDAO cartDAO;  
     HoaDonDAO HDDAO ;
    public HoaDonServlet() {
        super();
       cartDAO =new  CartDAO();
       HDDAO =new HoaDonDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		 if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		}
		else if (uri.contains("userIndex")) {
			this.userIndex(request, response);
		}
		else if (uri.contains("status")) {
			this.status(request, response);
		}else {
			// redirect 404
		}
	}
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("create")) {
			this.create(request, response);
		}

	}
	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			List<Hoadon> list = HDDAO.getTrangThaiNH3();
			request.setAttribute("listHD", list);
			request.setAttribute("view", "/views/HoaDon.jsp");
			request.getRequestDispatcher("/views/layoutAdmin.jsp").forward(request, response);
		
		
		
	}
	private void status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int status =Integer.parseInt(request.getParameter("status")) ;
		
		List<Hoadon> list = HDDAO.findHoaDonbystatus(status);
		
		request.setAttribute("listHD", list);
		request.setAttribute("view", "/views/thongTinDonHang.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	
}
	
	private void userIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		int status =Integer.parseInt(request.getParameter("status")) ;
//		List<Hoadon> list = HDDAO.findHoaDonbystatus(status);
//		
//		request.setAttribute("listHD", list);
		request.setAttribute("view", "/views/hoadonKH.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	
	
	
}
	private void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		
		try {
			Hoadon hd = new Hoadon();
			User u = (User) session.getAttribute("user");
			hd.setUser(u);
			hd.setStatus(0);
			hd.setThanhToan(0);
			hd.setTongTien(((int)session.getAttribute("total")));
			List<Cart> listCart  =cartDAO.getAll();
			try {
				
				for (Cart cartx : listCart) {
					cartx.setStatus(1);
					cartDAO.update(cartx);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			this.HDDAO.create(hd);
			

			session.setAttribute("message", "Thanh toán thành công");
			session.removeAttribute("cart");
			session.removeAttribute("total");
			response.sendRedirect("/Assignment_Java4/user/bill/userIndex");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		}
	  
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		Hoadon hd=HDDAO.findById(id);
		int status=hd.getStatus();
        String checkst=request.getParameter("status");
		try {
			if (checkst!=null) {
				hd.setStatus(4);
			}else {
				hd.setStatus(status+1);
			}
			
			HDDAO.update(hd);
			response.sendRedirect("/Assignment_Java4/user/bill/index");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
