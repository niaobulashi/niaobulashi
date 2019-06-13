package com.niaobulashi.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @program: niaobulashi
 * @description: 异常处理器
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@RestControllerAdvice
public class RRExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(RRException.class)
	public ResponseVo handleRRException(RRException e){
		ResponseVo r = new ResponseVo();
		r.put("code", e.getCode());
		r.put("msg", e.getMessage());

		return r;
	}

	@ExceptionHandler(Exception.class)
	public ResponseVo handleException(Exception e){
		logger.error(e.getMessage(), e);
		return ResponseVo.error();
	}
}
