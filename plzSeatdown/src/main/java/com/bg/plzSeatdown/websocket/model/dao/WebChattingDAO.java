package com.bg.plzSeatdown.websocket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;

@Repository
public class WebChattingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectNickName(int memberNo) throws Exception{
		return sqlSession.selectOne("mypageMapper.selectMypage", memberNo);
	}

	public Profile selectPropfileProp(int memberNo) throws Exception{
		return sqlSession.selectOne("mypageMapper.selectMypageProf", memberNo);
	}

}
