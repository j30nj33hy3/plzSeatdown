package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminNoticeDAO;
import com.bg.plzSeatdown.admin.model.vo.AdminNotice;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService{

	@Autowired
	// DAO가 @Repository로 저장되어있고 Bean-Scanning -> IOC -> DI
	private AdminNoticeDAO adminNoticeDAO;

	/** 공지사항 게시글 수 조회용 Service(검색포함)
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminNoticeDAO.getListCount(map);
	}

	/** 공지사항 목록 조회용 Service(검색 포함)
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<AdminNotice> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminNoticeDAO.selectList(map,pInf);
	}
	
	// alt+shift+s -> v
	
	/** 공지사항 상세 조회용 Service
	 * @param noticeNo
	 * @return notice
	 * @throws Exception
	 */
	@Override
	public AdminNotice selectNotice(Integer no) throws Exception {
		return adminNoticeDAO.selectNotice(no);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateNotice(AdminNotice adminNotice) throws Exception {
		return adminNoticeDAO.updateNotice(adminNotice);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteNotice(Integer no) throws Exception {
		return adminNoticeDAO.deleteNotice(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(AdminNotice adminNotice) throws Exception {
		int result = 0;
		int noticeNo = adminNoticeDAO.selectNextNo();
		if(noticeNo > 0) {
			adminNotice.setNoticeContent(adminNotice.getNoticeContent().replace("\r\n", "<br>"));
			adminNotice.setNoticeNo(noticeNo);
			
			result = adminNoticeDAO.insertNotice(adminNotice);
			
			if(result > 0) result = noticeNo;
			else		throw new Exception();
		}
		return result;
	}

}
