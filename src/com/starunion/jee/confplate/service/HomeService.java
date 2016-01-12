package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoHtmlMenu;
import com.starunion.jee.confplate.po.HtmlMenu;
import com.starunion.jee.confplate.po.MenuTreeNode;

@Service
public class HomeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);

	private final int NODE_LEVE_ONE = 1;
	private final int NODE_LEVE_TWO = 2;
	@Autowired
	DaoHtmlMenu daoHtmlMenu;

	public HomeService() {

	}

	public List<MenuTreeNode> getMenuTreeList() {
		List<MenuTreeNode> treeNodeList = new ArrayList<MenuTreeNode>();

		List<HtmlMenu> menuLev1 = new ArrayList<HtmlMenu>();
		menuLev1 = daoHtmlMenu.findByLevel(NODE_LEVE_ONE);
		for (HtmlMenu hm : menuLev1) {
			MenuTreeNode treeNode = new MenuTreeNode();
			treeNode.setTreeNodeId(hm.getId());
			treeNode.setTreeNodeName(hm.getName());
			treeNode.setTreeNodeUrl(hm.getAction());
			treeNode.setTreeNodePic(hm.getPic());
			treeNode.setSubNodeList(daoHtmlMenu.findByFid(NODE_LEVE_TWO, hm.getId()));
			treeNodeList.add(treeNode);
		}

		return treeNodeList;
	}

}
