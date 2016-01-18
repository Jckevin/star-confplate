package com.starunion.jee.confplate.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.starunion.jee.confplate.service.FormService;
import com.starunion.jee.confplate.service.LanResBundleService;

@Controller
public class FormController {
	private static final Logger logger = LoggerFactory.getLogger(FormController.class);
	
	@Autowired
	FormService formServ;
	
	@RequestMapping(value = "/ipv4", method = { RequestMethod.GET })
	@ResponseBody
	public String getIpv4(@RequestParam("node") String node) {
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> respMap = new HashMap<String, Object>();
				
		respMap.put("node", LanResBundleService.resBundle.getString(node));
		respMap.put("submit", LanResBundleService.resBundle.getString("submit"));
		
		/** this method is special for each request*/
		respMap.put("insMap", formServ.getNetworkParam());
		
		try {
			result = mapper.writeValueAsString(respMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		logger.debug("push result:{}", result);
		return result;
	}
	
	@RequestMapping(value = "/ipconf", method = { RequestMethod.GET })
	public String baseForm(Model model,@RequestParam("db") String node) {
		logger.debug("node={}",node);
		model.addAttribute("node", node);
		model.addAttribute("insList", formServ.getNetworkList());
		return "baseform";
	}
}
