package com.starunion.jee.confplate.service;

import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.starunion.jee.confplate.dao.DaoOperatorWeb;
import com.starunion.jee.confplate.po.OperatorWeb;

@Service
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);

	@Autowired
	DaoOperatorWeb daoOperatorWeb;

	public String judgeLoginUserJson(String name, String passwd) throws JsonProcessingException {
		logger.debug("begin check login,sql waste time ?.");
		OperatorWeb user = daoOperatorWeb.findByNumber(name);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "";
		if (user == null) {
			logger.debug("please input the right user NAME!");
			map.put("statusCode", "1");
			map.put("reasonCode", "loginErrUser");
			result = mapper.writeValueAsString(map);
		} else {
			String resPass = user.getPassword();
			if (resPass.equals(passwd)) {
				logger.debug("sucessful login start direc to the home page.");
				map.put("statusCode", "0");
				map.put("reasonCode", "loginSuccess");
				result = mapper.writeValueAsString(map);
			} else {
				logger.debug("please input the right use PASSWORD!");
				map.put("statusCode", "2");
				map.put("reasonCode", "loginErrPasswd");
				result = mapper.writeValueAsString(map);
			}
		}
		return result;
	}

	public int judgeLoginUser(String name, String passwd) {
		OperatorWeb user = daoOperatorWeb.findByNumber(name);
		if (user == null) {
			logger.debug("please input the right user NAME!");
			return 1;
		} else {
			String resPass = user.getPassword();
			if (resPass.equals(passwd)) {
				logger.debug("recheck, sucessful login start direc to the home page.");
				return 0;
			} else {
				logger.debug("please input the right use PASSWORD!");
				return 2;
			}
		}
	}
}
