package com.bg.plzSeatdown.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.dao.CommunityDAO;
import com.bg.plzSeatdown.community.model.vo.Community;
import com.bg.plzSeatdown.community.model.vo.Reply;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDAO communityDAO;

	/** 전체 게시글 수 조회용 Service
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, Object> map) throws Exception {
		return communityDAO.getListCount(map);
	}

	/** 게시글 목록 조회용 Service
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Community> selectList(Map<String, Object> map, PageInfo pInf) throws Exception {
		return communityDAO.selectList(map, pInf);
	}

	/*
	 * @Override public List<Community> selectImageList(List<Community> list) throws
	 * Exception { return communityDAO.selectImageList(list); }
	 */

	/** 게시글 삭제용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int deleteCommunity(Integer no) throws Exception {
		return communityDAO.deleteCommunity(no);
	}

	/** 게시글 등록용 Service
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	@Transactional
	@Override
	public int insertCommunity(Community community) throws Exception {
		int result = 0;
		
		// 1) 다음 SEQ_CNO 얻어오기
		int communityNo = communityDAO.selectNextNo();
		
		// 2) 게시글 DB 삽입
		if(communityNo>0) {
			community.setCommunityNo(communityNo);
			
			result = communityDAO.insertCommunity(community);
		}
		if(result>0) {
			result = communityNo;
		}
		return result;
	}

	/** 게시글 수정용 Service
	 * @param community
	 * @return result
	 * @throws Exception
	 */
	@Transactional
	@Override
	public int updateCommunity(Community community) throws Exception {
		return communityDAO.updateCommunity(community);
	}

	
	/** 게시글 조회용 Service
	 * @param no
	 * @return community
	 * @throws Exception
	 */
	@Override
	public Community selectCommunity(Map<String, Object> map) throws Exception {
		return communityDAO.selectCommunity(map);
		/*
		 * if(community!=null) {
		 * 
		 * System.out.println(map); Community pn =
		 * communityDAO.selectPreNextCommunityNo(map); System.out.println(pn);
		 * community.setPreCommunityNo(pn.getPreCommunityNo());
		 * community.setNextCommunityNo(pn.getNextCommunityNo()); }
		 */
	}

	@Override
	public Community selectCommunity(Integer no) throws Exception {
		Community community = communityDAO.selectCommunity(no);
		
		return community;
	}
	/** 조회수 증가용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int increaseCount(Integer no) throws Exception {
		return communityDAO.increaseCount(no);
	}

	/** 부모 댓글 등록용 Service
	 * @param objParams
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Reply reply, Alarm alarm) throws Exception {
		int result = 0;
		String alarmContent = null;
		// 댓글 등록
		result = communityDAO.insertReply(reply);
		
		// 알림 삽입
		if(result>0) {
			result = 0;
			if(alarm.getAlarmContent().length()>=5) {
				alarmContent = alarm.getAlarmContent().substring(0, 5);				
			}else {
				alarmContent = alarm.getAlarmContent();
			}
			alarm.setAlarmType("R");
			alarm.setAlarmContent("["+alarmContent+"...]에 댓글이 달렸습니다.");
			result = communityDAO.insertAlarm(alarm);
		}
		return result;
	}

	/** 댓글 조회용 Service
	 * @param communityNo
	 * @return rList
	 */
	@Override
	public List<Reply> selectReplyList(int communityNo) {
		return communityDAO.selectReplyList(communityNo);
	}

	/** 댓글 수정용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReply(Reply reply) throws Exception {
		reply.setReplyContent(reply.getReplyContent().replace("\n", "<br>"));
		return communityDAO.updateReply(reply);
	}

	/** 자식 댓글 등록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReReply(Reply reply) throws Exception {
		int result = 0;
		
		int groupNo = communityDAO.selectReplyGroup(reply);
		
		if(groupNo>0) {
			reply.setReplyContent(reply.getReplyContent().replace("\n", "<br>"));
			reply.setReplyGroup(groupNo);
			reply.setParentNo(reply.getReplyNo());
			
			result = communityDAO.insertReReply(reply);
		}
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReply(Reply reply) throws Exception {
		int result = 0;
		if(reply.getDepth() == 0) {
			int replyGroupNo = communityDAO.selectReplyGroup(reply);
			if(replyGroupNo>0) {
				reply.setReplyGroup(replyGroupNo);
				int countGroup = communityDAO.selectCountGroup(reply);
				if(countGroup>1) {
					result = communityDAO.deleteReplyW(reply);
				}else {
					result = communityDAO.deleteReply(reply);
				}
			}
		}else {
			int replyGroupNo = communityDAO.selectReplyGroup(reply);
			if(replyGroupNo>0) {
				reply.setReplyGroup(replyGroupNo);
				int countParent = communityDAO.selectCountParent(reply);
				// 부모 댓글 삭제되었는지 확인
				if(countParent>0) { // 삭제x
					result = communityDAO.deleteReply(reply);
				}else { // 삭제o
					int countGroup = communityDAO.selectCountGroup(reply);
					
					if(countGroup>1) { // 자식댓글만 바로 삭제
						result = communityDAO.deleteReply(reply);
					}else {
						// 삭제
						int deleteChild = communityDAO.deleteReply(reply);
						// 부모 댓글 상태 바꿈
						if(deleteChild>0) {
							// 부모 번호 조회
							int parentNo = communityDAO.selectParentNo(reply);
							// 부모 댓글 상태 변경
							if(parentNo>0) {
								reply.setReplyNo(parentNo);
								result = communityDAO.deleteReply(reply);
							}
						}
					}
					
				}
			}
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertCommunityReport(Community community) throws Exception {
		int result = 0;
		// 신고한 게시글인지 확인
		int reportCount = communityDAO.selectCommunityReport(community);
		if(reportCount>0) {
			result = -1;
		}else {
			result = communityDAO.insertCommunityReport(community);
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReplyReport(Reply reply) throws Exception {
		int result = 0;
		// 신고한 게시글인지 확인
		int reportCount = communityDAO.selectReplyReport(reply);
		if(reportCount>0) {
			result = -1; 
		}else { 
			result = communityDAO.insertReplyReport(reply);
		}
		return result;
	}
	

}
