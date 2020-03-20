package com.bg.plzSeatdown.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;
import com.bg.plzSeatdown.community.model.vo.Reply;

@Repository("communityDAO")
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 게시글 수 조회용 DAO
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("yhbCommunityMapper.getListCount", map);
	}

	/** 게시글 목록 조회용
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Community> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage()-1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("yhbCommunityMapper.selectList", map, rowBounds);
	}

	/** 게시글 삭제용 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deleteCommunity(Integer no) throws Exception{
		return sqlSession.update("yhbCommunityMapper.deleteCommunity", no);
	}

	/** 다음 게시글 번호 조회용 DAO
	 * @return communityNo
	 * @throws Exception
	 */
	public int selectNextNo() throws Exception {
		return sqlSession.selectOne("yhbCommunityMapper.selectNextNo");
	}

	/** 게시글 삽입용 DAO
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	public int insertCommunity(Community community) throws Exception{
		return sqlSession.insert("yhbCommunityMapper.insertCommunity", community);
	}

	/** 게시글 수정용 DAO
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	public int updateCommunity(Community community) throws Exception {
		return sqlSession.update("yhbCommunityMapper.updateCommunity", community);
	}

	/** 게시글 상세 조회용 DAO
	 * @param no
	 * @return community
	 * @throws Exception
	 */
	public Community selectCommunity(Integer no) throws Exception {
		return sqlSession.selectOne("yhbCommunityMapper.selectCommunity", no);
	}

	/** 조회수 증가용 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int increaseCount(Integer no) throws Exception {
		return sqlSession.update("yhbCommunityMapper.increaseCount", no);
	}

	
	/** 댓글 등록용 DAO
	 * @param objParams
	 * @return result
	 * @throws Exception
	 */
	public int insertReply(Reply reply) throws Exception {
		return sqlSession.insert("yhbCommunityMapper.insertReply", reply);
	}

	/** 댓글 조회용 DAO
	 * @param communityNo
	 * @return rList
	 */
	public List<Reply> selectReplyList(int communityNo) {
		return sqlSession.selectList("yhbCommunityMapper.selectReplyList", communityNo);
	}

	
	/** 댓글 수정용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateReply(Reply reply) throws Exception {
		return sqlSession.update("yhbCommunityMapper.updateReply", reply);
	}

	public int selectReplyGroup(Reply reply) throws Exception{
		return sqlSession.selectOne("yhbCommunityMapper.selectReplyGroup", reply);
	}

	public int insertReReply(Reply reply) throws Exception {
		return sqlSession.insert("yhbCommunityMapper.insertReReply", reply);
	}

	public int selectCountGroup(Reply reply) throws Exception{
		return sqlSession.selectOne("yhbCommunityMapper.selectCountGroup", reply);
	}

	public int deleteReplyW(Reply reply) throws Exception {
		return sqlSession.update("yhbCommunityMapper.deleteReplyM", reply);
	}

	public int deleteReply(Reply reply) throws Exception{
		return sqlSession.update("yhbCommunityMapper.deleteReply", reply);
	}

	public int selectCountParent(Reply reply) throws Exception{
		return sqlSession.selectOne("yhbCommunityMapper.selectCountParent", reply);
	}

	public int selectParentNo(Reply reply) throws Exception {
		return sqlSession.selectOne("yhbCommunityMapper.selectParentNo", reply);
	}

	
}
