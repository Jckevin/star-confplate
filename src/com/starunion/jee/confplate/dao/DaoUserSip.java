package com.starunion.jee.confplate.dao;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.starunion.jee.confplate.po.UserSip;
import com.starunion.jee.confplate.service.FormSubmitService;

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
		 * directly use Object[] params more beautiful, but can't work.
		 * list = super.find(UserSip.class, select * from sip_users where alltrans = \"800\""); OK 
		 * list = super.find(UserSip.class, "select * from sip_users where ? != ?", params); ERROR
		 * list = super.find(UserSip.class, "select * from sip_users where name = ? and value = ", params); OK
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
	
	public int updateTransByNumber(String number,String transnumber){
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
	
	public int insertSipUser(String num,String pwd,String name,String tDep,String tPri,String tType,String tRd){
//		private Integer id;
//		private String number;
//		private String password;
//		private String name;
//		private String privilege;
//		private String vmpass;
//		private String record;
//		private String department;
//		private String oname;
//		private String onum;
//		private String lines;
//		private Integer vmopen;
//		private String alltrans;
//		private Integer type;
//		private Integer trunknum;
		int type = Integer.parseInt(tType);
		StringBuffer sql = new StringBuffer();
		String cName = "";
		try {
			String cName1 = new String(name.getBytes("utf-8"),"iso-8859-1");
			cName = new String(name.getBytes("gb2312"),"iso-8859-1");
			logger.debug("after convert codec :{}:{}",cName,cName1);
			//\xC2\x8B\xC3\xA8\xC2\xAF...after convert codec :???è??é??è??
			//\xC2\x8B\xC3\xA8\xC2\xAF...
//			mysql> show variables like '%char%';
//			+--------------------------+----------------------------+
//			| Variable_name            | Value                      |
//			+--------------------------+----------------------------+
//			| character_set_client     | utf8                       |
//			| character_set_connection | utf8                       |
//			| character_set_database   | latin1                     |
//			| character_set_filesystem | binary                     |
//			| character_set_results    | utf8                       |
//			| character_set_server     | latin1                     |
//			| character_set_system     | utf8                       |
//			| character_sets_dir       | /usr/share/mysql/charsets/ |
//			+--------------------------+----------------------------+
//			8 rows in set (0.01 sec)

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql.append("insert into sip_users (number,password,name,department,privilege,type,record,alltrans) ");
		sql.append("values(\"");
		sql.append(num).append("\",\"");
		sql.append(pwd).append("\",\"");
		sql.append(name).append("\",\"");
		sql.append(tDep).append("\",\"");
		sql.append(tPri).append("\",\"");
		sql.append(type).append("\",");
		sql.append(tRd).append(",");
		sql.append("\"0\"");//alltrans... may be should the table can be NULL!
		sql.append(")");
		int res = super.update(sql.toString());
		return res;
		
	}

}
