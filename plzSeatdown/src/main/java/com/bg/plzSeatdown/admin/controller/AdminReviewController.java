package com.bg.plzSeatdown.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminReviewController {
	
	//@Autowired
	//private AdminService adminService;
	
	@RequestMapping("review")
	public String review() {
		return "admin/review";
	}

}
