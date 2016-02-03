package com.starunion.jee.confplate.service;

import java.util.HashMap;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoGeneralConf;
import com.starunion.jee.confplate.dao.DaoUserSip;
import com.starunion.jee.confplate.po.UserSip;

@Service
public class FormSubmitService {
	private static final Logger logger = LoggerFactory.getLogger(FormSubmitService.class);
	@Autowired
	DaoGeneralConf daoGenConf;
	@Autowired
	DaoUserSip daoUserSip;
	/**
	 * @author Lings
	 * @date 2016.01.19
	 * @describe this method need a transaction management.
	 *           for database operate is a group of insert.
	 *           temply,think this method is always successful.
	 * */
	public int submitGenVoList(String sqlName,HashMap<String,String> map){
		int result = 0;
		logger.debug("invoke submit General Vo List ! here is important ,need change to a transaction!");
		for (Entry<String, String> entry : map.entrySet()) {
			daoGenConf.updateGenConf(sqlName, entry.getKey(), entry.getValue());
		}
		
		return result;
	}
	
	public int submitUserInfo(String sqlName,HashMap<String,String> revMap){

		logger.debug("sigle for submit user Info .");
		for (Entry<String, String> entry : revMap.entrySet()) {
			logger.debug("receive map key = {}, value = {}", entry.getKey(), entry.getValue());
		}
		String number = revMap.get("terNum");
		String passMode = revMap.get("passRd");
		String password = "";
		if(passMode.equals("1")){
			password = revMap.get("terPass");
		}else{
			password = number;
		}
		String terName = revMap.get("terName");
		String terDep = revMap.get("terDepartment");
		String terPri = revMap.get("terPri");
		String terType = revMap.get("terType");
		String terRd = revMap.get("recRd");
		int result = 0;
		UserSip us = daoUserSip.findByNumber(number);
		if(us != null){
			return result;
		}else{
			result = daoUserSip.insertSipUser(number,password,terName,terDep,terPri,terType,terRd);
		}
		return result;
	}
}
