package com.starunion.jee.confplate.dao;

import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.po.OperatorWeb;

@Component
public class DaoOperatorWeb extends DbUtilsTemplate {

	public OperatorWeb findByNumber(String name) {
		OperatorWeb loginUser = new OperatorWeb();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from operator where username = \"");
		strBuff.append(name);
		strBuff.append("\"");
		loginUser = super.findFirst(OperatorWeb.class, strBuff.toString());
		return loginUser;
	}
}
