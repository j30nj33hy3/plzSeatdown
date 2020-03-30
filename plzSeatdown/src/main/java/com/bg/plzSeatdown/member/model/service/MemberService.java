package com.bg.plzSeatdown.member.model.service;

import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;

public interface MemberService {
	// Service Interface를 사용하는 이유
	/*
	 * 1. 프로젝트의 규칙성을 부여
	 * 2. 클래스간의 결합도를 약화 시키기 위함.
	 * --> 유지 보수성 향상
	 * 
	 * 3. Spring AOP를 사용하기 위함(4버전 부터 필요X)
	 * --> 최근에는 필요하지 않지만 이전 버전 프로젝트와의 호환을 위해 사용
	 * */
	
	//	Interface: 상수형 필드(public static final)와 
	//	추상메소드(public abstract)만을 작성할 수 있는 
	//	추상 클래스(미완성 클래스)의 변형체 -> 일관된 인터페이스 제공, 필요 기능 강제
	
	// 인터페이스 메소드는 묵시적으로 public abstract
	// 인터페이스의 필드는 묵시적으로 public static final
	
	/** 회원 로그인용 Service
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public abstract Member loginMember(Member member) throws Exception;

	/** 회원가입용 Service
	 * @param signUpMember
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	public abstract int signUp(Member signUpMember, Attachment image) throws Exception;

	/** 아이디 중복체크용 Service
	 * @param memberId
	 * @return count
	 * @throws Exception
	 */
	public abstract int idDupCheck(String memberId) throws Exception;

	/** 닉네임 중복체크용 Service
	 * @param memberNickname
	 * @return count
	 * @throws Exception
	 */
	public abstract int nicknameDupCheck(String memberNickname) throws Exception;

	/** 메일 인증용 Service
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	public abstract int mailAuth(Member member) throws Exception;

	/** 아이디 찾기용 Service
	 * @param member
	 * @return memberId
	 * @throws Exception
	 */
	public abstract String findId(Member member) throws Exception;

	
	/** 사용자 계정 확인용 Service
	 * @param member
	 * @return count
	 * @throws Exception
	 */
	public abstract int checkMemberInfo(Member member) throws Exception;

	/** 비밀번호 재설정용 Service
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public abstract int resetPwd(Member member) throws Exception;

	/** 이메일 중복체크용 Service
	 * @param memberEmail
	 * @return count
	 * @throws Exception
	 */
	public abstract int emailDupCheck(String memberEmail) throws Exception;

	/** 프로필 사진 조회용 Service
	 * @param memberNo
	 * @return attachment
	 * @throws Exception
	 */
	public abstract Attachment selectProfile(int memberNo) throws Exception;

	
	/** 카카오 가입 Service
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public abstract int kakaoSignUp(Member member) throws Exception;

	/** 네이버 로그인 가입 Service
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public abstract int naverSignUp(Member member) throws Exception;


}
