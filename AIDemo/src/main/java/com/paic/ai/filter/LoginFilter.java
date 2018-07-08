package com.paic.ai.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.paic.ai.dto.AiUser;

public class LoginFilter implements Filter{
    
    private static final List<String> unFilterUrls = Arrays.asList("main/validateLogin.do","main/checkCode.do");

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("loginFilter初始化");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("进入login过滤器");
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        HttpSession session = request.getSession();
        //获取用户请求的uri
        String requestURI = request.getRequestURI();
        System.out.println("requestURI="+requestURI);
        for (String url : unFilterUrls) {
            if (requestURI.indexOf(url) > -1) {
                chain.doFilter(request, response);
                return;
            }
        }
        //登录界面不过滤
        if (requestURI.indexOf("/login.jsp") > -1) {
            chain.doFilter(request, response);
            return;
        }
        //非登录界面过滤
        String userName = (String) session.getAttribute("userName");
        System.out.println("session userName=" + userName);
        //没有登录重定向到登录界面，已登录把请求传递下去
        if (null == userName || userName.equals("")) {
            response.reset();
            PrintWriter out = response.getWriter();  
            out.println("<html>");      
            out.println("<script>");      
            out.println("window.open ('"+request.getContextPath()+"/views/login.jsp','_top')");      
            out.println("</script>");      
            out.println("</html>"); 
            System.out.println("返回顶层");
        } else {
            System.out.println("after 返回顶层");
            //已登录，继续此次请求
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        System.out.println("LoginFilter销毁");
    }

}
