package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.admin.model.vo.AdminReview;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminReviewService {

	/** 리뷰 게시판 게시글 수 조회 서비스
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map) throws Exception;

	/** 리뷰 목록 조회용 서비스 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<AdminReview> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

}
