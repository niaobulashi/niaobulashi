package com.niaobulashi.common.xss;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @program: 数据校验
 * @description: XSS过滤
 * @author: hulang
 * @create: 2019-06-13 15:24
 */
public class XssFilter implements Filter {

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper(
				(HttpServletRequest) request);
		chain.doFilter(xssRequest, response);
	}

	@Override
	public void destroy() {
	}

}