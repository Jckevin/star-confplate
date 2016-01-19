package com.starunion.jee.confplate.controller;

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

import com.starunion.jee.confplate.service.TableGetService;

@Controller
public class TableController {
	private static final Logger logger = LoggerFactory.getLogger(TableController.class);

	@Autowired
	TableGetService tableGetServ;
	
	@RequestMapping(value = "/baseTableAction", method = { RequestMethod.GET })
	public String baseForm(Model model, @RequestParam("menu") String menu, @RequestParam("node") String node) {
		model.addAttribute("node", node);
		model.addAttribute("menu", menu);
		model.addAttribute("insList", tableGetServ.getTableList(node));
		return "basetable";
	}

	@RequestMapping(value = "/sipExten", method = { RequestMethod.GET })
	@ResponseBody
	public String showSipExten(Model model, String loginname) {
		String checkRes = "holdon";

		model.addAttribute("test", "ahahahahah");
		logger.debug("@@@@@@@");
		return checkRes;
	}

	@RequestMapping(value = "/testSip", method = { RequestMethod.GET })
	public void showSipExtenTest(Model model, String loginname) {
		String checkRes = "holdon";

		model.addAttribute("test", "ahahahahah");
		logger.debug("!!!!!");
	}
}
