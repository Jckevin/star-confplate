package com.starunion.jee.confplate.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.starunion.jee.confplate.service.TableGetService;
import com.starunion.jee.confplate.service.utils.HttpSessionProc;

@Controller
public class TableController {
	private static final Logger logger = LoggerFactory.getLogger(TableController.class);

	@Autowired
	TableGetService tableGetServ;
	@Autowired
	HttpSessionProc httpSessionProc;
	
	@RequestMapping(value = "/baseTableAction", method = { RequestMethod.GET })
	public String baseForm(Model model, @RequestParam("menu") String menu, @RequestParam("node") String node,
			HttpServletRequest request) {
		logger.debug("baseTableAction: was i needn't change anymore?");
		model.addAttribute("node", node);
		model.addAttribute("menu", menu);
		model.addAttribute("funcList",tableGetServ.getTableFuncList(node));
		model.addAttribute("thList",tableGetServ.getTableThList(node));
		String lang = httpSessionProc.getSessionAttr(request,"langSet");
		model.addAttribute("tbList",tableGetServ.getTableBodyList(node,lang));
		return "basetable";
	}

}
