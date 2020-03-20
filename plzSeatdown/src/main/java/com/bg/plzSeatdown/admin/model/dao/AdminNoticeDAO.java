package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.admin.model.vo.AdminNotice;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.notice.model.vo.Notice;

@Repository("adminNoticeDAO")
public class AdminNoticeDAO {
	
	// SqlSession 필드로 선언 -> root-context에 있음
	// 등록된 bean 중 SqlSessionTemplate이 있으면 알아서 넣어줘라
	@Autowired 
	private SqlSessionTemplate sqlSession;

	/** 공지사항 게시글 수 조회용 DAO
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("adminNoticeMapper.getListCount", map);
	}

	/** 공지사항 목록 조회용 DAO(검색 포함)
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<AdminNotice> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		
		int offset = (pInf.getCurrentPage()-1)*pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminNoticeMapper.selectList", map, rowBounds);
	}

	/** 공지사항 상세 조회용 DAO
	 * @param noticeNo
	 * @return notice
	 * @throws Exception
	 */
	public AdminNotice selectNotice(Integer no) throws Exception{
		return sqlSession.selectOne("adminNoticeMapper.selectNotice", no);
	}
	
	public int increaseCount(Integer no) throws Exception{
		return sqlSession.update("adminNoticeMapper.increaseCount", no);
	}

	public int updateNotice(int noticeNo) throws Exception {
		return sqlSession.update("adminNoticeMapper.updateNotice", noticeNo);
	}

	public int deleteNotice(Integer no) throws Exception{
		return sqlSession.update("adminNoticeMapper.deleteNotice", no);
	}

	public int selectNextNo() {
		return sqlSession.selectOne("adminNoticeMapper.selectNextNo");
	}
	
	public int insertNotice(AdminNotice adminNotice) throws Exception{
		return sqlSession.insert("adminNoticeMapper.insertNotice", adminNotice);
	}


	
}
