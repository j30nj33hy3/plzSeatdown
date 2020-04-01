package com.bg.plzSeatdown.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.login.common.NaverLoginBO;
import com.bg.plzSeatdown.member.model.service.MemberService;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller
@RequestMapping("/login/*")
@SessionAttributes({"loginMember", "msg"})
public class LoginController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value="naverLogin", method= {RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "login/naverLogin";
	}
	
	@RequestMapping(value="naverCallback", method= {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException{
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject)obj;
		
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		String id = (String)response_obj.get("id");
		String memberNickname = (String)response_obj.get("nickname");
		String memberEmail = (String)response_obj.get("email");
		String memberName = (String)response_obj.get("name");
		
		int result = 0;
		Member member = null;
		Member loginMember = null;
		String memberPwd = id;
		String memberId = "_n"+id;
		try {
			int count = memberService.idDupCheck(memberId);
			if(count > 0) {
				session.setAttribute("loginMember", loginMember);
			}else {
				member = new Member(memberId, memberPwd, memberName, memberNickname, memberEmail);
				result = memberService.naverSignUp(member);
				if(result > 0) {
					result = 0;
					member = new Member(memberId, memberPwd);
					loginMember = memberService.loginMember(member);
					if(loginMember != null) {
						session.setAttribute("loginMember", loginMember);
					}
				}
			}
			return "redirect:/";
		}catch (Exception e) {
			return ExceptionForward.errorPage("네이버 로그인", model, e);
		}
	}
}
