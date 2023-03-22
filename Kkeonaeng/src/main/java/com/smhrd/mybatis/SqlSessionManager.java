package com.smhrd.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	// SqlSessionFactory(sqlSession) : DB연동, 해제, sql 실행, 트랜잭션을 관리
	public static SqlSessionFactory sqlSessionFactory;

	static {
		String resource = "com/smhrd/mybatis/mybatis-config.xml";
		Reader reader;

		try {
			reader = Resources.getResourceAsReader(resource);
			// sqlSession = connection
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}