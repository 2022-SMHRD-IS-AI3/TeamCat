package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class UserDAO {

	
private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
    // 회원가입
	public int join(UserDTO dto) {
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("join", dto);
		sqlsession.close();
		
		return cnt;
		
	}
	
	// 로그인
	public UserDTO login(UserDTO dto) {
		
		SqlSession sqlsession = sqlSessionFactory.openSession();
		UserDTO info = sqlsession.selectOne("login", dto);
		sqlsession.close();
		
		return info;
		
	}

	// 회원정보수정
	public int update(UserDTO dto) {
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.update("update", dto);
		
		return cnt;
	}
	
	// 회원삭제
	public int delete(String user_idx) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete",user_idx);
		sqlsession.close();
		
		return cnt;
	}
	
	// 회원정보 모두 가져오기 (관리자용 추후 사용)
	public List<UserDTO> selectAll() {
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		List<UserDTO> list = sqlsession.selectList("selectAll");
		sqlsession.close();
		return list;
	}
	
}