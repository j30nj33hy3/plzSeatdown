package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;
import com.bg.plzSeatdown.admin.model.vo.AdminCommunityReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminCommReportService {

	
	/** 전체 신고 수 조회 서비스 
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map) throws Exception;

	/** 커뮤니티 신고 글 목록 조회 서비스 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<AdminCommunityReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	/** 신고횟수 업데이트 서비스
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateRpCnt(int no, int reportNo) throws Exception;

}
