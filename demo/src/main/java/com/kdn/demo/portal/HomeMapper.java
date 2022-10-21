package com.kdn.demo.portal;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface HomeMapper {
	
	List<Map<String, Object>> selectELCTMST();
	int insertELCTMST(Map<String, String> map);
	int updateELCTMST(Map<String, String> map);
}

