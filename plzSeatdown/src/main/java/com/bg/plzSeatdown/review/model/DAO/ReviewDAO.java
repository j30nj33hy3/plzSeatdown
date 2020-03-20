package com.bg.plzSeatdown.review.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.vo.Show;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 전체 공연장 수 조회용 DAO
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	public int getTheaterCount(String searchValue) throws Exception{
		return sqlSession.selectOne("reviewMapper.getTheaterCount", searchValue);
	}
	
	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Theater> selectTheaterList(String searchValue, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("reviewMapper.selectTheaterList", searchValue, rowBounds);
	}

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
	public List<Show> selectShowList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("reviewMapper.selectShowList", map, rowBounds);
	}

	/** 사이드 바에 출력할 공연 상세 정보 조회용 DAO
	 * @param selectShowCode
	 * @return show
	 */
	public Show selectShowDetail(String selectShowCode) {
		return sqlSession.selectOne("reviewMapper.selectShowDetail", selectShowCode);
	}

	

	

	

	

}
