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
		
		int chk = sqlsession.selectOne("joinUserCheck", dto);
		int cnt = 0;
		if(chk == 0) {
			cnt = sqlsession.insert("join", dto);
		}
		
		sqlsession.close();
		
		return cnt;
		
	}
	
	// 로그인
	public UserDTO login(String kakao_id) {
		
		SqlSession sqlsession = sqlSessionFactory.openSession();
		UserDTO info = sqlsession.selectOne("login", kakao_id);
		sqlsession.close();
		
		return info;
		
	}
	
	// 회원정보
	public UserDTO userInfo(int user_idx) {
		
		SqlSession sqlsession = sqlSessionFactory.openSession();
		UserDTO info = sqlsession.selectOne("userInfo", user_idx);
		sqlsession.close();
		
		return info;
		
	}
	

	// 회원정보수정
	public int update(UserDTO dto) {
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int chk = sqlsession.selectOne("nickCheck", dto);
		
		int cnt = 0;
		if(chk == 0) {
			cnt = sqlsession.update("update", dto);
		}
		sqlsession.close();
		
		return cnt;
	}
	
	// 회원삭제
	public int delete(int user_idx) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.delete("delete",user_idx);
		sqlsession.close();
		
		return cnt;
	}
	
	// 회원정보 모두 가져오기 (Admin)
	public List<AdminUserDTO> userAll() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<AdminUserDTO> list = sqlsession.selectList("userAll");
		sqlsession.close();
		return list;
	}
	
	// 유저 복구 하기 (Admin)
	public int recovery(int user_idx) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.update("recovery",user_idx);
		sqlsession.close();
		
		return cnt;
	}
	
}
