package com.honeyjam.board.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {
	
	private static SqlSessionFactoryManager instance;
	private SqlSessionFactory factory;
	private SqlSessionFactoryManager() throws IOException {
		InputStream is = Resources.getResourceAsStream("paging/config/mybatis-config.xml");
		factory = new SqlSessionFactoryBuilder().build(is);
				
	}

	public static SqlSessionFactoryManager getInstance() throws IOException {
		if(instance == null) instance = new SqlSessionFactoryManager();
		return instance;
	}
	public SqlSessionFactory getSqlSessionFactory(){
		return factory;
	}
}
