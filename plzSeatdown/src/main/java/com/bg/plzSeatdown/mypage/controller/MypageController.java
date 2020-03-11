/*
package com.bg.plzSeatdown.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.service.MypageService;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/mypage/*") 
public class MypageController {
 
	@Autowired private MypageService mypageService;
	
	
	// 마이페이지 조회
	@RequestMapping("mypage") public String mypage(Model model) {

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		try {
			
			Member member = mypageService.selectMypage(loginMember.getMemberNo());
			model.addAttribute("member", member);
			return "mypage/mypage";
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "마이페이지 조회 과정에서 오류 발생");
			return "common/erroPage";
		}

	}

}
*/
