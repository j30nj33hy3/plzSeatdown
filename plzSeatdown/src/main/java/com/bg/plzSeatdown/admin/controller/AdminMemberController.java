package com.bg.plzSeatdown.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminMemberController {

	@RequestMapping("member_list")
	public String memberList() {
		return "admin/member_list";
	}
	
	@RequestMapping("member_detail")
	public String memberDetail() {
		return "admin/member_detail";
	}

	@RequestMapping("member_qna")
	public String memberQna() {
		return "admin/member_qna";
	}
	
	@RequestMapping("member_qna_detail")
	public String memberQnaDetail() {
		return "admin/member_qna_detail";
	}
	
}
