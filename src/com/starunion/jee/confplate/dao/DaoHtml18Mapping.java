package com.starunion.jee.confplate.dao;

import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.po.Html18Mapping;

@Component
public class DaoHtml18Mapping extends DbUtilsTemplate{

	public String findValByLang(String key,String lang) {
		Html18Mapping item = new Html18Mapping();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from html_table_item_i18n where name = \"");
		strBuff.append(key);
		strBuff.append("\" and lang = \"");
		strBuff.append(lang);
		strBuff.append("\"");
		System.out.println("!!!!!!!!"+strBuff.toString());
		item  = super.findFirst(Html18Mapping.class, strBuff.toString());
		return item.getValue();
	}
}
