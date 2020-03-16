package com.bg.plzSeatdown.admin.model.service;

import java.util.List;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminTheaterService {

	/** 공연시설장 수 조회용 Service
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	int getTheaterCount(String searchValue) throws Exception;

	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	List<Theater> selectList(String searchValue, PageInfo pInf) throws Exception;

}
