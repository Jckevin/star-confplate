package com.starunion.jee.confplate.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.starunion.jee.confplate.dao.DaoGeneralConf;
import com.starunion.jee.confplate.dao.DaoUserSip;
import com.starunion.jee.confplate.po.UserSip;
import com.starunion.jee.confplate.service.utils.ActI18nStrProc;
import com.starunion.jee.confplate.service.utils.HttpSessionProc;
import com.starunion.jee.confplate.service.utils.JsonRespProc;

@Service
public class FormSubmitService {
	private static final Logger logger = LoggerFactory.getLogger(FormSubmitService.class);
	@Autowired
	DaoGeneralConf daoGenConf;
	@Autowired
	DaoUserSip daoUserSip;
	@Autowired
	JsonRespProc jsonRespProc;
	@Autowired
	ActI18nStrProc i18nStrProc;
	
	public final static String USER_EXISTED = "sipUserExist";
	public final static String DB_INSERT_FAIL = "dbInsertFail";
	
	/**
	 * @author Lings
	 * @date 2016.01.19
	 * @describe this method need a transaction management.
	 *           for database operate is a group of insert.
	 *           temply,think this method is always successful.
	 * */
	public int submitGenVoList(String sqlName,HashMap<String,String> map){
		int result = 0;
		logger.debug("invoke submit General Vo List ! here is important ,need change to a transaction!");
		for (Entry<String, String> entry : map.entrySet()) {
			daoGenConf.updateGenConf(sqlName, entry.getKey(), entry.getValue());
		}
		
		return result;
	}
	
	public String submitUserInfo(String sqlName,HashMap<String,String> recvMap,String lang){

		logger.debug("sigle for submit user Info .");
		
		String result = "";
		
		String number = recvMap.get("terNum");
		String passMode = recvMap.get("passRd");
		String password = "";
		if(passMode.equals("1")){
			password = recvMap.get("terPass");
		}else{
			password = number;
		}
		String terName = recvMap.get("terName");
		String terDep = recvMap.get("terDepartment");
		String terPri = recvMap.get("terPri");
		String terType = recvMap.get("terType");
		String terRd = recvMap.get("recRd");

		if(checkUserExist(number)){
			result = jsonRespProc.makeJsonResp("-1",i18nStrProc.getI18nStr(USER_EXISTED, lang));
		}else{
			int res = daoUserSip.insertSipUser(number,password,terName,terDep,terPri,terType,terRd);
			if(res == 1){
				result = jsonRespProc.makeJsonResp("0","");
			}else{
				result = jsonRespProc.makeJsonResp("-2",i18nStrProc.getI18nStr(DB_INSERT_FAIL, lang));
			}
		}
		
		return result;
	}
	/**batch insert PO service*/
	public String submitUserList(String sqlName,HashMap<String,String> revMap,String lang){

		logger.debug(" for submit user list .");
		String result= "";
		String num = revMap.get("terNum");
		String passMode = revMap.get("passRd");
		String password = "";
		if(passMode.equals("1")){
			password = revMap.get("terPass");
		}
//		String terName = revMap.get("terName");
		String terDep = revMap.get("terDepartment");
		String count = revMap.get("terMount");
		String terPri = revMap.get("terPri");
		String terType = revMap.get("terType");
		String terRd = revMap.get("recRd");
		
		int len = num.length();
		int bnum = 0;
		String headPart = "";
		/** here 8 is not strict enough */
		int STR_COVT_LEN_MAX = 8;
		if (len < STR_COVT_LEN_MAX) {
			bnum = Integer.parseInt(num);
		} else {
			// :TODO split the two long String,change the last 3 or 4 bits.
			headPart = num.substring(0,len-4);
			logger.debug("headPart : {}",headPart);
			bnum = Integer.parseInt(num.substring(len-4,len));
			logger.debug("rest part : {}",headPart);
		}
		int times = Integer.parseInt(count);
		logger.debug("times = " + times);
		Object[][] infoArry = new Object[times][6];
		for (int i = 0; i < times; i++) {
			if(len < STR_COVT_LEN_MAX){
				infoArry[i][0] = String.valueOf(bnum);	
			}else{
				infoArry[i][0] = headPart + String.valueOf(bnum);
			}
			/** this logic used to check weather the batch operation should go on */
			if(checkUserExist((String) infoArry[i][0])){
				result = jsonRespProc.makeJsonResp("-1",i18nStrProc.getI18nStr(USER_EXISTED, lang));
				return result;
			}
			
			if (passMode.equals("0")) {
				if(len < STR_COVT_LEN_MAX){
					infoArry[i][1] = String.valueOf(bnum);	
				}else{
					infoArry[i][1] = headPart + String.valueOf(bnum);
				}
			} else {
				infoArry[i][1] = password;
			}
			infoArry[i][2] = terDep;
			infoArry[i][3] = terPri;
			infoArry[i][4] = terType;
			infoArry[i][5] = terRd;
			bnum++;
		}
		
		int res = daoUserSip.batchInsertSipUser(infoArry);
		if(res == 0){
			result = jsonRespProc.makeJsonResp("0","");
		}else{
			result = jsonRespProc.makeJsonResp("-2",i18nStrProc.getI18nStr(DB_INSERT_FAIL, lang));
		}
		return result;
	}
	
	private boolean checkUserExist(String number){
		
		UserSip us = daoUserSip.findByNumber(number);
		if(us != null){
			return true;
		}else{
			return false;
		}
	}
	
}
