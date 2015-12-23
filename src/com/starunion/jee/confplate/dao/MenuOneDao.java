package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.starunion.jee.confplate.po.MenuStepOne;

@Repository
public class MenuOneDao extends DbUtilsTemplate {
	private static final Logger logger = LoggerFactory.getLogger(MenuOneDao.class);

	public List<MenuStepOne> findAll() {
		List<MenuStepOne> menuList = new ArrayList<MenuStepOne>();
		menuList = super.find(MenuStepOne.class, "select * from menu_main");
		return menuList;
	}
	
	public MenuStepOne findById(int id) {
		MenuStepOne menu = new MenuStepOne();
		menu = (MenuStepOne) super.findBy("select * from menu_main where id = ?",id);
		return menu;
	}

}
