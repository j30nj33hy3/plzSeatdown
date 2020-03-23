package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.admin.model.vo.AdminCommunityReport;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;

@Repository
public class AdminCommReportDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 게시글 수 조회 DAO
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("adminCommReportMapper.getListCount");
	}

	/** 커뮤니티 신고게시판 글 목록 조회 DAO
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<AdminCommunityReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage()-1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminCommReportMapper.selectList", map, rowBounds);
	}

	/** 신고횟수 업데이트용 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int updateRpCnt(int no) throws Exception{
		return sqlSession.update("adminCommReportMapper.updateRpCnt", no);
	}

	/** 신고글 처리상태 변경용 DAO
	 * @param reportNo
	 * @return result
	 * @throws Exception
	 */
	public int updateStatus(int reportNo) throws Exception{
		return sqlSession.update("adminCommReportMapper.updateStatus", reportNo);
	}

}
