package com.bg.plzSeatdown.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.main.service.MainService;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.review.model.vo.SeatReview;
import com.bg.plzSeatdown.review.model.vo.Show;

@Controller
@SessionAttributes({"loginMember","msg"})
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String selectShowing(Model model){
		List<Show> showList = null;		
		List<Show> comingList = null;
		List<SeatReview> nList = null;
		
		// Session에서 회원번호 얻어오기
	      Member loginMember = (Member)model.getAttribute("loginMember");
	      int memberNo = 0;
	      
	      if(loginMember == null) memberNo = 0;
	      else 					memberNo = loginMember.getMemberNo();
	      
		try {
			showList = mainService.selectShowing();
			//System.out.println(showList);
			model.addAttribute("showList", showList);
			//return showList;				
			comingList = mainService.comingShowing();
			model.addAttribute("comingList", comingList);
			
			nList = mainService.selectNlist(memberNo);
			model.addAttribute("nReview", nList);
			
		}catch(Exception e) {
			e.printStackTrace();
			ExceptionForward.errorPage("메인 화면 출력 오류", model, e);
			
		}		
		return "index";
	}
}
