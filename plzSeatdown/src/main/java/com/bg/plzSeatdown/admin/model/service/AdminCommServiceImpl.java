package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminCommDAO;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;

@Service
public class AdminCommServiceImpl implements AdminCommService{
	
	@Autowired
	private AdminCommDAO adminCommDAO;
	
	
	/** 전체 게시글 수 조회
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminCommDAO.getListCount(map);
	}
	
	/** 게시판 글 목록 조회 서비스
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Community> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminCommDAO.selectList(map,pInf);
	}

	/** 커뮤니티 게시글 삭제 서비스
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteComm(int no) throws Exception{
		return adminCommDAO.deleteComm(no);
	}	
}
