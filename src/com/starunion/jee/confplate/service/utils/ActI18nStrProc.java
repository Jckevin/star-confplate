package com.starunion.jee.confplate.service.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.dao.DaoHtml18Mapping;

@Component
public class ActI18nStrProc {

	@Autowired
	DaoHtml18Mapping daoHtml18Mapping;
	
	public String getI18nStr(String key,String lang){
		String res = "";
		res = daoHtml18Mapping.findValByLang(key, lang);
		return res;
	}
}
