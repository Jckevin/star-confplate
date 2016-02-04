package com.starunion.jee.confplate.po;

import org.springframework.stereotype.Repository;

@Repository
public class Html18Mapping {
	
	private Integer id;
	private String name;
	private String lang;
	private String value;
	
	public Html18Mapping(){
		
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

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
