package com.wy.pojo;

public class JsonResult {
	
	private int code;
	
	private String result;
	
	private String message;
	
	public JsonResult() { }
	
	public JsonResult(int code) {
		this.code = code;
	}
	
	public JsonResult(int code,String message) {
		this.code = code;
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}