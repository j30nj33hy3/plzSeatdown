package com.bg.plzSeatdown.review.model.DAO;

import java.sql.Date;
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
	
	/** 좌석 후기에서 공연장 상세 정보 조회용 DAO
	 * @param thCode
	 * @return theater
	 * @throws Exception
	 */
	public Theater selectTheaterDetail(String thCode) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectTheaterDetail", thCode);
	}

	/** 해당 공연장에서 현재 상영중인 공연 정보 조회용 DAO
	 * @param thCode
	 * @return nowShow
	 * @throws Exception
	 */
	public Show selectNowShow(String thCode) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectNowShow", thCode);
	}

	/** 공연장 목록 조회용 DAO
	 * @return tList
	 * @throws Exception
	 */
	public List<Theater> selectTList() throws Exception{
		return sqlSession.selectList("reviewMapper.selectTList");
	}

	/** 공연장 코드 조회용 DAO
	 * @param thName
	 * @return thCode
	 * @throws Exception
	 */
	public String selectTheaterCode(String thName) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectTheaterCode", thName);
	}

	/** 공연 목록 조회용 DAO
	 * @param show
	 * @return sList
	 * @throws Exception
	 */
	public List<Show> selectSList(Show show) throws Exception{
		return sqlSession.selectList("reviewMapper.selectSList", show);
	}

	/** 층 목록 조회용 DAO
	 * @param thCode
	 * @return fList
	 */
	public List<String> selectFList(String thCode) {
		return sqlSession.selectList("reviewMapper.selectFList", thCode);
	}


	

	

	

	

}
