package com.bg.plzSeatdown.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.qna.model.dao.QnADAO;
import com.bg.plzSeatdown.qna.model.vo.QnA;

@Service("qnaService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADAO qnaDAO;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertQnA(QnA qna) throws Exception {
		int result = 0;
		int qnaNo = qnaDAO.selectNextNo();
		if(qnaNo>0) {
			qna.setQnaContent(qna.getQnaContent().replace("\r\n", "<br>"));
			qna.setQnaNo(qnaNo);
			result = qnaDAO.insertQnA(qna);
			if(result>0) {
				result = qnaNo;
			}
		}
		return result;
	}

}
