package com.starunion.jee.confplate.service.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class HttpSessionProc {

	public String getSessionAttr(HttpServletRequest request,String key){
		
		String result = "";
		result = (String) request.getSession().getAttribute(key);
		if(result == null){
			return "zh_CN";
		}else{
			return result;
		}
		
	}
}
