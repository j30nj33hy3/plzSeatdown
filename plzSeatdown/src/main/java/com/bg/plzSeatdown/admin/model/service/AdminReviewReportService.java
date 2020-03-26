package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.admin.model.vo.AdminReplyReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminReviewReportService {

	/** 전체 게시글 수 조회 서비스
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map) throws Exception;

	/** 리뷰 신고게시판 글 목록 조회 서비스
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<AdminReplyReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	/** 신고 횟수 증가용 서비스
	 * @param no
	 * @param reportNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateRpCnt(int no, int reportNo) throws Exception;

}
