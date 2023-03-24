package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class BoardDAO {
	
	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();
	
	// 파일 업로드
	public int upload(BoardDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("upload", dto);
		sqlsession.close();
		
		return cnt;
	}
	
	// 게시글 목록 조회
	// select * from web_board
	public List<BoardDTO> bordAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<BoardDTO> board_list = sqlsession.selectList("boardAll");
		sqlsession.close();
		
		return board_list;
	}
	
	// 게시글 세부내용 조회
	public BoardDTO boardDetail(int b_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		BoardDTO board = sqlsession.selectOne("boardDetail", b_idx);
		
		return board;
	}
	
	// 게시글 삭제
	public int delete(String b_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.delete("delete", b_idx);
		sqlsession.close();
		
		return 0;
	}
}
