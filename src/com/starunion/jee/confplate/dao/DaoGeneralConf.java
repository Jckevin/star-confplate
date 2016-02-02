package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.po.GeneralConf;
import com.starunion.jee.confplate.po.GeneralSubConf;

@Component
public class DaoGeneralConf extends DbUtilsTemplate {
	private static final Logger logger = LoggerFactory.getLogger(DaoGeneralConf.class);
	public List<GeneralConf> getNetworkConf() {
		List<GeneralConf> list = new ArrayList<GeneralConf>();
		list = super.find(GeneralConf.class, "select * from conf_network order by id");
		return list;
	}
	
	public List<GeneralConf> getGenConf(String sqlName) {
		List<GeneralConf> list = new ArrayList<GeneralConf>();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from ");
		strBuff.append(sqlName);
		strBuff.append(" order by id");
		list = super.find(GeneralConf.class, strBuff.toString());
		return list;
	}
	
	public int updateGenConf(String sqlName,String key,String value){
		StringBuffer sql = new StringBuffer();
		sql.append("update ");
		sql.append(sqlName);
		sql.append(" set value = \"");
		sql.append(value);
		sql.append("\"");
		sql.append(" where name = \"");
		sql.append(key);
		sql.append("\"");
		logger.debug("update General Conf with sql : \n{}",sql.toString());
		int res = super.update(sql.toString());
		return res;
	}
	/** this method used for table travelled jsps.
	 *  like userManage->addUser */
	public List<GeneralSubConf> getSubGenConf(String qName,String sqlName) {
		List<GeneralSubConf> list = new ArrayList<GeneralSubConf>();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from ");
		strBuff.append(sqlName);
		strBuff.append(" where node = \"");
		strBuff.append(qName);
		strBuff.append("\" order by id");
		list = super.find(GeneralSubConf.class, strBuff.toString());
		return list;
	}
}
