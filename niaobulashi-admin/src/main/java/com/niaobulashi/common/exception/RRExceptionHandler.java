package com.niaobulashi.common.exception;

import com.niaobulashi.common.utils.ResponseVo;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @program: niaobulashi
 * @description: 数据过滤
 * @author: hulang
 * @create: 2019-06-13 19:38
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

	@ExceptionHandler(DuplicateKeyException.class)
	public ResponseVo handleDuplicateKeyException(DuplicateKeyException e){
		logger.error(e.getMessage(), e);
		return ResponseVo.error("数据库中已存在该记录");
	}

	@ExceptionHandler(AuthorizationException.class)
	public ResponseVo handleAuthorizationException(AuthorizationException e){
		logger.error(e.getMessage(), e);
		return ResponseVo.error("没有权限，请联系管理员授权");
	}

	@ExceptionHandler(Exception.class)
	public ResponseVo handleException(Exception e){
		logger.error(e.getMessage(), e);
		return ResponseVo.error();
	}
}
