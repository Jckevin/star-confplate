package com.starunion.jee.confplate.controller;

import java.nio.charset.Charset;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starunion.jee.confplate.service.LoginService;


@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginServ;
	
	@RequestMapping(value = "/login", method={RequestMethod.POST})
	public String login(String loginname,String loginpasswd) {
		
		logger.debug("post request received.........\n");
		logger.debug("name:{},pass:{}",loginname,loginpasswd);
		
		loginServ.judeLoginUser(loginname, loginpasswd);
		
		return "";
	}
	
	@RequestMapping(value = "/loginCheck", method={RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<String> logincheck(@RequestBody Map map) {
		
		logger.debug("login check.....{}....",map.get("loginname"));
		HttpHeaders responseHeaders = new HttpHeaders();
		MediaType mediaType = new MediaType("text", "html", Charset.forName("UTF-8"));
		responseHeaders.setContentType(mediaType);
		String checkRes = loginServ.judeLoginUser((String)map.get("loginname"), (String)map.get("loginpasswd"));
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(checkRes, responseHeaders, 
				HttpStatus.CREATED);
		return responseEntity;
	}
}
