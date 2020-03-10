package com.bg.plzSeatdown.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.qna.model.vo.QnA;

@Repository("qnaDAO")
public class QnADAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 문의 다음번호 조회용 DAO
	 * @return result
	 * @throws Exception
	 */
	public int selectNextNo() throws Exception{
		return sqlSession.selectOne("yhbQnAMapper.selectNextNo");
	}

	/** 문의 작성용 DAO
	 * @param qna
	 * @return result
	 * @throws Exception
	 */
	public int insertQnA(QnA qna) throws Exception{
		return sqlSession.insert("yhbQnAMapper.insertQnA", qna);
	}

}
