package com.starunion.jee.confplate.controller;

import java.nio.charset.Charset;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.starunion.jee.confplate.service.LanResBundleService;
import com.starunion.jee.confplate.service.LoginService;


@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginServ;
	@Autowired
	LanResBundleService lanResServ;
	
	@RequestMapping(value = "/langSet", method={RequestMethod.GET})
	@ResponseBody
	public String langSet(HttpServletRequest request,@RequestParam("langChoose") String langChoose) {
		
		logger.debug("LangChoose action.........{}\n",langChoose);
		request.getSession().setAttribute("langSet", langChoose);
		
		//initial Resource Bundle for ajax response.
		lanResServ.initResBundle(langChoose);
		
		return "success";
	}
	
	@RequestMapping(value = "/login", method={RequestMethod.POST})
	public String login(String loginname,String loginpasswd) {
		
		logger.debug("post request received.........\n");
		logger.debug("name:{},pass:{}",loginname,loginpasswd);
		
		loginServ.judgeLoginUser(loginname, loginpasswd);
		
		return "home";
	}
	
	@RequestMapping(value = "/loginCheck1", method={RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<String> logincheck1(@SuppressWarnings("rawtypes") @RequestBody Map map) {
		
		logger.debug("login check1.....{} : {}....",map.get("loginname"),map.get("loginpasswd"));
		HttpHeaders responseHeaders = new HttpHeaders();
		MediaType mediaType = new MediaType("text", "html", Charset.forName("UTF-8"));
		responseHeaders.setContentType(mediaType);
		loginServ.judgeLoginUser((String)map.get("loginname"), (String)map.get("loginpasswd"));
		ResponseEntity<String> responseEntity = new ResponseEntity<String>("", responseHeaders, 
				HttpStatus.CREATED);
		return responseEntity;
	}
	
	@RequestMapping(value = "/loginCheck", method={RequestMethod.POST})
	@ResponseBody
	public String logincheck(@SuppressWarnings("rawtypes") @RequestBody Map map,HttpServletRequest request) {
		if(lanResServ.resBundle == null){
			logger.debug("language was not special configured,set default to zh_CN");
			lanResServ.initResBundle("zh_CN");
		}else{
			logger.debug("language was special configured,use config params.");	
		}
		
		String checkRes = null;
		logger.debug("login check.....{} : {}....",map.get("loginname"),map.get("loginpasswd"));
		try {
			checkRes = loginServ.judgeLoginUserJson((String)map.get("loginname"), (String)map.get("loginpasswd"));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return checkRes;
	}
	
}
