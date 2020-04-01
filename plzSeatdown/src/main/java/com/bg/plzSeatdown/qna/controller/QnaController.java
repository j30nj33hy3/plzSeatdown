package com.bg.plzSeatdown.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.qna.model.service.QnAService;
import com.bg.plzSeatdown.qna.model.vo.QnA;

@Controller
@RequestMapping("/qna/*")
@SessionAttributes({"loginMember","msg"})
public class QnaController {

	@Autowired
	private QnAService qnaService;
	
	// qna 페이지 출력
	@RequestMapping("list")
	public String qnaList() {
		return "qna/qnaList";
	}
	
	// 문의 등록
	@RequestMapping("insert")
	public String insertQnA(QnA qna, Model model,
			@RequestParam(value="qnaContent") String content,
			RedirectAttributes rdAttr) {
		int qnaWriter = ((Member)model.getAttribute("loginMember")).getMemberNo();
		
		qna.setQnaContent(content);
		qna.setQnaWriter(qnaWriter);
		
		try {
			int result = qnaService.insertQnA(qna);
			String msg = null;
			String path = null;
			if(result>0) {
				msg = "문의가 등록되었습니다. 등록하신 문의는 마이페이지에서 확인가능합니다.";
			}else {
				msg = "문의 등록 실패";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:list";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "문의 등록 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
}
