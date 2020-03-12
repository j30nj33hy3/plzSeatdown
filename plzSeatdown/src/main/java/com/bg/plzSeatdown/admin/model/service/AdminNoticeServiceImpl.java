package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.admin.model.dao.AdminNoticeDAO;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.notice.model.vo.Notice;

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
	public List<Notice> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminNoticeDAO.selectList(map,pInf);
	}
	
	// alt+shift+s -> v
	
	/** 공지사항 상세 조회용 Service
	 * @param noticeNo
	 * @return notice
	 * @throws Exception
	 */
	@Override
	public Notice selectNotice(Integer no) throws Exception {
		Notice notice = adminNoticeDAO.selectNotice(no);
		if(notice != null) {
			int result = adminNoticeDAO.increaseCount(no);
			
			if(result>0) {
				notice.setNoticeCount(notice.getNoticeCount()+1);
			}else {
				notice=null;
			}
		}
		return notice;
		
	}
	
}
