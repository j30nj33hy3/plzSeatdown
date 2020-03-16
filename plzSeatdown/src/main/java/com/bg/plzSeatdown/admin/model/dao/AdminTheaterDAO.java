package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Repository
public class AdminTheaterDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 공연시설장 수 조회용 DAO
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	public int getTheaterCount(String searchValue) throws Exception {
		return sqlSession.selectOne("adminTheaterMapper.getTheaterCount", searchValue);
	}

	/** 공연시설장 목록 조회용 DAO
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Theater> selectList(String searchValue, PageInfo pInf) throws Exception{
		
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminTheaterMapper.selectList", searchValue, rowBounds);
	}

}
