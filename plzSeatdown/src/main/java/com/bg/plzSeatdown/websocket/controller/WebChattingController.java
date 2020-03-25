package com.bg.plzSeatdown.websocket.controller;

import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bg.plzSeatdown.member.model.service.MemberService;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;
import com.bg.plzSeatdown.websocket.model.service.WebChattingService;

@SessionAttributes({"loginMember","msg"})
@Controller
public class WebChattingController {

	private Logger logger=LoggerFactory.getLogger(WebChattingController.class);
	
	@Autowired private WebChattingService webChattingService;
	
	@RequestMapping(value="/index2")
	public String intoChat(Model model){
		
		Member loginMember = (Member)model.getAttribute("loginMember");
	try {	
		Member member = webChattingService.selectNickName(loginMember.getMemberNo());
		Profile image = webChattingService.selectProfileProp(member.getMemberNo());
		
		model.addAttribute("member", member);
		model.addAttribute("profile", image);
		
		return "index2";
		
	}catch(Exception e) {
		e.printStackTrace();
		model.addAttribute("errorMsg", "채팅 입장 페이지 오류");
		return "error/common";		
	}
		
	}
	@RequestMapping(value="/chatting.do", method=RequestMethod.POST)
	public ModelAndView chat(ModelAndView mv, String nickName, HttpServletRequest request, HttpSession session) throws Exception
	{
		
			request.setCharacterEncoding("UTF-8");	
			session.setAttribute("nickName", nickName);
			//System.out.println("controller : "+session.getAttribute("userName"));
			String host=request.getRemoteAddr();
			System.out.println("host주소 :"+host);
			mv.addObject("host",host);
			
			//출력할 뷰 선택
			mv.setViewName("chat/chattingView");	
			
			return mv;	
	}
	
}
 