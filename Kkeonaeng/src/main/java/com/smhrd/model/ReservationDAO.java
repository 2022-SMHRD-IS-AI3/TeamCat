package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class ReservationDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 예약 등록
	public int reservation(ReservationDTO dto) {

		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("reservation", dto);
		sqlsession.close();

		return cnt;

	}
	
	// 예약 목록
	public List<ProductDTO> reservationList(int user_idx) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<ProductDTO> Product_list = sqlsession.selectList("reservationList",user_idx);
		sqlsession.close();
			
		return Product_list;
	}
}
