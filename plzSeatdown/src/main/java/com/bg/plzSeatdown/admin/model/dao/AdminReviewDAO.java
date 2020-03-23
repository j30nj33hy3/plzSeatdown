package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.admin.model.vo.AdminReview;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Repository
public class AdminReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 리뷰게시판 전체 게시글 수 조회 DAO
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("adminReviewMapper.getListCount", map);
	}

	/** 리뷰게시판 목록 조회용 DAO
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<AdminReview> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage()-1)*pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminReviewMapper.selectList", map, rowBounds);	
	}
	
	/** 리뷰 게시글 삭제 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deleteReview(int no) throws Exception{
		return sqlSession.update("adminReviewMapper.deleteReview", no);
	}
}
