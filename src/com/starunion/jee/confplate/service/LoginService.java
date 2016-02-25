package com.starunion.jee.confplate.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.starunion.jee.confplate.dao.DaoOperatorWeb;
import com.starunion.jee.confplate.po.OperatorWeb;
import com.starunion.jee.confplate.service.utils.ConstantGen;
import com.starunion.jee.confplate.service.utils.JsonRespProc;

@Service
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);

	@Autowired
	DaoOperatorWeb daoOperatorWeb;
	@Autowired
	JsonRespProc jsonRespProc;

	public String judgeLoginUserJson(String name, String passwd) {
		OperatorWeb user = daoOperatorWeb.findByNumber(name);
		String result = "";
		if (user == null) {
			result = jsonRespProc.makeJsonResp(ConstantGen.LOGIN_NO_USER, "loginErrUser");
		} else {
			String resPass = user.getPassword();
			if (resPass.equals(passwd)) {
				result = jsonRespProc.makeJsonResp(ConstantGen.SUCCESS, "loginSuccess");
			} else {
				result = jsonRespProc.makeJsonResp(ConstantGen.LOGIN_ERR_PWD, "loginErrPasswd");
			}
		}
		return result;
	}

	public int judgeLoginUser(String name, String passwd) {
		OperatorWeb user = daoOperatorWeb.findByNumber(name);
		if (user == null) {
			logger.debug("please input the right user NAME!");
			return ConstantGen.LOGIN_NO_USER;
		} else {
			String resPass = user.getPassword();
			if (resPass.equals(passwd)) {
				logger.debug("recheck, sucessful login start direc to the home page.");
				return ConstantGen.SUCCESS;
			} else {
				logger.debug("please input the right use PASSWORD!");
				return ConstantGen.LOGIN_ERR_PWD;
			}
		}
	}
}
