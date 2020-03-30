package com.bg.plzSeatdown.message.model.service;

import java.util.List;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.message.model.vo.Message;

public interface MessageService {

	/** 쪽지 갯수 확인 서비스
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(String nickName) throws Exception;
        
	/** 쪽지 리스트 조회 서비스
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Message> selectList(String nickName, PageInfo pInf) throws Exception;

	public abstract int insertMessage(Message message) throws Exception;

	public abstract int getListCount2(String nickName) throws Exception;
	
	public abstract List<Message> selectList2(String nickName, PageInfo pInf) throws Exception;

	public abstract Message selectMessage(Integer no) throws Exception;

	public abstract int deleteMessage(Integer no) throws Exception;

	public abstract int msgCount(Integer no) throws Exception;

	public abstract int updateMessage(Integer no) throws Exception;

	public abstract Message selectSendMessage(Integer no) throws Exception;

	public abstract Message selectReplyForm(Integer no) throws Exception;

	public abstract int sendReply(Message message) throws Exception;
	
	/** 받은 쪽지함 삭제 
	 * @param check
	 * @return result
	 * @throws Exception
	 */
	public abstract int checkDel(int check) throws Exception;

	/** 보낸 쪽지함 삭제 
	 * @param check
	 * @return result
	 * @throws Exception
	 */
	public abstract int sendDel(int check) throws Exception;


}
