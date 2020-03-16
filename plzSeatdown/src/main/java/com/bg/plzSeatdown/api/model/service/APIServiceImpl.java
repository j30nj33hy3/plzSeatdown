package com.bg.plzSeatdown.api.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.api.model.dao.APIDAO;
import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.api.model.vo.Theater;

@Service
public class APIServiceImpl implements APIService{

	@Autowired
	private APIDAO apiDAO;
	
	/** URL 요청으로 반환된 공연시설 상세 정보 리스트 삽입용 Service
	 * @param theaterList
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertTheater(List<Theater> theaterList) throws Exception {
		
		int result = 0;
		
		for(Theater theater : theaterList) {
			
			result = apiDAO.insertTheater(theater);
			
			if(result == 0) throw new Exception();
		}
		return result;
	}

	/** 공연 코드 목록을 추출하기 위한 prfplccd 조회용 Service
	 * @return prfList
	 * @throws Exception
	 */
	@Override
	public List<String> selectprfList() throws Exception {
		return apiDAO.selectprfList();
	}

	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertThShowCode(List<Show> thShowCodeList) throws Exception {
		
		int result = 0;
		
		for(Show show : thShowCodeList) {
			
			result = apiDAO.insertThShowCode(show);
			
			if(result == 0) throw new Exception();
		}
		return result;
	}

	/** 공연 상세 정보 삽입용 Service
	 * @param showDetailList
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int insertShow(List<Show> showDetailList) throws Exception {
		int result = 0;
		
		for(Show show : showDetailList) {
			
			result = apiDAO.insertShow(show);
			
			if(result == 0) throw new Exception();
		}
		return result;
	}
}
