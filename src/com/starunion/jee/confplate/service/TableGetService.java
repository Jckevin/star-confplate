package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoUserSip;
import com.starunion.jee.confplate.po.HtmlFuncButton;
import com.starunion.jee.confplate.po.UserSip;

@Service
public class TableGetService {

	private static final Logger logger = LoggerFactory.getLogger(TableGetService.class);
	@Autowired
	DaoUserSip daoUserSip;
	
	public List<UserSip> getTableList(String sqlName){
		logger.debug("get table list sqlName : {}",sqlName);
		List<UserSip> usersList = new ArrayList<UserSip>();
		usersList = daoUserSip.findAll();
		return usersList;
	}
	/** wait this dynimic param pause,as the table jsp may all different
	 *  @deprecated
	 *  */
	public List<HtmlFuncButton> getTableFuncList(String sqlName){
		logger.debug("get function list sqlName : {}",sqlName);
		List<HtmlFuncButton> usersList = new ArrayList<HtmlFuncButton>();
//		usersList = daoUserSip.findAll();
		HtmlFuncButton hfb = new HtmlFuncButton();
		hfb.setName("add");
		hfb.setPic("glyphicon glyphicon-minus");
		return usersList;
	}
}
