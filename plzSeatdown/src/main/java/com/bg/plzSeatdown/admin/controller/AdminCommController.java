package com.bg.plzSeatdown.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminCommController {

	//@Autowired
	//private AdminService adminService;
	
	@RequestMapping("community")
	public String community() {
		return "admin/community";
	}
}
