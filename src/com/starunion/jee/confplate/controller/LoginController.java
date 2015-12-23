package com.starunion.jee.confplate.controller;

import java.nio.charset.Charset;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

//	@Autowired
//	NewsManager newsManager;
//
	@RequestMapping(value = "/login")
	@ResponseBody
	public ResponseEntity<String> login() {
		
		logger.debug(".........\n");
		HttpHeaders responseHeaders = new HttpHeaders();
		MediaType mediaType = new MediaType("text", "html", Charset.forName("UTF-8"));
		responseHeaders.setContentType(mediaType);
		ResponseEntity<String> responseEntity = new ResponseEntity<String>("success", responseHeaders, 
				HttpStatus.CREATED);
		return responseEntity;
	}

}
