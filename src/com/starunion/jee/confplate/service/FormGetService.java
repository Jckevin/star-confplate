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
import com.starunion.jee.confplate.po.GeneralElementParam;
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
	
	/**
	 * @desc this method used to genrate actived subForm jsp view object,but 
	 *       it seems the structure is much complex for jsp and jstl...
	 * @author Lingsong
	 * @deprecated 
	 * */
	public List<GeneralVo> getSubGenVoList(String node){
		List<GeneralVo> voList = new ArrayList<GeneralVo>();
//		Map<String, HashMap<String, String>> compView = new HashMap<String,HashMap<String,String>>();
		Map<String, ArrayList<GeneralElementParam>> compView = new HashMap<String,ArrayList<GeneralElementParam>>();
		
		List<GeneralSubConf> gcList = new ArrayList<GeneralSubConf>();
		logger.debug("general SUB VO conf get by sqlName param filter: {}",node);
		gcList = daoGenConf.getSubGenConf(node,"html_jsp_param");
		
		for(GeneralSubConf gc : gcList){
			GeneralVo vo = new GeneralVo();
			vo.setName(gc.getName());
			vo.setValue(gc.getValue());
			vo.setType(gc.getType());
			if(gc.getType().equals("radio")){
				ArrayList<GeneralElementParam> interval = new ArrayList<GeneralElementParam>();
				String[] fArray = gc.getValue().split("\\|");
				for(String s : fArray){
					GeneralElementParam ge = new GeneralElementParam();
					String[] sArray = s.split(":");
					ge.setName(sArray[0]);
					ge.setValue(sArray[1]);
					interval.add(ge);
				}
				compView.put(gc.getName(), interval);
				vo.setCompView(compView);
//				HashMap<String,String> interval = new HashMap<String,String>();
//				String[] fArray = gc.getValue().split("\\|");
//				for(String s : fArray){
//					String[] sArray = s.split(":");
//					interval.put(sArray[0],sArray[1]);
//				}
//				compView.put(gc.getName(), interval);
//				vo.setCompView(compView);
			}
			voList.add(vo);
		}
		return voList;
	}
	
}
