package com.bg.plzSeatdown.review.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.vo.Show;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 공연 수 조회용 DAO
	 * @param map
	 * @return showCount
	 * @throws Exception
	 */
	public int getShowCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("reviewMapper.getShowCount", map);
	}

	/** 공연 목록 조회용 DAO
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Show> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("reviewMapper.selectList", map, rowBounds);
	}

	/** 사이드 바에 출력할 공연 상세 정보 조회용 DAO
	 * @param selectShowCode
	 * @return show
	 */
	public Show selectShowDetail(String selectShowCode) {
		return sqlSession.selectOne("reviewMapper.selectShowDetail", selectShowCode);
	}

	

	

}
