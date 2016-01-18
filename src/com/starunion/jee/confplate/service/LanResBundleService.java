package com.starunion.jee.confplate.service;

import java.util.Locale;
import java.util.ResourceBundle;

import org.springframework.stereotype.Service;

@Service
public class LanResBundleService {
	public static ResourceBundle resBundle = null;
	
	public LanResBundleService(){
		
	}
	
	public void initResBundle(String lan){
		Locale locale = Locale.CHINA;
		String baseName = "com.starunion.jee.confplate.resi18n.starResBundle";
		if(lan.equals("zh_CN")){
			locale = Locale.CHINA;
		}else if(lan.equals("en_US")){
			locale = Locale.US;
		}
		resBundle = ResourceBundle.getBundle(baseName,locale);
	}
	
}
