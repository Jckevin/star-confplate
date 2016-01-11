package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.starunion.jee.confplate.po.HtmlMenu;


@Repository
public class DaoHtmlMenu extends DbUtilsTemplate {
	
	public List<HtmlMenu> findByLevel(Integer level) {
		List<HtmlMenu> list = new ArrayList<HtmlMenu>();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from menu where level = ");
		strBuff.append(level);
		strBuff.append(" order by id");
		list = super.find(HtmlMenu.class, strBuff.toString());
		return list;
	}
	
	public List<HtmlMenu> findByFid(Integer level,Integer fid) {
		List<HtmlMenu> list = new ArrayList<HtmlMenu>();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from menu where level = ");
		strBuff.append(level);
		strBuff.append(" and fid = ");
		strBuff.append(fid);
		strBuff.append(" order by id");
		list = super.find(HtmlMenu.class, strBuff.toString());
		return list;
	}
}
