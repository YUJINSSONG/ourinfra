package com.kdn.demo.portal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;

	@RequestMapping(value={"/", "/elctView"})
	public String list(ModelMap map) {		
		return "elctView";
	}
	
	@RequestMapping(value="/elctList")
	@ResponseBody
	public Map<String, Object> getElctList() {
		List<Map<String, Object>> elctList = service.selectELCTMST();
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		rtnMap.put("data", elctList);
		return rtnMap;
	}
	
	@RequestMapping(value="/elctDelete")
	@ResponseBody 
	public int setElctDelete(@RequestParam() int elctId){
		return service.deleteELCTMST(elctId);
	}
	
	
	
	
	
	@RequestMapping(value="/monthUsage")
	public String monthUsageList() {
		return "monthUsageView";
	}
	
	@RequestMapping(value="/monthUsageList")
	@ResponseBody
	public Map<String, Object> getMonthUsageList() {
		List<Map<String, Object>> elctList = service.selectMonthUsage();
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		rtnMap.put("data", elctList);
		return rtnMap;
	}

	
}
