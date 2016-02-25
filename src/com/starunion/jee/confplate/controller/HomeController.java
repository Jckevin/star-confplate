package com.starunion.jee.confplate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.starunion.jee.confplate.po.HtmlMenu;
import com.starunion.jee.confplate.po.MenuTreeNode;
import com.starunion.jee.confplate.service.HomeService;
import com.starunion.jee.confplate.service.LoginService;
import com.starunion.jee.confplate.service.utils.ConstantGen;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	LoginService loginServ;
	@Autowired
	HomeService homeServ;	

	@RequestMapping(value = "/home", method={RequestMethod.POST})
	public String login2home(Model model,String loginname,String loginpasswd, HttpSession httpSession) {
		
		logger.debug("before get home parameters, recheck user info");
		int res = loginServ.judgeLoginUser(loginname, loginpasswd);
		
		if(res == ConstantGen.SUCCESS){
			httpSession.setAttribute("user", loginname);
			List<MenuTreeNode> treeNodeList = new ArrayList<MenuTreeNode>();
			treeNodeList = homeServ.getMenuTreeList();
//			printTreeInfo(treeNodeList);
			httpSession.setAttribute("menutree", treeNodeList);
		}
		return "home";
	}

	public void printTreeInfo(List<MenuTreeNode> list){
		for (MenuTreeNode node : list) {
			logger.debug("controller -> first level Node :{}", node.getTreeNodeName());
			for (HtmlMenu hm : node.getSubNodeList()) {
				logger.debug("Node {} 's subNode -> {} : {}", node.getTreeNodeName(),
						hm.getName(),hm.getAction());
			}
		}
	}
}
