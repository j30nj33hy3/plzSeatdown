package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;

public interface AdminCommService {
	

	/** 전체 게시글 수 조회
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map) throws Exception;	


	/** 게시판 글 목록 조회 서비스
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Community> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	
	/** 커뮤니티 게시글 삭제 서비스
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteComm(int no) throws Exception;
}
