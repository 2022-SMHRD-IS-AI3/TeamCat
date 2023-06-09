package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class WishlistDAO {

	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();

	// 위시리스트 업로드
	public int WishlistUpdate(WishlistDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("WishlistUpdate", dto);
		sqlsession.close();

		return cnt;
	}

	// 위시리스트 삭제
	public int WishlistDelete(WishlistDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.delete("WishlistDelete", dto);
		sqlsession.close();

		return cnt;
	}

	// 마이 위시 목록 조회
	public List<ProductDTO> myWishlist(int user_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> Wishlist_list = sqlsession.selectList("myWishlist",user_idx);
		sqlsession.close();
		
		return Wishlist_list;
	}
	
	// 위시 목록 조회
	public List<WishlistDTO> WishlistAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<WishlistDTO> Wishlist_list = sqlsession.selectList("WishlistAll");
		sqlsession.close();

		return Wishlist_list;
	}

	// 개인 관심 하트 유무
	public int WishlistCheck(WishlistDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.selectOne("WishlistCheck", dto);
		sqlsession.close();

		return cnt;
	}

	
	public int WishlistCheckCount(int p_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.selectOne("WishlistCheckCount", p_idx);
		sqlsession.close();
		
		return cnt;
	}
	
	
	
}
