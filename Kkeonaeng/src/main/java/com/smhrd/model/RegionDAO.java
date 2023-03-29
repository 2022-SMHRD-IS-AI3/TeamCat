package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class RegionDAO {
	
	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();

	// 행정구역 정보 가져오기
	public List<RegionDTO> regionAll() {
		System.out.println("dao");
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<RegionDTO> region_list = sqlsession.selectList("regionAll");
		sqlsession.close();

		return region_list;
	}
}
