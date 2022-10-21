package com.kdn.demo.portal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {
	
	@Autowired
	private HomeMapper homeMapper;
	
	public List<Map<String, Object>> selectELCTMST() {
		return homeMapper.selectELCTMST();
	}
	
	public int deleteELCTMST(int elctId) {
		return homeMapper.deleteELCTMST(elctId);
	}
	
	public int insertELCTMST(Map<String, String> map) {
		return homeMapper.insertELCTMST(map);
	}
	
	
	
	
	public List<Map<String, Object>> selectMonthUsage() {
		return homeMapper.selectMonthUsage();
	}
	
}
