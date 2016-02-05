package com.starunion.jee.confplate.service.utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Component
public class JsonRespProc {
	
	public String makeJsonResp(String statusCode,String statusVal){
		String jsonRes = "";
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> respMap = new HashMap<String, Object>();
		respMap.put("result", statusCode);
		respMap.put("value", statusVal);

		try {
			jsonRes = mapper.writeValueAsString(respMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonRes;
	}
	
}
