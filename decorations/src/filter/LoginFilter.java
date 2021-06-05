package filter;

import java.io.IOException;
import javax.servlet.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * ���ж� decorationsAdd.jsp �ķ��ʶ����ɸù��������й��ˣ� ����������ж��û�û�е�¼���򷵻ص��û�
 * ��¼ҳ�档��ֻ���û���¼�Ժ���ܷ���decorationsAdd.jsp
 */
@WebFilter(urlPatterns = { "/decorationsAdd.jsp,/adminHomePage.jsp,/showCar.jsp" }, initParams = {
		@WebInitParam(name = "backurl", value = "adminLogin.jsp") })
//urlPatternsҪ���ص���Դ·��;   ���Ҫ�������webӦ�õ����пͻ�������urlPatterns = { "/*" }
public class LoginFilter implements Filter {
	String backUrl;
// ���û�е�¼���ͷ��ص�ָ��ҳ��
	public void init(FilterConfig fConfig) throws ServletException {
		// �ӹ������������л�ó�ʼ�����������û�о�ʹ��Ĭ��ֵ index.jsp
		if (fConfig.getInitParameter("backurl") != null) {
			backUrl = fConfig.getInitParameter("backurl");

		}

		else {

			backUrl = "index.jsp";

		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// doFilter()�����Ĳ��������� HTTP ����
		// �����Ҫ,�� ServletResponseת��Ϊ HttpServletRequest��Ȼ��Ϳ���Ӧ������ HttpServletRequest�ķ���
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();// ��ȡ Session ����
		String login = (String) session.getAttribute("username");
		if (login==null || !login.equals("true")||login.equals("�ο�")) {
			res.sendRedirect(backUrl);
		} else
			chain.doFilter(request, response);// ִ��chain�е� ��һ�� Filter
	}

	public void destroy() {
	}

}
