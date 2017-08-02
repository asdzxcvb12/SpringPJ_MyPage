package com.my.databases;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseBoardDAOService implements BaseBoardDAO{

	@Autowired SqlSession sqlSession;
	
	@Override
	public ArrayList<BaseBoard> getBaseBoardVal(String table_name) {
		// TODO Auto-generated method stub
		ArrayList<BaseBoard> result = new ArrayList<BaseBoard>();
		BaseBoardMapper baseBoardMapper = sqlSession.getMapper(BaseBoardMapper.class);
		result = baseBoardMapper.getBaseBoardVal(table_name);
		System.out.println("Done~!!");
		return result;
	}

}
