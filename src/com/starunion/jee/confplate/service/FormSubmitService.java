package com.starunion.jee.confplate.service;

import java.util.HashMap;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoGeneralConf;

@Service
public class FormSubmitService {
	private static final Logger logger = LoggerFactory.getLogger(FormSubmitService.class);
	@Autowired
	DaoGeneralConf daoGenConf;
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
}
