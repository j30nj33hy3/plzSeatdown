package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Repository
public class AdminShowDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 공연 수 조회용 DAO
	 * @param searchValue
	 * @return showCount
	 * @throws Exception
	 */
	public int getShowCount(String searchValue) throws Exception{
		return sqlSession.selectOne("adminShowMapper.getShowCount", searchValue);
	}

	public List<Show> selectList(String searchValue, PageInfo pInf) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminShowMapper.selectList", searchValue, rowBounds);
	}
}
