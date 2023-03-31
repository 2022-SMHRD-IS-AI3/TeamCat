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
		if (cnt > 0) {
			chk = sqlsession.selectOne("ProductUploadIndex");
		}
		sqlsession.close();

		return chk;
	}

	// 게시글 목록 조회
	public List<ProductDTO> ProductAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> Product_list = sqlsession.selectList("ProductAll");
		sqlsession.close();

		return Product_list;
	}

	// 게시글 세부내용 조회
	public ProductDTO ProductDetail(int p_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		ProductDTO productDetail = sqlsession.selectOne("ProductDetail", p_idx);
		return productDetail;
	}

	// 게시글 수정
	public int ProductUpdate(ProductDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.update("ProductUpdate", dto);
		sqlsession.close();

		return cnt;
	}

	// 게시글 삭제
	public int ProductDelete(int p_idx) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.update("ProductDelete", p_idx);
		sqlsession.close();

		return cnt;
	}

	// 게시물 검색
	public List<ProductDTO> ProductSearch(String search) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> search_list = sqlsession.selectList("ProductSearch", search);
		sqlsession.close();

		return search_list;
	}

	// 게시물 정보 취합(Admin)
	public List<ProductDTO> ProductSum() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> ProductSum = sqlsession.selectList("ProductSum");
		return ProductSum;
	}

	// 메인용 찜 순위 3개
	public List<ProductDTO> ProductWishRank() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> product_list = sqlsession.selectList("ProductWishRank");
		sqlsession.close();

		return product_list;
	}

	// 메인용 최근순위 3개
	public List<ProductDTO> ProductNewAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> product_list = sqlsession.selectList("ProductNewAll");
		sqlsession.close();

		return product_list;
	}

	// 게시글 상태변경
	public int ProductFlagChange(FileDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		int cnt = sqlsession.update("ProductFlagChange", dto);
		sqlsession.close();

		return cnt;
	}

	// 대여 목록 보기
	public List<ProductDTO> ProductList() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<ProductDTO> Product_list = sqlsession.selectList("ProductList");
		sqlsession.close();

		return Product_list;
	}
}
