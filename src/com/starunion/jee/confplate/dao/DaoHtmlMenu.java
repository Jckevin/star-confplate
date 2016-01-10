package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;


@Repository
public class DaoHtmlMenu extends DbUtilsTemplate {
	public List<DaoHtmlMenu> findByLevel() {
		List<DaoHtmlMenu> list = new ArrayList<DaoHtmlMenu>();
		list = super.find(DaoHtmlMenu.class, "select * from menu order by id");
		return list;
	}
}
