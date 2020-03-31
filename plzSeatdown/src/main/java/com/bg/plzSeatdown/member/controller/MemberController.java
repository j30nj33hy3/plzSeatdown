package com.bg.plzSeatdown.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.FileRename;
import com.bg.plzSeatdown.member.model.service.MemberService;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

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
@SessionAttributes({"loginMember", "msg", "signUpMember", "code"})
@Controller // @Component
@RequestMapping("/member/*") // 내부 메소드 레벨에서 매핑되는 주소에 공통되는 부분 작성.
public class MemberController {
	
	private static String serverIp = "192.168.10.55";
	@Inject
	JavaMailSender mailSender;
	// 로깅 변수
	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);

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
			HttpServletRequest request,
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
				
				request.getSession().setAttribute("loginMember", loginMember);
			}else {
				model.addAttribute("msg", "로그인 정보가 유효하지 않습니다.");
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
				signUpMember.setMemberNo(result);
				model.addAttribute("signUpMember", signUpMember);
				msg = "입력한 이메일 주소로 인증메일을 발송하였습니다. 이메일 인증 후 사이트 이용 가능합니다.";
			}
			else {
				msg = "회원 가입 실패(관리자 메일로 문의 바랍니다.)";
			}
			
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:/member/mailAuthForm";
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
	
	// 닉네임 중복 검사
	@ResponseBody
	@RequestMapping("nicknameDupCheck")
	public String nicknameDupCheck(String memberNickname, Model model) {
		try {
			return memberService.nicknameDupCheck(memberNickname) == 0? true+"" : false+"";
		}catch (Exception e) {
			return ExceptionForward.errorPage("닉네임 중복체크", model, e);
		}
	}
	
	@ResponseBody
	@RequestMapping("emailDupCheck")
	public String emailDupCheck(String memberEmail, Model model) {
		try {
			return memberService.emailDupCheck(memberEmail) == 0? true+"": false+"";
		}catch (Exception e) {
			return ExceptionForward.errorPage("이메일 중복체크", model, e);
		}
	}
	// 이메일 인증 메일 전송 및 인증번호 입력 페이지 이동
	@RequestMapping("mailAuthForm")
	public ModelAndView mailAuthForm(Model model, ModelAndView mv) {
		try {
			mv.addObject("code", mailSending(model));
			mv.setViewName("member/emailCheckForm");
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "인증 메일 발송 중 에러 발생");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 이메일 인증 메일 전송 메소드
	public String mailSending(Model model) throws IOException{
		
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<6 ; i++) {
			sb.append((int)(Math.random()*10));
		}
		String random = sb.toString();
		Member member = (Member)model.getAttribute("signUpMember");
		String setfrom = "khblackgang@gmail.com"; // 보내는 이메일 계정
		String tomail = member.getMemberEmail(); // 받는 이메일 계정
		String title = "[PleaseSeatDown] 회원가입 인증 이메일 입니다."; // 메일 제목
		String content =
				System.getProperty("line.separator")+
				"안녕하세요 "+ member.getMemberName()+" 회원님, 저희 홈페이지를 찾아주셔서 감사합니다."+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"가입 인증번호는 " + random + " 입니다. "+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"해당 인증번호를 홈페이지에 입력하시면 회원가입이 완료됩니다."; // 메일 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			return random;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 이메일 인증번호 체크
	@RequestMapping(value="mailAuth", method=RequestMethod.POST)
	public String mailAuthentication(Model model,
			HttpServletRequest request,
			@RequestParam(value="mailAuthNumber", required=false) String authNumber,
			RedirectAttributes rdAttr) {
		try {
			String referer = request.getHeader("Referer"); // 이전 페이지로 가기 위해 Header의 referer 값 저장
			String view = null;
			if(authNumber.equals((String)model.getAttribute("code"))) {
				Member member = (Member)model.getAttribute("signUpMember");
				int result = memberService.mailAuth(member);
				if(result > 0) {
					model.addAttribute("msg","이메일 인증이 완료되었습니다.");
					view = "member/signUpComplete";
				}
			}else {
				rdAttr.addFlashAttribute("msg","인증번호가 일치하지 않습니다. 재발송된 인증번호로 인증을 다시 진행해주세요.");
				view = "redirect:"+referer;
			}
			return view;
		}catch (Exception e) {
			return ExceptionForward.errorPage("인증번호 체크", model, e);
		}
	}

	// 아이디 / 비밀번호 찾기 화면 전환
	@RequestMapping("forgotForm")
	public String forgotForm() {
		return "member/findIdPwd";
	}
	
	// 아이디 찾기
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(String memberName, 
			@RequestParam(value = "email1", required = false)String email1,
			@RequestParam(value = "email2", required = false)String email2,
			Model model, HttpServletRequest request,
			RedirectAttributes rdAttr) {
		String memberEmail = email1+"@"+email2;
		Member member = new Member("", memberName, memberEmail);
		try {
			String referer = request.getHeader("Referer");
			String view = null;
			String memberId = memberService.findId(member);
			
			if(memberId != null) {
				String maskId = memberId.substring(0, memberId.length()-3)+"***";
				model.addAttribute("memberEmail", memberEmail);
				model.addAttribute("memberId", memberId);
				model.addAttribute("maskId", maskId);
				view = "member/findIdResult";
			}else {
				model.addAttribute("msg", "입력한 정보가 유효하지 않습니다. 다시 입력해 주세요.");
				view = "redirect:"+referer;
			}
			return view;
		}catch (Exception e) {
			return ExceptionForward.errorPage("아이디 찾기", model, e);
		}
	}
	
	// 아이디 이메일 전송
	@RequestMapping(value="sendId", method=RequestMethod.POST)
	public String sendId(Model model, 
			String memberId, String memberEmail,
			RedirectAttributes rdAttr) throws IOException{
		
		String setfrom = "khblackgang@gmail.com"; // 보내는 이메일 계정
		String tomail = memberEmail; // 받는 이메일 계정
		String title = "[PleaseSeatDown] 아이디 찾기 메일입니다."; // 메일 제목
		String content =
				System.getProperty("line.separator")+
				"안녕하세요 회원님, 저희 홈페이지를 찾아주셔서 감사합니다."+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"회원님이 가입하신 아이디는 [" + memberId + "] 입니다. "+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"해당 아이디로 서비스 이용이 가능합니다."; // 메일 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
			rdAttr.addFlashAttribute("msg", "아이디 찾기 메일이 전송되었습니다.");
			return "redirect:forgotForm";
		}catch (Exception e) {
			return ExceptionForward.errorPage("아이디 메일 전송", model, e);
		}
	}
	
	// 회원 비밀번호 찾기
	@RequestMapping("findPwd")
	public ModelAndView findPwdForm(Model model, ModelAndView mv,
			@RequestParam(value = "email3", required = false)String email1,
			@RequestParam(value = "email4", required = false)String email2,
			String memberName, String memberId,
			RedirectAttributes rdAttr) {
		try {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder
					.currentRequestAttributes()).getRequest();
			String referer = request.getHeader("Referer");
			String memberEmail = email1+"@"+email2;
			Member member = new Member(memberId, memberName, memberEmail);
			int count = memberService.checkMemberInfo(member);
			
			if(count > 0) {
				String ip = request.getRemoteAddr();
				// 입력한 정보와 일치하는 회원이 존재하는 경우
				String key = ip;
				Map<String, Object> headers = new HashMap<String, Object>();
				headers.put("typ", "JWT"); // typ: 토큰타입
				headers.put("alg", "HS256"); // alg: 알고리즘(SHA256)
				
				// 만료시간 설정
				Map<String, Object> payloads = new HashMap<String, Object>();
				// payloads(내용): 원하는 데이터, 토큰 발급대상, 토큰 만료기간, 토큰 수령자 등 정보 작성
				SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				Date now = new Date();
				cal.setTime(now);
				cal.add(Calendar.MINUTE, 5);
				
				payloads.put("exp", cal.getTime());
				payloads.put("data", memberId);
				
				String jwt = Jwts.builder().setHeader(headers)
						.setClaims(payloads)
						.signWith(SignatureAlgorithm.HS256, key.getBytes())
						.compact();
				if(pwdmailSend(memberEmail, jwt)) {
					rdAttr.addFlashAttribute("msg", "비밀번호 재설정 링크가 발송되었습니다.");
				}
				mv.setViewName("redirect:forgotForm");
			}else {
				rdAttr.addFlashAttribute("msg", "입력한 정보가 유효하지 않습니다. 다시 입력해 주세요.");
				mv.setViewName("redirect:"+referer);
			}
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "회원 비밀번호 찾기 과정 중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 이메일 인증 메일 전송 메소드
	public boolean pwdmailSend(String memberEmail, String jwt) throws IOException{

		String setfrom = "khblackgang@gmail.com"; // 보내는 이메일 계정
		String tomail = memberEmail; // 받는 이메일 계정
		String title = "[PleaseSeatDown] 비밀번호 재설정 메일입니다."; // 메일 제목
		String content =
				System.getProperty("line.separator")+
				"안녕하세요 회원님, 저희 홈페이지를 찾아주셔서 감사합니다."+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"회원님의 비밀번호 재설정 링크는 다음과 같습니다. "+
				System.getProperty("line.separator")+
				"http://"+serverIp+":8080/plzSeatdown/member/resetPwdCheck?ut="+jwt+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"링크를 통해 비밀번호 변경 후 서비스를 이용해주시기 바랍니다."; // 메일 내용
			
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
				
			mailSender.send(message);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	// 비밀번호 재설정 링크
	@RequestMapping("resetPwdCheck")
	public String resetPwd(Model model,
			String ut, // userToken
			RedirectAttributes rdAttr) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder
				.currentRequestAttributes()).getRequest();
		String ip = request.getRemoteAddr();
		try {
			String view = null;
			Claims claims = Jwts.parser()
					.setSigningKey(ip.getBytes())
					.parseClaimsJws(ut)
					.getBody();
			
			Date now = new Date();
			SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			Calendar cal1 = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			cal1.setTime(now);
			cal2.setTimeInMillis((long)claims.get("exp"));
			
			if(cal1.getTimeInMillis() < cal2.getTimeInMillis()) {
				model.addAttribute("memberId", claims.get("data").toString());
				view = "member/resetPwdForm";
			}else {
				rdAttr.addFlashAttribute("msg", "유효시간이 만료되었습니다.");
				view = "redirect:forgotForm";
			}
			return view;
		}catch (Exception e) {
			return ExceptionForward.errorPage("비밀번호 재설정 페이지 변환", model, e);
		}
	}
	
	@RequestMapping(value="resetPwd", method = RequestMethod.POST)
	public String resetPwd(Member member,
			Model model, HttpServletRequest request,
			RedirectAttributes rdAttr) {
		String referer = request.getHeader("Referer");
		try {
			String view = null;
			int result = memberService.resetPwd(member);
			if(result > 0) {
				model.addAttribute("msg","비밀번호가 변경되었습니다.");
				view = "redirect:/";
			}else {
				rdAttr.addFlashAttribute("msg","비밀번호 변경 실패. 다시 시도해 주세요.");
				view = "redirect:"+referer;
			}
			return view;
		}catch (Exception e) {
			return ExceptionForward.errorPage("비밀번호 변경", model, e);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="kakaoLogin", produces="application/json; charset=utf-8")
	public String kakaoLogin(HttpSession session, 
			@RequestParam(value="memberId", required=true)String id,
			@RequestParam(value="memberNickname", required=true)String memberNickname) {
		String result = "-1";
		Member member = null;
		Member loginMember = null;
		String memberPwd = id;
		String memberId = "_k"+id;
		try {
			member = new Member(memberId, memberPwd);
			loginMember = memberService.loginMember(member);
			if(loginMember != null) {
				result = "1";
				session.setAttribute("loginMember", loginMember);
			}else {
				member = new Member(0, memberId, memberPwd, memberNickname);
				int signUp = memberService.kakaoSignUp(member);
				if(signUp > 0) {
					result = "-1";
					member = new Member(memberId, memberPwd);
					loginMember = memberService.loginMember(member);
					if(loginMember != null) {
						result = "1";
						session.setAttribute("loginMember", loginMember);
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			result = "-1";
		}
		return new Gson().toJson(result);
	}
}
