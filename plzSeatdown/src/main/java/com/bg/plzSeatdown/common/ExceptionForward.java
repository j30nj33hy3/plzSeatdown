package com.bg.plzSeatdown.common;

import org.springframework.ui.Model;

public class ExceptionForward {
	
	public static String errorPage(String errorMsg, Model model, Exception e) {
		e.printStackTrace();
		model.addAttribute("errorMsg", errorMsg + " 과정에서 오류가 발생하였습니다.");
		return "common/errorPage";
	}

}
