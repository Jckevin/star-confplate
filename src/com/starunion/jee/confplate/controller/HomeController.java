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

import com.starunion.jee.confplate.dao.DaoUserSip;
import com.starunion.jee.confplate.po.MenuStepOne;
import com.starunion.jee.confplate.po.UserSip;
import com.starunion.jee.confplate.service.HomeService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	DaoUserSip daoUserSip;

	@RequestMapping(value = "/home")
	public String home() {
		List<UserSip> mlist = new ArrayList<UserSip>();
		logger.debug("home controller\n");
//		MenuOneDao dao = new MenuOneDao();
		mlist = daoUserSip.findAll();
		logger.debug("home controller over...\n");
		for(int i=0;i<mlist.size();i++){
			logger.debug("name = {}",mlist.get(i).getName());
		}
//		final Map<String, Object> model = new LinkedHashMap<String, Object>();  
//        model.put("menu", mlist);  
//        model.put("title", "测试表格"); 
		return "home";
	}
//	public ModelAndView home() {
//		List<UserSip> mlist = new ArrayList<UserSip>();
//		logger.debug("home controller\n");
////		MenuOneDao dao = new MenuOneDao();
//		mlist = daoUserSip.findAll();
//		logger.debug("home controller over...\n");
//		for(int i=0;i<mlist.size();i++){
//			logger.debug("name = {}",mlist.get(i).getName());
//		}
//		final Map<String, Object> model = new LinkedHashMap<String, Object>();  
//        model.put("menu", mlist);  
//        model.put("title", "测试表格"); 
//		return new ModelAndView("home",model);
//	}

}
