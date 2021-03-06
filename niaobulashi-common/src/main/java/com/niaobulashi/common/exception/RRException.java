package com.niaobulashi.common.exception;

/**
 * @program: niaobulashi
 * @description: 自定义异常
 * @author: hulang
 * @create: 2019-06-06 15:24
 */
public class RRException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	// 返回信息
    private String msg;

    // 返回信息代码
    private int code = 500;
    
    public RRException(String msg) {
		super(msg);
		this.msg = msg;
	}
	
	public RRException(String msg, Throwable e) {
		super(msg, e);
		this.msg = msg;
	}
	
	public RRException(String msg, int code) {
		super(msg);
		this.msg = msg;
		this.code = code;
	}
	
	public RRException(String msg, int code, Throwable e) {
		super(msg, e);
		this.msg = msg;
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
	
}
