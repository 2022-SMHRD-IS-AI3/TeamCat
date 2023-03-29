package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class ReviewDAO {

	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();
	
	// 리뷰 업로드
	public int ReviewUpdate(ReviewDTO dto) {
		System.out.println("dao");
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("ReviewUpdate", dto);	
		sqlsession.close();
		 		
		return cnt;
	}
	
	// 리뷰 삭제
	public int ReviewDelete(ReviewDTO dto) {
		System.out.println(123);
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.delete("ReviewDelete", dto);
		sqlsession.close();
				
		return cnt;
	}
			
	// 리뷰 목록 조회
	public List<ReviewDTO> ReviewAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ReviewDTO> Review_list = sqlsession.selectList("ReviewAll");
		sqlsession.close();
				
		return Review_list;
	}
	
	// 나의 리뷰 목록
	public List<ReviewDTO> myReviewList(int user_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ReviewDTO> Review_list = sqlsession.selectList("myReviewList",user_idx);
		sqlsession.close();
		
		return Review_list;
	}
}
