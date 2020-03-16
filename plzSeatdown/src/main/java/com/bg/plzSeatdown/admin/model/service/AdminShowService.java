package com.bg.plzSeatdown.admin.model.service;

import java.util.List;

import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminShowService {

	/** 공연 수 조회용 Service
	 * @param searchValue
	 * @return showCount
	 * @throws Exception
	 */
	int getShowCount(String searchValue) throws Exception;

	/** 공연 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	List<Show> selectList(String searchValue, PageInfo pInf) throws Exception;

}
