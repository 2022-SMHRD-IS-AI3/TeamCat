package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class WishlistDAO {
	
	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();

	// 위시리스트 업로드
	public int WishlistUpdate(WishlistDTO dto) {
		System.out.println("dao");
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("WishlistUpdate", dto);	
		sqlsession.close();
		 		
		return cnt;
	}
		
	// 위시리스트 삭제
	public int WishlistDelete(WishlistDTO dto) {
		System.out.println(123);
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.delete("WishlistDelete", dto);
		sqlsession.close();
			
		return cnt;
	}
		
	// 게시글 목록 조회
	public List<WishlistDTO> WishlistAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<WishlistDTO> Wishlist_list = sqlsession.selectList("WishlistAll");
		sqlsession.close();
			
		return Wishlist_list;
	}
}
