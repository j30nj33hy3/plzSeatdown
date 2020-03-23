package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.admin.model.vo.AdminReplyReport;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Repository
public class AdminReplyReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getListCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("adminReplyReportMapper.getListCount");
	}

	public List<AdminReplyReport> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage()-1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminReplyReportMapper.selectList", map, rowBounds);
	}

	/** 신고횟수 업데이트용 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int updateRpCnt(int no) throws Exception{
		return sqlSession.update("adminReplyReportMapper.updateRpCnt",no);
	}

	/** 신고 댓글 처리상태 변경용 DAO
	 * @param reportNo
	 * @return result
	 * @throws Exception
	 */
	public int updateStauts(int reportNo) throws Exception{
		return sqlSession.update("adminReplyReportMapper.updateStatus",reportNo);
	}

}
