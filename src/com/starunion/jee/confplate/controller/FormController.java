package com.starunion.jee.confplate.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.starunion.jee.confplate.service.FormGetService;
import com.starunion.jee.confplate.service.FormSubmitService;
import com.starunion.jee.confplate.service.LanResBundleService;

@Controller
public class FormController {
	private static final Logger logger = LoggerFactory.getLogger(FormController.class);

	@Autowired
	FormGetService formGetServ;
	@Autowired
	FormSubmitService formSubmitServ;

	@RequestMapping(value = "/baseFormAction", method = { RequestMethod.GET })
	public String baseForm(Model model, @RequestParam("menu") String menu, @RequestParam("node") String node) {
		logger.debug("node={}", node);
		logger.debug("menu={}", menu);
		model.addAttribute("node", node);
		model.addAttribute("menu", menu);
		model.addAttribute("insList", formGetServ.getGenVoList(node));
		return "baseform";
	}

	@RequestMapping(value = "/baseFormSubmit", method = { RequestMethod.POST })
	@ResponseBody
	public String baseFormSubmit(@SuppressWarnings("rawtypes") @RequestBody Map map,@RequestParam("nodeLoc") String nodeLoc) {
		String result = null;
		@SuppressWarnings("unchecked")
		HashMap<String, String> revMap = (HashMap<String, String>) map;
		int res = formSubmitServ.submitGenVoList(nodeLoc, revMap);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> respMap = new HashMap<String, Object>();
		respMap.put("node", "test");
		respMap.put("submit", "ok");

		try {
			result = mapper.writeValueAsString(respMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		logger.debug("push result:{}", result);
		return result;
	}

	/**
	 * @author Lings
	 * @return json format data
	 * @param String
	 *            node used to check some param
	 * @describe Ajax way take the base benifit is no fresh,but here it takes
	 *           two problems 1.i18n no standered,use java.util.ResourceBundle
	 *           is not easy. may put this resource for each brower or new
	 *           session. 2.the jquery in the active JSPs seems not worked.
	 *           so,change to fresh method.
	 * @see baseForm(...)
	 */
	@RequestMapping(value = "/ipv4AjaxTest", method = { RequestMethod.GET })
	@ResponseBody
	public String getIpv4AjaxTest(@RequestParam("node") String node) {
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> respMap = new HashMap<String, Object>();

		respMap.put("node", LanResBundleService.resBundle.getString(node));
		respMap.put("submit", LanResBundleService.resBundle.getString("submit"));

		/** this method is special for each request */
		respMap.put("insMap", formGetServ.getNetworkParam());

		try {
			result = mapper.writeValueAsString(respMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		logger.debug("push result:{}", result);
		return result;
	}

}
