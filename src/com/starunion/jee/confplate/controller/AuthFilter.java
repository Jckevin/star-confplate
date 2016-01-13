package com.starunion.jee.confplate.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class AuthFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(AuthFilter.class);

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		logger.debug("{}",uri);
		chain.doFilter(request, response);
//		if (uri.indexOf("login") >= 0) {
//			chain.doFilter(request, response);
//		} else {
//			if ((req.getSession()) == null || (req.getSession().getAttribute("user")) == null) {
//				// for ajax request，x-requested-with
//				System.out.println("need to skip to index.jsp");
//				if (req.getHeader("x-requested-with") != null
//						&& req.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
//					resp.setHeader("sessionstatus", "timeout");
//					resp.getWriter().print("登录超时！");
//				}
//				resp.sendRedirect("/index.jsp");
//				return;
//			} else {
//				chain.doFilter(request, response);
//
//			}
//		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
