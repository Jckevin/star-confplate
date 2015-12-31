package com.starunion.jee.confplate.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoOperatorWeb;
import com.starunion.jee.confplate.po.OperatorWeb;

@Service
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	DaoOperatorWeb daoOperatorWeb;
	public String judgeLoginUser(String name,String passwd){
		OperatorWeb user = daoOperatorWeb.findByNumber(name);
		if(user == null){
			logger.debug("please input the right user NAME!");
			return "errUser";
		}else{
			String resPass = user.getPassword();
			if(resPass.equals(passwd)){
				logger.debug("sucessful login start direc to the home page.");
				return "success";
			}else{
				logger.debug("please input the right use PASSWORD!");
				return "errPasswd";
			}
		}
	}
}
