package com.ourinfra.web.portal;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PowerDAO {

	private String GBN = "com.ourinfra.web.portal.PowerDAO";
	@Autowired
	private SqlSession sqlSession;
	
	public List<PowerVO> powerList(PowerVO vo) {
		return sqlSession.selectList(GBN + ".getReqWorkList", vo);
	}
	
}
