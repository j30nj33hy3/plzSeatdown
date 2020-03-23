package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.admin.model.vo.AdminReplyReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminReplyReportService {

	
	/** 전체 신고 수 조회 서비스
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	int getListCount(Map<String, String> map) throws Exception;

	
	/** 리플 신고 목록 조회 서비스
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	List<AdminReplyReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception;


	/** 리플 신고처리 서비스
	 * @param no
	 * @param reportNo
	 * @return result
	 * @throws Exception
	 */
	int updateRpCnt(int no, int reportNo) throws Exception;

}
