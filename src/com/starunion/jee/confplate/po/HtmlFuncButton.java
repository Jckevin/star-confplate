package com.starunion.jee.confplate.po;

import org.springframework.stereotype.Repository;

@Repository
/**
 * @deprecated aha,this annotation is unvalid for class
 * @author Lings
 * @describe a not bad idea for dynamic table function button
 *           but it seems to complex for this,and many other questions
 *           may think this more carefully in the feature.
 *  
 * */
public class HtmlFuncButton {
	private Integer id;
	private Integer status;
	private String menuName;
	private String name;
	private String action;
	private String pic;
	
	public HtmlFuncButton(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
}
