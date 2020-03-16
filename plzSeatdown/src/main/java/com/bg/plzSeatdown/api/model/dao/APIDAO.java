package com.bg.plzSeatdown.api.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.api.model.vo.Theater;

@Repository("apiDAO")
public class APIDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 현재 저장된 공연장 개수 조회
	 * @return count
	 * @throws Exception
	 */
	public int getTheaterCount() throws Exception{
		return sqlSession.selectOne("apiMapper.getTheaterCount");
	}
	
	/** URL 요청으로 반환된 공연시설 상세 정보 리스트 삽입용 DAO
	 * @param theater
	 * @return result
	 * @throws Exception
	 */
	public int insertTheater(Theater theater) throws Exception{
		return sqlSession.insert("apiMapper.insertTheater", theater);
	}
	
	/** URL 요청으로 반환된 공연시설 상세 정보 리스트 업데이트용 DAO
	 * @param theater
	 * @return result
	 * @throws Exception
	 */
	public int updateTheater(Theater theater) throws Exception{
		return sqlSession.update("apiMapper.updateTheater", theater);
	}

	/** 공연 코드 목록을 추출하기 위한 prfplccd 조회용 DAO
	 * @return prfList
	 * @throws Exception
	 */
	public List<String> selectprfList() throws Exception{
		return sqlSession.selectList("apiMapper.selectprfList");
	}

//	public int insertThShowCode(Show show) throws Exception{
//		return sqlSession.insert("apiMapper.insertThShowCode", show);
//	}

	/** 현재 저장된 공연 수 조회
	 * @return count
	 * @throws Exception
	 */
	public int getShowCount() throws Exception{
		return sqlSession.selectOne("apiMapper.getShowCount");
	}
	
	/** 공연 상세 정보 삽입용 DAO
	 * @param show
	 * @return result
	 * @throws Exception
	 */
	public int insertShow(Show show) throws Exception{
		return sqlSession.insert("apiMapper.insertShow", show);
	}

	/** 공연 상세 정보 업데이트용 DAO
	 * @param show
	 * @return result
	 * @throws Exception
	 */
	public int updateShow(Show show) throws Exception{
		return sqlSession.update("apiMapper.updateShow", show);
	}

	

	

}
