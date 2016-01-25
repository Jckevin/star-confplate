package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.starunion.jee.confplate.po.HtmlFuncButton;

@Repository
public class DaoHtmlFuncButton extends DbUtilsTemplate {
	
	public List<HtmlFuncButton> findByMenuName(String mName) {
		List<HtmlFuncButton> list = new ArrayList<HtmlFuncButton>();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from html_table_func where menuName = \"");
		strBuff.append(mName);
		strBuff.append("\" order by id");
		list = super.find(HtmlFuncButton.class, strBuff.toString());
		return list;
	}
}
