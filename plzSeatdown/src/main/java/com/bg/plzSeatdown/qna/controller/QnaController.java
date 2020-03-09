package com.bg.plzSeatdown.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/qna/*")
@SessionAttributes({"loginMember","msg"})
public class QnaController {

	
	// qna 페이지 출력
	@RequestMapping("list")
	public String qnaList() {
		return "qna/qnaList";
	}
	
}
