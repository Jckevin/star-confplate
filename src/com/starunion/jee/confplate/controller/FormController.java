package com.starunion.jee.confplate.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FormController {
	private static final Logger logger = LoggerFactory.getLogger(FormController.class);
	
	@RequestMapping(value = "/ipv4", method={RequestMethod.POST})
	@ResponseBody
	public String getIpv4() {
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> respMap = new HashMap<String, String>();
		respMap.put("ipAddr", "192.168.8.11");
		respMap.put("ipNetmask", "255.255.255.0");
		try {
			result = mapper.writeValueAsString(respMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		logger.debug("push result:{}",result);
		return result;
	}
}
