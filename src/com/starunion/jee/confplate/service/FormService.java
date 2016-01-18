package com.starunion.jee.confplate.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starunion.jee.confplate.dao.DaoGeneralConf;
import com.starunion.jee.confplate.po.GeneralConf;
import com.starunion.jee.confplate.po.GeneralVo;

@Service
public class FormService {
	
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
	
	public List<GeneralVo> getNetworkList(){
		List<GeneralVo> voList = new ArrayList<GeneralVo>();
		List<GeneralConf> gcList = new ArrayList<GeneralConf>();
		gcList = daoGenConf.getNetworkConf();
		for(GeneralConf gc : gcList){
			GeneralVo vo = new GeneralVo();
			vo.setName(gc.getName());
			vo.setValue(gc.getValue());
			voList.add(vo);
		}
		return voList;
	}
	
}
