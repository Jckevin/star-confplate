package com.starunion.jee.confplate.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.starunion.jee.confplate.po.MenuStepOne;
import com.starunion.jee.confplate.service.HomeService;

@Controller
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	@Autowired
	HomeService serv;

	@RequestMapping(value = "/index")
	public String index() {
		List<MenuStepOne> mlist = new ArrayList<MenuStepOne>();
		logger.debug("index controller\n");
//		MenuOneDao dao = new MenuOneDao();
		mlist = serv.getAllMenu();
		logger.debug("index controller over...\n");
		final Map<String, Object> model = new LinkedHashMap<String, Object>();  
        model.put("menu", mlist);  
        model.put("title", "测试表格");
		return "home";
	}
}
