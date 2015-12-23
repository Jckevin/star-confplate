package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.MenuOneDao;
import com.starunion.jee.confplate.po.MenuStepOne;

@Service
public class HomeService {
	
	@Autowired
	MenuOneDao dao;
	
	public List<MenuStepOne> getAllMenu(){
		System.out.println(".......here service?");
		List<MenuStepOne> mlist = new ArrayList<MenuStepOne>();
		mlist = dao.findAll();
		
		return mlist;
	}
	
	
	
}
