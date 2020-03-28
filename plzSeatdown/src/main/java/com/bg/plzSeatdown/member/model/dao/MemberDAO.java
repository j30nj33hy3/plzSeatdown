package com.bg.plzSeatdown.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.member.model.vo.Attachment;
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

	/** 다음 회원번호 생성용 DAO
	 * @return memberNo
	 * @throws Exception
	 */
	public int selectNextMemberNo() throws Exception{
		return sqlSession.selectOne("memberMapper.selectNextMemberNo");
	}

	/** 회원가입용 DAO
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member signUpMember) throws Exception{
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	/** 프로필사진 삽입용 DAO
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	public int insertProfileImage(Attachment image) throws Exception{
		return sqlSession.insert("memberMapper.insertProfileImage", image);
	}

	/** 아이디 중복 체크 DAO
	 * @param memberId
	 * @return count
	 * @throws Exception
	 */
	public int idDupCheck(String memberId) throws Exception{
		return sqlSession.selectOne("memberMapper.idDupCheck", memberId);
	}

	/** 닉네임 중복 체크 DAO
	 * @param memberNickname
	 * @return count
	 * @throws Exception
	 */
	public int nicknameDupCheck(String memberNickname) throws Exception{
		return sqlSession.selectOne("memberMapper.nicknameDupCheck", memberNickname);
	}

	/** 메일 인증용 DAO
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	public int mailAuth(Member member) throws Exception{
		return sqlSession.update("memberMapper.mailAuth", member);
	}

	/** 아이디 찾기용 DAO
	 * @param member
	 * @return memberId
	 * @throws Exception
	 */
	public String findId(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.findId", member);
	}

	/** 사용자 계정 확인용 DAO
	 * @param member
	 * @return count
	 * @throws Exception
	 */
	public int checkMemberInfo(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.checkMemberInfo", member);
	}

	/** 비밀번호 재설정용 DAO
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int resetPwd(Member member) throws Exception{
		return sqlSession.update("memberMapper.resetPwd", member);
	}

	/** 이메일 중복체크용 DAO
	 * @param memberEmail
	 * @return count
	 * @throws Exception
	 */
	public int emailDupCheck(String memberEmail) throws Exception{
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}

	/** 프로필 조회용 DAO
	 * @param memberNo
	 * @return attachment
	 * @throws Exception
	 */
	public Attachment selectProfile(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectProfile", memberNo);
	}

}
