package com.my.databases;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDAOService implements IndexDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Index> getIndexVal() {
	
		ArrayList<Index> result = new ArrayList<Index>();
		IndexMapper indexMapper = sqlSession.getMapper(IndexMapper.class);
		result = indexMapper.getIndexVal();
		
		return result;
		
	}

}
