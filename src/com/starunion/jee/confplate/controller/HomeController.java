package com.starunion.jee.confplate.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.starunion.jee.confplate.po.MenuNode;
import com.starunion.jee.confplate.service.LoginService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	LoginService loginServ;
//	DaoUserSip daoUserSip;
	

	@RequestMapping(value = "/home", method={RequestMethod.POST})
	public String login2home(Model model,String loginname,String loginpasswd) {
		
		logger.debug("before get home parameters, recheck user info");
		
		int res = loginServ.judgeLoginUser(loginname, loginpasswd);
		if(res == 0){
			MenuNode bar1 = new MenuNode();
			bar1.setNodeName("test1");
			bar1.setNodeUrl("test1.action");
			bar1.setNodeView("1");
			
			MenuNode bar2 = new MenuNode();
			bar2.setNodeName("test2");
			bar2.setNodeUrl("test2.action");
			bar2.setNodeView("1");
			
			List<MenuNode> nodeList = new ArrayList<MenuNode>();
			nodeList.add(bar1);
			nodeList.add(bar2);
			
			MenuNode used1 = new MenuNode();
			used1.setNodeName("step1");
			used1.setNodeList(nodeList);
			
			MenuNode used2 = new MenuNode();
			used2.setNodeName("step2");
			used2.setNodeList(nodeList);
			
			List<MenuNode> tree = new ArrayList<MenuNode>();
			tree.add(used1);
			tree.add(used2);
			
			model.addAttribute("menu", used1);
			model.addAttribute("metree", tree);
		}
		
		
		return "home";
	}

}
