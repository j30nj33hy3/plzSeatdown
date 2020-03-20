package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.admin.model.vo.AdminNotice;
import com.bg.plzSeatdown.common.vo.PageInfo;

public interface AdminNoticeService {

	
	/** 공지사항 게시글 수 조회용 Service(검색포함)
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map) throws Exception;

	/** 공지사항 목록 조회용 Service(검색 포함)
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<AdminNotice> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	/** 공지사항 상세 조회용 Service
	 * @param noticeNo
	 * @return notice
	 * @throws Exception
	 */
	public abstract AdminNotice selectNotice(Integer no) throws Exception;

	/** 공지사항 수정용 Service
	 * @param noticeNo
	 * @return  result
	 * @throws Exception
	 */
	public abstract int updateNotice(int noticeNo) throws Exception;

	public abstract int deleteNotice(Integer no) throws Exception;

	public abstract int insertNotice(AdminNotice adminNotice) throws Exception;

}
