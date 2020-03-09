package com.bg.plzSeatdown.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//@Autowired
	//private AdminService adminService;
	
	@RequestMapping("dashBoard")
	public String dashBoard() {
		return "admin/dashBoard";
	}

}
