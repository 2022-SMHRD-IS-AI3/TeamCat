package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class RepleDAO {

	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();

	// 리플 업로드
	public int RepleUpdate(RepleDTO dto) {
		System.out.println("dao");
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("RepleUpdate", dto);
		sqlsession.close();

		return cnt;
	}

}
