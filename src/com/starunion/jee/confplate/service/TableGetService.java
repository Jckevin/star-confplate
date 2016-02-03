package com.starunion.jee.confplate.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoHtmlFuncButton;
import com.starunion.jee.confplate.dao.DaoUserSip;
import com.starunion.jee.confplate.po.HtmlFuncButton;
import com.starunion.jee.confplate.po.UserSip;

@Service
public class TableGetService {

	private static final Logger logger = LoggerFactory.getLogger(TableGetService.class);
	@Autowired
	DaoUserSip daoUserSip;
	@Autowired
	DaoHtmlFuncButton daoHtmlFuncBtn;
	
	/**
	 * @deprecated 
	 * this make jsp table dynimic more diffcult.
	 * so it's better to product more smart data structure.
	 * @see getTableBodyList(String sqlName){}
	 * */
	public List<UserSip> getTableList(String sqlName){
		logger.debug("get table list sqlName : {}",sqlName);
		List<UserSip> usersList = new ArrayList<UserSip>();
		usersList = daoUserSip.findAll();
		return usersList;
	}
	/** wait this dynimic param pause,as the table jsp may all different
	 *  @date 2016-01-25 on the train.
	 *  restart...
	 *  */
	public List<HtmlFuncButton> getTableFuncList(String sqlName){
		logger.debug("get function list sqlName : {}",sqlName);
		List<HtmlFuncButton> userFuncList = new ArrayList<HtmlFuncButton>();
		userFuncList = daoHtmlFuncBtn.findByMenuName("sipExten");
		return userFuncList;
	}
	
	public List<String> getTableThList(String sqlName){
		logger.debug("get static table head list .");
		List<String> tblThList = new ArrayList<String>();
		tblThList.add("terNum");
		tblThList.add("terPass");
		tblThList.add("terName");
		tblThList.add("terPri");
//		tblThList.add("terType");
		
		return tblThList;
	}
	public List<ArrayList<String>> getTableBodyList(String sqlName){
		logger.debug("get table list sqlName : {}",sqlName);
		List<ArrayList<String>> tbBodyList = new ArrayList<ArrayList<String>>();
		List<UserSip> usersList = new ArrayList<UserSip>();
		usersList = daoUserSip.findAll();
		for(UserSip us:usersList){
			ArrayList<String> al = new ArrayList<String>();
			al.add(us.getNumber());
			al.add(us.getPassword());
			String ss = us.getName();
			logger.debug("get name = {}",us.getName());
			if(ss != null){
				try {
					String ns = new String(ss.getBytes("iso-8859-1"),"utf-8");
					String ns1 = new String(ss.getBytes("iso-8859-1"),"gb2312");
					String ns2 = new String(ss.getBytes("utf-8"),"gb2312");
					String ns3 = new String(ss.getBytes("utf-8"),"iso-8859-1");
					logger.debug("after convert = {}, {} ,{} ,{}",ns,ns1,ns2,ns3);
					al.add(ns1);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}else{
				al.add("");
			}
			
			al.add(us.getPrivilege());
//			al.add(String.valueOf(us.getType()));
			tbBodyList.add(al);
		}
		return tbBodyList;
	}
}
