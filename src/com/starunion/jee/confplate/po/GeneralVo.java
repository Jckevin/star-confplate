package com.starunion.jee.confplate.po;

import org.springframework.stereotype.Repository;

@Repository
public class GeneralVo {

	private String name;
	private String value;
	
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
}
