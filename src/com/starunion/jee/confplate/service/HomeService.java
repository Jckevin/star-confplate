package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoHtmlMenu;
import com.starunion.jee.confplate.po.HtmlMenu;
import com.starunion.jee.confplate.po.MenuNode;

@Service
public class HomeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	
	@Autowired
	DaoHtmlMenu daoHtmlMenu;
	public HomeService(){
		
	}
	
	public List<MenuNode> getMenuTree(){
		//for some reasons ,make this data structure static.
		List<HtmlMenu> menuLev1 = new ArrayList<HtmlMenu>();
		menuLev1 = daoHtmlMenu.findByLevel(1);
		
		List<HtmlMenu> menuLev2 = new ArrayList<HtmlMenu>();
		menuLev2 = daoHtmlMenu.findByFid(2,1);
		
		for(int i=0;i<menuLev1.size();i++){
			logger.debug("name = {},level={}",menuLev1.get(i).getName(),menuLev1.get(i).getLevel());
		}
		for(int i=0;i<menuLev2.size();i++){
			logger.debug("name = {},level={}",menuLev2.get(i).getName(),menuLev2.get(i).getLevel());
		}
		MenuNode m1 = new MenuNode();
		m1.setNodeName("manageExten");
		MenuNode m2 = new MenuNode();
		m2.setNodeName("manageNetwork");
		
		MenuNode m1s1 = new MenuNode();
		m1s1.setNodeName("ipExten");
		m1s1.setNodeUrl("ipExtenAct");
		MenuNode m3 = new MenuNode();
		MenuNode m4 = new MenuNode();
		MenuNode m5 = new MenuNode();
		
		
		
		List<MenuNode> tree = new ArrayList<MenuNode>();
		List<MenuNode> menuNode = new ArrayList<MenuNode>();
		
		List<MenuNode> menuNodeS2 = new ArrayList<MenuNode>();
		
		return tree;
		
	}
	
}
