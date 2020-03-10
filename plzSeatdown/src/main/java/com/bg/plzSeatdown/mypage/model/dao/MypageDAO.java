/*
package com.bg.plzSeatdown.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.member.model.vo.Member;

@Repository
public class MypageDAO {

	@Autowired //rootcontext에 bean 설정 되있음
	private SqlSessionTemplate sqlSession;
	
	
	

	public Member selectMypage(int memberNo) throws Exception {
		return sqlSession.selectOne("mypageMapper.selectMypage", memberNo);
	}

}
*/
