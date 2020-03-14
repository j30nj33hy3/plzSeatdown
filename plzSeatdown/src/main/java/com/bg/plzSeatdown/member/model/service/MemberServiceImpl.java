package com.bg.plzSeatdown.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.member.model.dao.MemberDAO;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;

@Service // Service 레이어, 비즈니스 로직을 가진 클래스라는 걸 명시하는 것 + bean 등록
public class MemberServiceImpl implements MemberService{

	@Autowired // 별도로 객체생성(new)없이 의존성 주입(DI)으로 알맞은 객체가 주입됨.
	private MemberDAO memberDAO;
	
	// 암호화를 위한 객체 DI(의존성 주입)
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/** 회원 로그인용 Service
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	@Override
	public Member loginMember(Member member) throws Exception {
		// Spring 에서는 service 단에서 SqlSession을 얻어오지 않음.
		// -> DAO에서 바로 얻어올 예정
		// 왜? SqlSession을 개발자가 생성 또는 얻어올 필요 없이
		// DAO에서 바로 DI를 통해 얻어올 수 있고
		// 추후 AOP를 이용하여 트랜잭션 처리도 할 수 있기 때문에
		
		// root-context에서 SqlSession을 bean으로 등록함 (= getSqlSession 할 필요가 X)
		//							-> 제어역전(IOC) ~ 의존성 주입(DI)
		// 필요한 객체를 @Autowired로 주입하여(DI) 사용할 수 있게 됨.
		// 			-> 이렇게 사용하면 별도로 new 객체 생성 X (= 의존성 낮아짐)
		// 이렇게 DAO에서 SqlSession을 받을 수 있는데 굳이 Service가 필요한 이유는
		// 트랜잭션 처리를 하기 위함.
		
		Member loginMember = memberDAO.loginMember(member);
		if(loginMember != null) {
			if(!bCryptPasswordEncoder.matches(member.getMemberPwd(), 
					loginMember.getMemberPwd())) {
				loginMember = null;
			}
		}
		return loginMember;
	}

	/** 회원가입용 Service
	 * @param signUpMember
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember, Attachment image) throws Exception {
		int result = 0;
		// 1) 다음 SEQ_MNO 얻어오기
		int memberNo = memberDAO.selectNextMemberNo();
		
		// 2) 회원 등록
		if(memberNo > 0) {
			signUpMember.setMemberNo(memberNo);
			// 암호화된 비밀번호를 저장
			String encPwd = bCryptPasswordEncoder.encode(signUpMember.getMemberPwd());
			signUpMember.setMemberPwd(encPwd);
			result = memberDAO.signUp(signUpMember);
		}
		
		if(result > 0 && image.getProfilePath() != null) {
			result = 0;
			image.setMemberNo(memberNo);
			result = memberDAO.insertProfileImage(image);
			if(result == 0) {
				throw new Exception();
			}
		}
		return memberNo;
	}

	/** 아이디 중복체크용 Service
	 * @param memberId
	 * @return count
	 * @throws Exception
	 */
	@Override
	public int idDupCheck(String memberId) throws Exception {
		return memberDAO.idDupCheck(memberId);
	}

	/** 닉네임 중복체크용 Service
	 * @param memberNickname
	 * @return count
	 * @throws Exception
	 */
	@Override
	public int nicknameDupCheck(String memberNickname) throws Exception {
		return memberDAO.nicknameDupCheck(memberNickname);
	}

	/** 메일 인증용 Service
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int mailAuth(Member member) throws Exception {
		return memberDAO.mailAuth(member);
	}

}
