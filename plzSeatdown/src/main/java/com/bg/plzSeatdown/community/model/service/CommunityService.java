package com.bg.plzSeatdown.community.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;
import com.bg.plzSeatdown.community.model.vo.Reply;

public interface CommunityService {

	/** 전체 게시글 수 조회용 Service
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, Object> map) throws Exception;

	/** 게시글 목록 조회용 Service
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Community> selectList(Map<String, Object> map, PageInfo pInf) throws Exception;

	/*
	 * public abstract List<Community> selectImageList(List<Community> list) throws
	 * Exception;
	 */
	
	/** 게시글 삭제용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteCommunity(Integer no) throws Exception;

	/** 게시글 등록용 Service
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertCommunity(Community community) throws Exception;

	/** 게시글 수정용 Service
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateCommunity(Community community) throws Exception;

	/** 게시글 조회용 Service
	 * @param map 
	 * @param no
	 * @return community
	 * @throws Exception
	 */
	public abstract Community selectCommunity(Map<String, Object> map) throws Exception;
	
	public abstract Community selectCommunity(Integer no) throws Exception;

	/** 조회수 증가용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public abstract int increaseCount(Integer no) throws Exception;

	/** 부모 댓글 등록용 Service
	 * @param objParams
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertReply(Reply reply) throws Exception;

	/** 댓글 조회용 Service
	 * @param communityNo
	 * @return rList
	 */
	public abstract List<Reply> selectReplyList(int communityNo);

	/** 댓글 등록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateReply(Reply reply) throws Exception;

	/** 자식 댓글 등록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertReReply(Reply reply) throws Exception;

	public abstract int deleteReply(Reply reply) throws Exception;

	/** 커뮤니티 게시글 신고용 Service
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertCommunityReport(Community community) throws Exception;

	public abstract int insertReplyReport(Reply reply) throws Exception;


}
