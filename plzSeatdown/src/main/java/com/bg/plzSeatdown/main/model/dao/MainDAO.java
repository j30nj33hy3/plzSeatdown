package com.bg.plzSeatdown.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.review.model.vo.Show;

@Repository
public class MainDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Show> selectShowing() throws Exception{
		return sqlSession.selectList("mainMapper.selectShowing");
	}

	public List<Show> comingShowing() throws Exception{
		return sqlSession.selectList("mainMapper.comingShowing");
	}

}
