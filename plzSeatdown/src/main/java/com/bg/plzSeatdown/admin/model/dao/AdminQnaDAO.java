package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.admin.model.vo.AdminQna;
import com.bg.plzSeatdown.admin.model.vo.AdminQnaAnswer;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;

@Repository
public class AdminQnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("adminQnaMapper.getListCount", map);
	}

	/**
	 * @param map
	 * @param pInf
	 * @return qlist
	 * @throws Exception
	 */
	public List<AdminQna> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage()-1)*pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminQnaMapper.selectList", map, rowBounds);
	}

	/**
	 * @param no
	 * @return qna
	 * @throws Exception
	 */
	public AdminQna selectQna(Integer no) throws Exception {
		return sqlSession.selectOne("adminQnaMapper.selectQna", no);
	}

	/**
	 * @param adminQnaAnswer
	 * @return result
	 * @throws Exception
	 */
	public int insertAnswer(AdminQnaAnswer adminQnaAnswer) throws Exception {
		return sqlSession.insert("adminQnaMapper.insertAnswer", adminQnaAnswer);
	}

	/**
	 * @param no
	 * @return status
	 * @throws Exception
	 */
	public int deleteQna(Integer no) throws Exception{
		return sqlSession.update("adminQnaMapper.deleteQna", no);
	}

	/**
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int updateQnaStatus(int no) throws Exception {
		return sqlSession.update("adminQnaMapper.updateQnaStatus", no);
	}

	public List<AdminQna> selectInfo(Integer no) throws Exception{
		return sqlSession.selectList("adminQnaMapper.selectInfo", no);
	}

	public String selectAnswer(Integer no) throws Exception{
		return sqlSession.selectOne("adminQnaMapper.selectAnswer", no);
	}


	
}
