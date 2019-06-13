package com.niaobulashi.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 返回数据
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
public class ResponseVo extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	
	public ResponseVo() {
		put("code", 0);
	}
	
	public static ResponseVo error() {
		return error(500, "未知异常，请联系管理员");
	}
	
	public static ResponseVo error(String msg) {
		return error(500, msg);
	}
	
	public static ResponseVo error(int code, String msg) {
		ResponseVo r = new ResponseVo();
		r.put("code", code);
		r.put("msg", msg);
		return r;
	}

	public static ResponseVo ok(String msg) {
		ResponseVo r = new ResponseVo();
		r.put("msg", msg);
		return r;
	}
	
	public static ResponseVo ok(Map<String, Object> map) {
		ResponseVo r = new ResponseVo();
		r.putAll(map);
		return r;
	}
	
	public static ResponseVo ok() {
		return new ResponseVo();
	}

	public ResponseVo put(String key, Object value) {
		super.put(key, value);
		return this;
	}
}
