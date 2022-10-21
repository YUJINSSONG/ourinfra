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
	
	public int insertELCTMST(Map<String, String> map) {
		return homeMapper.insertELCTMST(map);
	}
	
	public int updateELCTMST(Map<String, String> map) {
		return homeMapper.updateELCTMST(map);
	}
}
