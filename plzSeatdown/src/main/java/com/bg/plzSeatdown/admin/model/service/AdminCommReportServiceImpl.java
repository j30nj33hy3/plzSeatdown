package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminCommReportDAO;
import com.bg.plzSeatdown.admin.model.vo.AdminCommunityReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service
public class AdminCommReportServiceImpl implements AdminCommReportService{
	
	
	@Autowired
	private AdminCommReportDAO adminCommReportDAO;
	
	
	/** 전체 신고 수 조회 서비스 
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminCommReportDAO.getListCount(map);
	}

	/** 커뮤니티 신고 글 목록 조회 서비스 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<AdminCommunityReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminCommReportDAO.selectList(map, pInf);
	}

	/** 신고횟수 업데이트 서비스
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateRpCnt(int no, int reportNo) throws Exception {
		int result = adminCommReportDAO.updateRpCnt(no);
		
		if(result > 0) {
			result = 0;
			result = adminCommReportDAO.updateStatus(reportNo);
		}
		return result;
	}

}
