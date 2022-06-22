package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;




@WebFilter( 
		 urlPatterns = "/admin/*",
		 filterName = "admin_filter"
		)
public class AdminFilter implements Filter {


	private static final long serialVersionUID = 1L;
    public AdminFilter() {
       super();
    }

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest) request;
		HttpServletResponse res =(HttpServletResponse) response;
		HttpSession session  = req.getSession();
		User u = (User) session.getAttribute("user");
		if(u == null) {
			res.sendRedirect("/Assignment_Java4/login");
			return;
		}
//		if(u.getRole()== 0) {
//			res.sendRedirect("/Assignment_Java4/login");
//			return;
//		}
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
