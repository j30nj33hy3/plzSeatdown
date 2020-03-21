package com.bg.plzSeatdown.admin.model.service;

import java.util.List;

import com.bg.plzSeatdown.admin.model.vo.TheaterLogo;
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

	/** 공연시설장 로고 삽입용 Service(Ajax)
	 * @param logo
	 * @param savePath 
	 * @return result
	 */
	int insertLogo(TheaterLogo logo, String savePath) ;

	/** 공연시설장 로고 삭제용 Service(Ajax)
	 * @param theaterCode
	 * @param savePath
	 * @return result
	 */
	int deleteLogo(String theaterCode, String savePath);

}
