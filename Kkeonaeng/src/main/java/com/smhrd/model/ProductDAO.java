package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class ProductDAO {
	
	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();
	
	// 파일 업로드
	public int ProductUpload(ProductDTO dto) {
		System.out.println("dao");
		System.out.println(dto.toString());
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.insert("ProductUpload", dto);
		int chk = 0;
		if(cnt > 0) {
			chk = sqlsession.selectOne("ProductUploadIndex");
		}
		sqlsession.close();
		
		return chk;
	}
	
	// 게시글 목록 조회
	// select * from web_Product
	public List<ProductDTO> ProductAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> Product_list = sqlsession.selectList("ProductAll");
		sqlsession.close();
		
		return Product_list;
	}
	
	// 게시글 세부내용 조회
	public ProductDTO ProductDetail(int b_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		ProductDTO Product = sqlsession.selectOne("ProductDetail", b_idx);
		
		return Product;
	}
	
	// 게시글 삭제
	public int delete(String b_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.delete("delete", b_idx);
		sqlsession.close();
		
		return 0;
	}
}
