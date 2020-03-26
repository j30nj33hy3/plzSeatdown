package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminReviewReportDAO;
import com.bg.plzSeatdown.admin.model.vo.AdminReplyReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service
public class AdminReviewReportServiceImpl implements AdminReviewReportService {

	@Autowired
	private AdminReviewReportDAO adminReviewReportDAO;
	
	/** 전체 게시글 수 조회 서비스
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */	
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminReviewReportDAO.getListCount(map);
	}

	/** 리뷰 신고게시판 글 목록 조회 서비스
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<AdminReplyReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminReviewReportDAO.selectList(map, pInf);
	}

	/** 신고 횟수 증가용 서비스
	 * @param no
	 * @param reportNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateRpCnt(int no, int reportNo) throws Exception {
		int result = adminReviewReportDAO.updateRpCnt(no);
		
		if(result > 0) {
			result = 0;
			result = adminReviewReportDAO.updateStatus(reportNo);
		}
		return result;
	}	
}
