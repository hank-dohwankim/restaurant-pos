package filter;

import com.system.restaurant.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User userPassword = (User) session.getAttribute("user");

        String requestURI = req.getRequestURI();

        if (requestURI.contains("/doLogin")) {
            chain.doFilter(request, response);
            return;
        }

        if(!requestURI.contains("/doLogin")) {
            if(userPassword == null) {
                res.sendRedirect("/doLogin");
            } else {

                // DETAIL AUTHORITY CHECK
                boolean isAdmin = false;
                if("admin".equals(userPassword.getUser_type()) ) {
                    isAdmin = true;
                }

                if(requestURI.contains("/user.do") || requestURI.contains("/menu.do")) {
                    if(isAdmin) chain.doFilter(request, response);
                    else {
                        res.sendRedirect("/access_deny.do");
                    }
                }

                chain.doFilter(request, response);//sends request to next resource
            }
        } else {
            chain.doFilter(request, response);//sends request to next resource
        }
    }

    @Override
    public void destroy() {
    }
}
