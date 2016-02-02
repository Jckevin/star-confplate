package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoGeneralConf;
import com.starunion.jee.confplate.po.GeneralConf;
import com.starunion.jee.confplate.po.GeneralSubConf;
import com.starunion.jee.confplate.po.GeneralVo;

@Service
public class FormGetService {
	private static final Logger logger = LoggerFactory.getLogger(FormGetService.class);
	@Autowired
	DaoGeneralConf daoGenConf;
	
	public Map<String, String> getNetworkParam(){
		Map<String, String> insideMap = new HashMap<String, String>();
		List<GeneralConf> gcList = new ArrayList<GeneralConf>();
		gcList = daoGenConf.getNetworkConf();
		for(GeneralConf gc : gcList){
			insideMap.put(LanResBundleService.resBundle.getString(gc.getName()), gc.getValue());
		}
		return insideMap;
	}
	
	public List<GeneralVo> getGenVoList(String node){
		List<GeneralVo> voList = new ArrayList<GeneralVo>();
		List<GeneralConf> gcList = new ArrayList<GeneralConf>();
		if(node.equals("ipv4")){
			gcList = daoGenConf.getGenConf("conf_network");
		}else{
			logger.debug("general VO conf get by sqlName : {}",node);
			gcList = daoGenConf.getGenConf(node);
		}
		
		for(GeneralConf gc : gcList){
			GeneralVo vo = new GeneralVo();
			vo.setName(gc.getName());
			vo.setValue(gc.getValue());
			voList.add(vo);
		}
		return voList;
	}
	
	public List<GeneralVo> getSubGenVoList(String node,String table){
		List<GeneralVo> voList = new ArrayList<GeneralVo>();
		List<GeneralSubConf> gcList = new ArrayList<GeneralSubConf>();
		logger.debug("general SUB VO conf get by sqlName : {}",table);
		gcList = daoGenConf.getSubGenConf(node,table);
		
		for(GeneralSubConf gc : gcList){
			GeneralVo vo = new GeneralVo();
			vo.setName(gc.getName());
			vo.setValue(gc.getValue());
			vo.setType(gc.getType());
			if(gc.getType().equals("radio")){
				Map<String, HashMap<String, String>> compView = new HashMap<String,HashMap<String,String>>();
				HashMap<String,String> interval = new HashMap<String,String>();
				String[] fArray = gc.getValue().split("\\|");
				for(String s : fArray){
					String[] sArray = s.split(":");
					interval.put(sArray[0],sArray[1]);
				}
				compView.put(gc.getName(), interval);
				vo.setCompView(compView);
			}
			voList.add(vo);
		}
		return voList;
	}
	
}
