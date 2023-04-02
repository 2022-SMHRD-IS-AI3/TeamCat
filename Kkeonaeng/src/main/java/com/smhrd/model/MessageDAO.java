package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class MessageDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 메시지 전송
	public int MessageSend(MessageDTO dto) {
		System.out.println("dto");
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("MessageSend", dto);
		sqlsession.close();
		return cnt;

	}

	// 나에게 메시지 보낸 사람 확인
	public List<MessageDTO> myMessageList(int user_idx) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<MessageDTO> myMessageList = sqlsession.selectList("myMessageList", user_idx);
		sqlsession.close();
		return myMessageList;

	}
	
	
	// 나에게 메시지 보낸 사람 확인
	public List<MessageDTO> myMessageListNew(MessageDTO dto) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<MessageDTO> myMessageList = sqlsession.selectList("myMessageListNew", dto);
		sqlsession.close();
		return myMessageList;
		
	}
	
	

	// 나에게온 메시지 전체삭제
	public int messageDeleteAll(int user_idx) {

		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("messageDeleteAll", user_idx);
		sqlsession.close();
		return cnt;

	}

	// 메시지 삭제
	public int messageDelete(int num) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int cnt = sqlsession.insert("messageDelete", num);
		sqlsession.close();
		return cnt;

	}
}