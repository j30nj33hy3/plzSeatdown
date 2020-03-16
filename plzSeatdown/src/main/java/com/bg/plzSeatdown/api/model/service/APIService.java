package com.bg.plzSeatdown.api.model.service;

import java.util.List;

import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.api.model.vo.Theater;

public interface APIService {
	
	/** 현재 저장된 공연장 개수 조회
	 * @return count
	 * @throws Exception
	 */
	public abstract int getTheaterCount() throws Exception;

	/** URL 요청으로 반환된 공연시설 상세 정보 리스트 삽입용 Service
	 * @param theaterList
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertTheater(List<Theater> theaterList) throws Exception;

	/** URL 요청으로 반환된 공연시설 상세 정보 리스트 업데이트용 Service
	 * @param theaterList
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateTheater(List<Theater> theaterList) throws Exception;
	
	/** 공연 코드 목록을 추출하기 위한 prfplccd 조회용 Service
	 * @return prfList
	 * @throws Exception
	 */
	public abstract List<String> selectprfList() throws Exception;

	//public abstract int insertThShowCode(List<Show> thShowCodeList) throws Exception;
	
	/** 현재 저장된 공연 수 조회
	 * @return count
	 * @throws Exception
	 */
	public abstract int getShowCount() throws Exception;

	/** 공연 상세 정보 삽입용 Service
	 * @param showDetailList
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertShow(List<Show> showDetailList) throws Exception;

	/** 공연 상세 정보 업데이트용 Service
	 * @param showDetailList
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateShow(List<Show> showDetailList) throws Exception;


	
}
