package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.po.MenuNode;

@Service
public class HomeService {

	public HomeService(){
		
	}
	
	public List<MenuNode> getMenuTree(){
		//for some reasons ,make this data structure static.
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
