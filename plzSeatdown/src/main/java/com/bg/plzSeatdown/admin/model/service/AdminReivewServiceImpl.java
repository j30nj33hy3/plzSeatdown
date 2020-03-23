package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminReviewDAO;
import com.bg.plzSeatdown.admin.model.vo.AdminReview;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service
public class AdminReivewServiceImpl implements AdminReviewService{

	@Autowired
	private AdminReviewDAO adminReviewDAO;
	
	/** 리뷰 게시판 게시글 수 조회 서비스
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminReviewDAO.getListCount(map);
	}

	/** 리뷰 목록 조회용 서비스 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<AdminReview> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminReviewDAO.selectList(map, pInf);
	}
	
	/** 리뷰 게시글 삭제 서비스
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReview(int no) throws Exception {
		return adminReviewDAO.deleteReview(no);
	}	
	
	
}
