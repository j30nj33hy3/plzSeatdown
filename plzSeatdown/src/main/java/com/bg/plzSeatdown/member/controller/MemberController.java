package com.bg.plzSeatdown.member.controller;

import java.io.File;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.FileRename;
import com.bg.plzSeatdown.member.model.service.MemberService;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;

/* IoC(제어 반전, Inversion of Controller) 
 * 	프로그램을 구동하는 데 필요한 객체에 대한 생성, 변경 등의 관리를
 *  프로그램을 개발하는 사람이 아닌 프로그램을 구동하는 컨테이너에서 
 *  직접 관리하는 것을 말한다.
 *  
 * IoC 컨테이너
 * 	스프링에서 관리하는 객체를 'Bean(빈)'이라고 하고,
 *  해당 Bean들을 관리한다는 의미로 컨테이너를 Bean Factory라고 한다.
 *  
 *  -> @annotation을 통해 Bean으로 등록하면 
 *  IoC 컨트롤러(=Bean Factory)가 해당 Bean을 관리할 수 있다.
 *  (애플리케이션의 제어권이 개발자에서 
 *  Spring Framework(라이브러리)가 제공하는  IoC 컨테이너로 넘어간다.)
 *  
 * DI(의존성 주입, Dependency Injection)
 * 	사용하는 객체를 직접 생성하여 만드는 것이 아니라 
 *  컨테이너가 빈의 설정 정보를 읽어와 자동으로 해당 객체에 연결하는 것을 의미
 *  
 *  이렇게 의존성을 주입받게 되면 이후 해당 객체를 수정해야 할 상황이 발생했을 때
 *  소스 코드의 수정을 최소화 할 수 있다.(결합도 감소)
 *  
 *  DI 장점: 개발자가 작성해야 할 코드가 단순해진다.
 *  		각 객체 간의 종속 관계(결합도)를 해소할 수 있다.
 *  
 * Spring AOP(관점 지향 프로그래밍, Aspect Oriented Programming)
 * 	트랜잭션, 로깅, 보안 등 여러 모듈, 
 *  여러 계층에서 공통으로 필요로 하는 경우 해당 기능들을 분리하여 관리한다.
 * */

//@Controller
//프레젠테이션 레이어, 웹 애플리케이션에서 View에서 전달받은 웹 요청과
//응답을 처리하는 클래스임을 나타냄 + bean 등록
//@SessionAttributes
//Model에 담긴 데이터중 Key 값이
//@SessionAttributes의 매개변수에 작성된 값과 같은 경우
//해당 데이터의 scope를 session으로 변경
@SessionAttributes({"loginMember", "msg"})
@Controller // @Component
@RequestMapping("/member/*") // 내부 메소드 레벨에서 매핑되는 주소에 공통되는 부분 작성.
public class MemberController {
	// @Autowired 사용 시
	// bean scanning을 통해
	// 등록된 bean 중 알맞은 bean을 의존성 주입(DI) 해줌
	
	@Autowired
	private MemberService memberService;
	
	// 로그인
	// @SessionAttributes 사용하기
		// Class 선언 위에 작성
	// @ModelAttribute 생략
		// 매개변수로 HttpSession을 작성해두면
		// - request.getSession() 한 값이 알아서 들어온다.
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String memberLogin(Member member, Model model,
			@RequestParam(value = "save", required = false) String save,
			RedirectAttributes rdAttr,
			HttpServletResponse response) {
		// Model은 응답으로 전달하고자 하는 데이터를 맵 형식(K,V)으로 담아 전달하는 역할
		// scope는 기본적으로 request임
		try {
			Member loginMember = memberService.loginMember(member);
			if(loginMember != null) {
				Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
				if(save != null) {
					cookie.setMaxAge(60*60*24*7); // 7일로 설정
				}else {
					cookie.setMaxAge(0);
				}
				cookie.setPath("/");
				response.addCookie(cookie);
				model.addAttribute("loginMember", loginMember);
			}else {
				rdAttr.addFlashAttribute("msg", "로그인 정보가 유효하지 않습니다.");
			}
			return "redirect:/";
			
		}catch (Exception e) {
			return ExceptionForward.errorPage("로그인", model, e);
		}
	}
	// 로그아웃
	@RequestMapping("logout")
	public String memberLogout(SessionStatus status) {
		// 세션 무효화
		// session.invalidate();

		// SessionStatus 객체 : 세션의 상태를 관리할 수 있는 객체
		// @SessionAttribute 사용 시
		// Session을 무효화 시키기 위해서는
		// SessionStatus 객체를 사용해야 함.
		status.setComplete();
		return "redirect:/";
	}
	
	// 회원 가입 페이지 이동
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "member/signUpForm";
	}
	
	// 회원가입
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	public String signUp(Member member, Model model,
				HttpServletRequest request,
				RedirectAttributes rdAttr,
				String phone1, String phone2, String phone3,
				@RequestParam(value="profile", required=false) MultipartFile profile) {
		String memberPhone = phone1 + "-" + phone2 + "-" + phone3;
		Member signUpMember = new Member(member.getMemberId(), member.getMemberPwd(), 
				member.getMemberName(), member.getMemberNickname(),
				member.getMemberEmail(), memberPhone);
		
		// 파일 저장 경로 : url 요청 주소로부터 컴퓨터(서버)에서 사용하는 진짜 경로값을 받아옴.
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = root + "/profileImages";
		
		// 저장 폴더 선택
		File folder = new File(savePath);
		// 만약 해당 폴더가 없는 경우 -> 폴더 만들기
		if(!folder.exists()) folder.mkdir();
		String changeFileName = null;
		try {
			
			Attachment image = null;
			if(!profile.getOriginalFilename().equals("")) {
				changeFileName = FileRename.rename(profile.getOriginalFilename());
			}
			
			image = new Attachment(changeFileName);
			
			// 회원가입 + 프로필사진 등록 Service 호출
			int result = memberService.signUp(signUpMember, image);
			String msg = null;
			if(result > 0) {
				if(!profile.getOriginalFilename().equals("")) {
					profile.transferTo(new File(savePath+"/"+image.getProfilePath()));
				}
				msg = "입력한 이메일 주소로 인증메일을 발송하였습니다. 이메일 인증 후 사이트 이용 가능합니다.";
			}
			else {
				msg = "회원 가입 실패(관리자 메일로 문의 바랍니다.)";
			}
			
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:/";
		}catch (Exception e) {
			return ExceptionForward.errorPage("회원가입", model, e);
		}
	}
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping("idDupCheck")
	public String idDupCheck(String memberId, Model model) {
		try {
			return memberService.idDupCheck(memberId) == 0? true+"" : false+"";
		}catch (Exception e) {
			return ExceptionForward.errorPage("아이디 중복체크", model, e);
		}
	}
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping("nicknameDupCheck")
	public String nicknameDupCheck(String memberNickname, Model model) {
		try {
			return memberService.nicknameDupCheck(memberNickname) == 0? true+"" : false+"";
		}catch (Exception e) {
			return ExceptionForward.errorPage("닉네임 중복체크", model, e);
		}
	}
}
