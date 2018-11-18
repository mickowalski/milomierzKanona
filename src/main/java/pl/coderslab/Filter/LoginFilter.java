package pl.coderslab.Filter;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@WebFilter(urlPatterns = "/*")
public class LoginFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {

        if (isAllowedOnlyForLoggedIn(httpServletRequest.getRequestURI(), httpServletRequest.getContextPath())
                && httpServletRequest.getSession().getAttribute("logged") == null) {

            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/customers/ranking");
            return;
        }
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

    private boolean isAllowedOnlyForLoggedIn(String url, String contextPath) {
        Set<String> allowedWithoutBeingLoggedIn = new HashSet<>(Arrays.asList(
                contextPath + "/user/login", contextPath + "/customers/ranking",
                contextPath + "/resources/css/bootstrap_edited.css",
                contextPath + "/resources/graphics/background.jpg",
                contextPath + "/resources/scripts/ranking.js"));

        return !allowedWithoutBeingLoggedIn.contains(url);
    }

}
