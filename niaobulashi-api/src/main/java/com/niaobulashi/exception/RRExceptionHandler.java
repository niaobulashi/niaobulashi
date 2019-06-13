package com.niaobulashi.exception;

import com.niaobulashi.common.exception.RRException;
import com.niaobulashi.common.utils.ResponseVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 异常处理器
 *
 * @author Mark sunlightcs@gmail.com
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

	@ExceptionHandler(Exception.class)
	public ResponseVo handleException(Exception e){
		logger.error(e.getMessage(), e);
		return ResponseVo.error();
	}
}
