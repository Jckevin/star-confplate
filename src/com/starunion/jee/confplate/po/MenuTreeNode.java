package com.starunion.jee.confplate.po;

import java.util.List;

public class MenuTreeNode {
	private Integer treeNodeId;
	private String treeNodeName;
	private String treeNodeUrl;
	private String treeNodePic;
	private List<HtmlMenu> subNodeList;
	
	public MenuTreeNode(){
		
	}

	public Integer getTreeNodeId() {
		return treeNodeId;
	}

	public void setTreeNodeId(Integer treeNodeId) {
		this.treeNodeId = treeNodeId;
	}

	public String getTreeNodeName() {
		return treeNodeName;
	}

	public void setTreeNodeName(String treeNodeName) {
		this.treeNodeName = treeNodeName;
	}

	public String getTreeNodeUrl() {
		return treeNodeUrl;
	}

	public void setTreeNodeUrl(String treeNodeUrl) {
		this.treeNodeUrl = treeNodeUrl;
	}

	public List<HtmlMenu> getSubNodeList() {
		return subNodeList;
	}

	public void setSubNodeList(List<HtmlMenu> subNodeList) {
		this.subNodeList = subNodeList;
	}

	public String getTreeNodePic() {
		return treeNodePic;
	}

	public void setTreeNodePic(String treeNodePic) {
		this.treeNodePic = treeNodePic;
	}
	
}
