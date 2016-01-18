package com.starunion.jee.confplate.po;

import org.springframework.stereotype.Repository;

@Repository
public class GeneralConf {
	private Integer id;
	private String name;
	private String value;
	private Integer status;
	private String type;
	
	public GeneralConf(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
