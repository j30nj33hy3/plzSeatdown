package com.bg.plzSeatdown.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminReportController {

	//@Autowired
	//private AdminService adminService;
	
	@RequestMapping("review_report")
	public String reviewReport() {
		return "admin/review_report";
	}
	
	@RequestMapping("comm_report")
	public String commReport() {
		return "admin/comm_report";
	}
	
	@RequestMapping("reply_report")
	public String replyReport() {
		return "admin/reply_report";
	}

}
