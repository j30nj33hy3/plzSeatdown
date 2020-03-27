package com.bg.plzSeatdown.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.admin.model.service.AdminNoticeService;
import com.bg.plzSeatdown.admin.model.vo.AdminNotice;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Member;


@Controller
@RequestMapping("/admin/notice/*")
@SessionAttributes({ "loginMember", "msg", "detailUrl" })
public class AdminNoticeController {

	@Autowired
	private AdminNoticeService adminNoticeService;

	/*
	 * ModelAndView 객체 - Model : 응답 페이지에 값(data)를 전달할 때 Map 형식으로 저장하여 전달하는 객체 - View
	 * : requestDispatcher를 이용한 페이지 이동 시 이동할 페이지의 정보(url)를 담는 객체
	 * 
	 * - ModelAndView : 컨트롤러 응답 처리 후 응답할 View와 View에 전달할 값을 저장하는 객체
	 */

	// 공지사항 목록 출력
	@RequestMapping("list")
	public String noticeList(Model model, @RequestParam(value = "searchKey", required = false) String searchKey,
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
			int listCount = adminNoticeService.getListCount(map);

			// 현재 페이지 계산
			if (currentPage == null)
				currentPage = 1; // Auto Boxing (작은게 큰거로)

			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);

			// 2. 공지사항 목록 조회
			List<AdminNotice> aNoticeList = adminNoticeService.selectList(map, pInf);

			model.addAttribute("aNoticeList", aNoticeList);
			model.addAttribute("pInf", pInf);
			return "admin/noticeList";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "공지사항 목록 조회 중 오류 발생");
			return "common/errorPage"; // url 경로
		}
	}

	// Model은 데이터만 주고받음

	// 공지사항 상세 조회
	@RequestMapping("detail")
	public String noticeDetail(Model model, @RequestParam(value = "no", required = false) Integer no) {
		try {
			AdminNotice adminNotice = adminNoticeService.selectNotice(no);
			if (adminNotice != null) {
				model.addAttribute("adminNotice", adminNotice);
				model.addAttribute("no", no);
//					mv.addObject("currentPage", currentPage);
			}

			return "admin/noticeDetail";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "공지사항 상세 조회중 오류 발생");
			return "common/errorPage"; // url 경로
		}
	}

	// 공지사항 작성 화면 이동
	@RequestMapping("insertForm")
	public String insertForm() {
		return "admin/noticeInsertForm";
	}

	// 공지사항 작성
	@RequestMapping("insertNotice")
	public String insertNotice(AdminNotice adminNotice, Model model, RedirectAttributes rdAttr) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		System.out.println(loginMember);

		adminNotice.setNoticeWriter(loginMember.getMemberNo());

		try {
			int result = adminNoticeService.insertNotice(adminNotice);

			String msg = null;
			String url = null;

			if (result > 0) {
				msg = "공지사항 작성 성공";
				url = "detail?no=" + result;

			} else {
				msg = "공지사항 작성 실패";
				url = "list";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "공지사항 작성 중 오류 발생");
			return "common/errorPage";
		}

	}

	// 공지사항 수정 화면 이동
	@RequestMapping("updateForm")
	public String updateForm(Integer no, Model model, HttpServletRequest request) {
		// 이전페이지(상세조회 페이지) 주소를 detailUrl에 저장
		String detailUrl = request.getHeader("referer");
		// Model의 scope -> request인데 @SessionAttributes에 추가하면 session

		// @SessionAttributes 에 "detailUrl" 추가 후 Session에 detailUrl 올리기
		model.addAttribute("detailUrl", detailUrl);

		try {
			// 1) 게시글 상세 조회
			AdminNotice adminNotice = adminNoticeService.selectNotice(no);

//			adminNotice.setNoticeContent(adminNotice.getNoticeContent().replace("<br>", "\r\n"));

			model.addAttribute("adminNotice", adminNotice);
			return "admin/noticeUpdateForm";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 수정 화면 전환 과정에서 오류 발생");
			return "common/errorPage"; 
		}
	}

	// 공지사항 수정
	@RequestMapping("update")
	public String updateNotice(AdminNotice adminNotice, Model model, Integer no, String noticeTitle, String content,
			RedirectAttributes rdAttr) {

		String detailUrl = (String) model.getAttribute("detailUrl");

		adminNotice.setNoticeNo(no);
		adminNotice.setNoticeTitle(noticeTitle);
		adminNotice.setNoticeContent(content);

		try {
			int result = adminNoticeService.updateNotice(adminNotice);
			String msg = null;
			
			if (result > 0) msg = "게시글 수정 성공";
			else			msg = "게시글 수정 실패";
			rdAttr.addFlashAttribute("msg", msg);
			
			return "redirect:" + detailUrl;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 수정 과정에서 오류 발생");
			return "common/errorPage";
		}
	}

	// 공지사항 삭제
	@RequestMapping("delete")
	public String deleteNotice(Integer no, Model model, RedirectAttributes rdAttr) {
		try {
			int result = adminNoticeService.deleteNotice(no);

			String msg = null;
			if (result > 0)
				msg = "공지사항 삭제 성공";
			else
				msg = "공지사항 삭제 실패";

			rdAttr.addFlashAttribute("msg", msg);

			return "redirect:list";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 삭제 과정 중 오류 발생");
			return "common/errorPage";
		}

	}

}
