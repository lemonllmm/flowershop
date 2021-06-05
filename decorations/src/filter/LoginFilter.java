package filter;

import java.io.IOException;
import javax.servlet.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * 所有对 decorationsAdd.jsp 的访问都将由该过滤器进行过滤， 过滤器如果判断用户没有登录，则返回到用户
 * 登录页面。即只有用户登录以后才能访问decorationsAdd.jsp
 */
@WebFilter(urlPatterns = { "/decorationsAdd.jsp,/adminHomePage.jsp,/showCar.jsp" }, initParams = {
		@WebInitParam(name = "backurl", value = "adminLogin.jsp") })
//urlPatterns要拦截的资源路径;   如果要过滤这个web应用的所有客户请求则urlPatterns = { "/*" }
public class LoginFilter implements Filter {
	String backUrl;
// 如果没有登录，就返回到指定页面
	public void init(FilterConfig fConfig) throws ServletException {
		// 从过滤器的配置中获得初始化参数，如果没有就使用默认值 index.jsp
		if (fConfig.getInitParameter("backurl") != null) {
			backUrl = fConfig.getInitParameter("backurl");

		}

		else {

			backUrl = "index.jsp";

		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// doFilter()方法的参数并不是 HTTP 对象，
		// 如果需要,则将 ServletResponse转换为 HttpServletRequest，然后就可以应用子类 HttpServletRequest的方法
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();// 获取 Session 对象
		String login = (String) session.getAttribute("username");
		if (login==null || !login.equals("true")||login.equals("游客")) {
			res.sendRedirect(backUrl);
		} else
			chain.doFilter(request, response);// 执行chain中的 下一个 Filter
	}

	public void destroy() {
	}

}
