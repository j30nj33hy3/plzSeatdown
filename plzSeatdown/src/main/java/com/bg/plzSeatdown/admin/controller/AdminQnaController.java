package com.bg.plzSeatdown.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.admin.model.service.AdminQnaService;
import com.bg.plzSeatdown.admin.model.vo.AdminQna;
import com.bg.plzSeatdown.admin.model.vo.AdminQnaAnswer;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;


@RequestMapping("/admin/qna/*")
@SessionAttributes({"msg"})
@Controller
public class AdminQnaController {

	@Autowired
	private AdminQnaService adminQnaService;
	
	// QnA 목록 출력
	@RequestMapping("list")
	public ModelAndView qnaList(ModelAndView mv,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		try {
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, String> map = null;
			if (searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
			}
			// 1. 전체 공지사항 게시글 수 조회(페이징 처리를 위해서)
			int listCount = adminQnaService.getListCount(map);

			// 현재 페이지 계산
			if (currentPage == null)
				currentPage = 1; // Auto Boxing (작은게 큰거로)

			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);

			List<AdminQna> qlist = adminQnaService.selectList(map, pInf);
				
			mv.addObject("qlist", qlist);
			mv.addObject("pInf", pInf);
			mv.setViewName("admin/qnaList");

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "공지사항 목록 조회 중 오류 발생");
			mv.setViewName("common/errorPage"); // url 경로
		}
		return mv;
	}

	// QnA 상세 조회
	@RequestMapping("detail")
	public ModelAndView selectQna(ModelAndView mv, @RequestParam(value = "no", required = false) Integer no) {
//		System.out.println(no);
		try {
		AdminQna qna = adminQnaService.selectQna(no);
			if (qna != null) {
				mv.addObject("qna", qna);
				mv.addObject("no", no);
				mv.setViewName("admin/qnaDetail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "공지사항 상세 조회 중 오류 발생");
			mv.setViewName("common/errorPage"); // url 경로
		}
		return mv;
	}
	
	// QNA 답변 등록
	@RequestMapping("update")
	public String insertAnswer(Integer no, String answer, Model model, RedirectAttributes rdAttr) {
		
		AdminQnaAnswer adminQnaAnswer = new AdminQnaAnswer();
		adminQnaAnswer.setQnaNo(no);
		adminQnaAnswer.setQnaAnswer(answer.replace("<br>", "\r"));

//		System.out.println("컨트롤러" + adminQnaAnswer);
		
		try {
			int result = adminQnaService.insertAnswer(adminQnaAnswer);
			
			String msg = null;
			String url = null;
			
			if(result > 0) {
				msg="답변이 등록되었습니다.";
				url="detail?no="+no;
				model.addAttribute("asnwer", answer);
			} else {
				msg = "답변이 등록되지 않았습니다.";
				url = "list";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;

//			return ("redirect:detail");

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "문의 내역 답변 등록 중 오류 발생");
			return ("common/errorPage");
		}
		
	}
	
	// QNA 삭제
	@RequestMapping("delete")
	public String deleteQna(Integer no, Model model, RedirectAttributes rdAttr) {
		try {
			int result = adminQnaService.deleteQna(no);
			
			String msg = null;
			if(result > 0) msg="문의 내역 삭제 성공";
			else 		msg="문의 내역 삭제 실패"; 
			
			rdAttr.addFlashAttribute("msg", msg);
			
			return "redirect:list";

		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "문의 내역 삭제 과정 중 오류 발생");
			return "common/errorPage";
		}
		
	}


}
