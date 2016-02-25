package com.starunion.jee.confplate.service.utils;
/** 
* @author Lings  
* @date Feb 25, 2016 10:56:55 AM 
* 
*/
public class ConstantGen {
	
	//for whole class
	public final static int SUCCESS = 0;
	public final static int FAILED = -1;
		
	//for mysql operate result code [dbutils] 
	public final static int DB_SUCCESS = 1;
	public final static int DB_FAIL_INSERT = -101;
	public final static int DB_FAIL_BATCH_INSERT = -102;

	//for json result code
	public final static int LOGIN_NO_USER = -1;
	public final static int LOGIN_ERR_PWD = -2;
	public final static int NUMBER_EXISTED = -3;
	
	
	//for user add function
	public final static int TERTYPE_DIS = 0;
	public final static int TERTYPE_BRO = 1;
	public final static String PWD_SAME_NAME = "0";
	public final static String PWD_STATIC_STR = "1";
	
	
	
}
