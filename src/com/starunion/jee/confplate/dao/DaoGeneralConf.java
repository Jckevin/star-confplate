package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.po.GeneralConf;

@Component
public class DaoGeneralConf extends DbUtilsTemplate {

	public List<GeneralConf> getNetworkConf() {
		List<GeneralConf> list = new ArrayList<GeneralConf>();
		list = super.find(GeneralConf.class, "select * from conf_network order by id");
		return list;
	}
}
