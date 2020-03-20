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
	
	/** 현재 저장된 공연시설장 개수 조회용 DAO
	 * @param theater
	 * @return count
	 */
	public int getTheaterCount(Theater theater) {
		return sqlSession.selectOne("apiMapper.getTheaterCount", theater);
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

	/** 공연 코드 목록을 추출하기 위한 공연장 코드 조회용 DAO
	 * @return theaterCodeList
	 * @throws Exception
	 */
	public List<String> getTheaterCodeList() throws Exception{
		return sqlSession.selectList("apiMapper.getTheaterCodeList");
	}
	
	/** 기존 공연 정보 개수 조회용 DAO
	 * @return count
	 * @throws Exception
	 */
	public int selectShowCount() throws Exception{
		return sqlSession.selectOne("apiMapper.selectShowCount");
	}
	
	/** 기존 공연 정보 삭제용 DAO
	 * @return result
	 * @throws Exception
	 */
	public int deleteShow() throws Exception{
		return sqlSession.delete("apiMapper.deleteShow");
	}
	
	/** 공연 상세 정보 삽입용 DAO
	 * @param show
	 * @return result
	 * @throws Exception
	 */
	public int insertShow(Show show) throws Exception{
		return sqlSession.insert("apiMapper.insertShow", show);
	}


	

	
	

	

	

}
