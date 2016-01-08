package com.starunion.jee.confplate.po;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class MenuNode {
	
	private String nodeName;
	private String nodeUrl;
	private String nodeView;
	private List<MenuNode> nodeList;
	
	public MenuNode(){
		
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getNodeUrl() {
		return nodeUrl;
	}

	public void setNodeUrl(String nodeUrl) {
		this.nodeUrl = nodeUrl;
	}

	public String getNodeView() {
		return nodeView;
	}

	public void setNodeView(String nodeView) {
		this.nodeView = nodeView;
	}

	public List<MenuNode> getNodeList() {
		return nodeList;
	}

	public void setNodeList(List<MenuNode> nodeList) {
		this.nodeList = nodeList;
	}

}
