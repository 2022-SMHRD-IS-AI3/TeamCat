package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class RentDAO {

	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();

	// 대여시작(대여자)
	public int rentStart(int rv_idx) {

		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("rentStart", rv_idx);
		sqlsession.close();

		return cnt;
	}

	// 대여시작(예약자)
	public int rentStartStatus(int p_idx) {

		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.update("rentStartStatus", p_idx);
		sqlsession.close();

		return cnt;
	}

	// 반납완료(예약자)
	public int rentReturn(int p_idx) {

		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.update("rentReturn", p_idx);
		sqlsession.close();

		return cnt;
	}

	// 반납완료(대여자)
	public int rentReturnFinish(int p_idx) {

		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.update("rentReturnFinish", p_idx);
		sqlsession.close();

		return cnt;
	}

	// 대여상태정보보기
	public RentDTO rentStatuesInfo(RentDTO dto) {

		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		RentDTO rent_list = sqlsession.selectOne("rentStatuesInfo", dto);
		sqlsession.close();

		return rent_list;
	}
}
