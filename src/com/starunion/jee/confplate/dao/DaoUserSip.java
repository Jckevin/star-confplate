package com.starunion.jee.confplate.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.po.UserSip;

@Component
public class DaoUserSip extends DbUtilsTemplate {
	private static final Logger logger = LoggerFactory.getLogger(DaoUserSip.class);

	public List<UserSip> findAll() {
		List<UserSip> list = new ArrayList<UserSip>();
		list = super.find(UserSip.class, "select * from sip_users order by id");
		return list;
	}

	public List<UserSip> findAllTransUsers() {
		List<UserSip> list = new ArrayList<UserSip>();
		list = super.find(UserSip.class, "select * from sip_users where alltrans != \"\"");
		/**
		 * directly use Object[] params more beautiful, but can't work. list =
		 * super.find(UserSip.class, select * from sip_users where alltrans =
		 * \"800\""); OK list = super.find(UserSip.class,
		 * "select * from sip_users where ? != ?", params); ERROR list =
		 * super.find(UserSip.class,
		 * "select * from sip_users where name = ? and value = ", params); OK
		 */
		return list;
	}

	public UserSip findByNumber(String number) {
		UserSip info = new UserSip();
		StringBuffer strBuff = new StringBuffer();
		strBuff.append("select * from sip_users where number = \"");
		strBuff.append(number);
		strBuff.append("\"");
		info = super.findFirst(UserSip.class, strBuff.toString());
		return info;
	}

	public int updateTransByNumber(String number, String transnumber) {
		StringBuffer sql = new StringBuffer();
		sql.append("update sip_users set alltrans = \"");
		sql.append(transnumber);
		sql.append("\"");
		sql.append(" where number = \"");
		sql.append(number);
		sql.append("\"");

		int res = super.update(sql.toString());
		return res;

	}

	public int insertSipUser(String num, String pwd, String name, String tDep, String tPri, String tType, String tRd) {

		int type = Integer.parseInt(tType);
		StringBuffer sql = new StringBuffer();
		sql.append("insert into sip_users (number,password,name,department,privilege,type,record,alltrans) ");
		sql.append("values(\"");
		sql.append(num).append("\",\"");
		sql.append(pwd).append("\",\"");
		sql.append(name).append("\",\"");
		sql.append(tDep).append("\",\"");
		sql.append(tPri).append("\",\"");
		sql.append(type).append("\",");
		sql.append(tRd).append(",");
		sql.append("\"0\"");// alltrans... may be should the table can be NULL!
		sql.append(")");
		int res = super.update(sql.toString());
		return res;

	}

	public int batchInsertSipUser(Object[][] infoArry) {

		StringBuffer sql = new StringBuffer();
		sql.append("insert into sip_users");
		sql.append("(number,password,department,privilege,type,record,alltrans)");
		sql.append("values(?,?,?,?,?,?,\"0\")");
		int[] res = super.batchUpdate(sql.toString(), infoArry);
		for (int j : res) {
			if (j == 1) {
				return 0;
			} else {
				return -1;
			}
		}
		return 0;

	}

}
