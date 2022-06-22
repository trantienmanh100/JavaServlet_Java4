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

import org.apache.commons.beanutils.BeanUtils;

import entities.User;




@WebFilter(urlPatterns = {"/admin/users/store","/admin/users/update"},
		filterName="Cre_Upd_Filter"
		)
public class CreUpFilter implements Filter {

  
    public CreUpFilter() {
        
    }

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session  = req.getSession();
		User u = new User();
		try {
			BeanUtils.populate(u, req.getParameterMap());
			if(u.getHoTen().equals("") || u.getEmail().equals("") || u.getSdt().equals("")|| u.getDiaChi().equals("")) {
				session.setAttribute("error", "Thất bại! Không được để trống");
				res.sendRedirect("/Assignment_Java4/admin/users/index");
				return;
			}
			chain.doFilter(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
