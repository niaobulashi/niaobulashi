package com.niaobulashi.common.utils;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: niaobulashi
 * @description: HttpContextUtils
 * @author: hulang
 * @create: 2019-06-13 15:24
 */
public class HttpContextUtils {

	public static HttpServletRequest getHttpServletRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
}
