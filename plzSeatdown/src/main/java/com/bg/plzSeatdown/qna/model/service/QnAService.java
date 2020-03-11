package com.bg.plzSeatdown.qna.model.service;

import com.bg.plzSeatdown.qna.model.vo.QnA;

public interface QnAService {

	/** 문의 등록용 Service
	 * @param qna
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertQnA(QnA qna) throws Exception;

}
