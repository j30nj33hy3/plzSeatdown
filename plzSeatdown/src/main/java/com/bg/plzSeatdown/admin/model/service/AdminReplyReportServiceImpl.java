package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminReplyReportDAO;
import com.bg.plzSeatdown.admin.model.vo.AdminReplyReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service
public class AdminReplyReportServiceImpl implements AdminReplyReportService{

	@Autowired
	private AdminReplyReportDAO adminReplyReportDAO;
	
	/** 전체 신고 수 조회 서비스
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminReplyReportDAO.getListCount(map);
	}
	/** 리플 신고 목록 조회 서비스
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<AdminReplyReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminReplyReportDAO.selectList(map, pInf);
	}
	
	/** 리플 신고처리 서비스
	 * @param no
	 * @param reportNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateRpCnt(int no, int reportNo) throws Exception {
		int result = adminReplyReportDAO.updateRpCnt(no);
		
		if(result > 0) {
			result = 0;
			result = adminReplyReportDAO.updateStauts(reportNo);		
		}
		return result;
	}	
}
