package com.starunion.jee.confplate.po;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class GeneralVo {

	private String name;
	private String value;
	private String type;
	private Map<String, HashMap<String, String>> compView = new HashMap<String,HashMap<String,String>>();
	
	public GeneralVo(){
		
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Map<String, HashMap<String, String>> getCompView() {
		return compView;
	}
	public void setCompView(Map<String, HashMap<String, String>> compView) {
		this.compView = compView;
	}
}
