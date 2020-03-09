package com.bg.plzSeatdown.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.member.model.vo.Member;

// Repository(저장소): 데이터가 있는 곳에 접근한다는 의미
// bean 등록 어노테이션의 매개변수 == 등록되는 bean의 이름
// -> 미작성 시 클래스명 중 제일 앞글자만 소문자로 변경되어 bean이 자동 등록됨
@Repository("memberDAO")
public class MemberDAO {

	// root-context에서 bean으로 등록되어 있음
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 회원 로그인용 DAO
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member loginMember(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}

}
