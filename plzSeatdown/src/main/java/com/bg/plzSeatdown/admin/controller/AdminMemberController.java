package com.bg.plzSeatdown.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.admin.model.service.AdminMemberService;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@SessionAttributes({ "msg" })
@Controller
@RequestMapping("/admin/member/*")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;

	// 회원 목록 조회
	@RequestMapping("list")
	public ModelAndView memberList(ModelAndView mv,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {
		try {
			Map<String, String> map = null;

			if (searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
			}

			int listCount = adminMemberService.getListCount(map);

			if (currentPage == null)
				currentPage = 1;

			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);

			List<Member> list = adminMemberService.selectList(map, pInf);

			mv.addObject("list", list);
			mv.addObject("pInf", pInf);
			mv.setViewName("admin/memberList");

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "회원 목록 조회 중 오류 발생");
			mv.setViewName("common/errorPage");

		}
		return mv;
	}

	// 회원 상세보기 페이지로 이동
	@RequestMapping("detail")
	public String memberDetail(Integer no, Model model, RedirectAttributes rdAttr) {

		try {
			Member member = adminMemberService.selectMember(no);
			if (member != null) {
				Attachment attachment = adminMemberService.selectImg(no);
				if (attachment != null) {
					model.addAttribute("attachment", attachment);
				}
				model.addAttribute("member", member);
			}
			return "admin/member_detail";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 정보 조회 과정에서 오류 발생");
			return "common/errorPage";
		}
	}

	// 회원 정보 수정
	@RequestMapping("updateMember")
	public String updateMember(Integer no, String name, String nickname, String email, Model model,
			RedirectAttributes rdAttr) {

		try {
			Member member = new Member();
			member = adminMemberService.selectMember(no);

			member.setMemberName(name);
			member.setMemberNickname(nickname);
			member.setMemberEmail(email);

			int result = adminMemberService.updateMember(member);

			String msg = null;
			String url = null;

			if (result > 0) {
				msg = "회원 정보 수정 성공";
				url = "detail?no=" + member.getMemberNo();
			} else {
				msg = "회원 정보 수정 실패";
				url = "list";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 정보 수정 과정에서 오류 발생");
			return "common/errorPage";
		}
	}

	// 프로필 사진 삭제
	@RequestMapping("deleteImg")
	public String deleteImg(Integer no, Model model, RedirectAttributes rdAttr) {
		try {
			int result = 0;
			result = adminMemberService.deleteImg(no);

			String msg = null;
			if (result > 0)
				msg = "기본 이미지로 변경되었습니다.";
			else
				msg = "기본 이미지로 변경이 실패하였습니다.";

			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:detail?no=" + no;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "기본 이미지로 변경하는 과정에서 오류 발생");
			return "common/errorPage";

		}

	}

	// 회원 삭제
	@RequestMapping("delete")
	public String deleteMember(Integer no, Model model, RedirectAttributes rdAttr) {
		try {
			int result = adminMemberService.deleteMember(no);

			String msg = null;
			if (result > 0)
				msg = "회원 삭제 성공";
			else
				msg = "회원 삭제 실패";

			rdAttr.addFlashAttribute("msg", msg);

			return "redirect:list";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 삭제 과정 중 오류 발생");
			return "common/errorPage";
		}

	}

	
	// 신고횟수 순 정렬
	@RequestMapping("sortList")
	public String sortList(Model model, @RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) { 

		
		try {
			Map<String, String> map = null;

			if (searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
			}

			int listCount = adminMemberService.getListCount(map);
			if (currentPage == null)
				currentPage = 1;

			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
			List<Member> sList = adminMemberService.selectSortList(map, pInf);

			model.addAttribute("sList", sList);
			model.addAttribute("pInf", pInf);
			return "admin/memberSortList";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 목록 정렬 과정 중 오류 발생");
			return "common/errorPage";
			
		}
	}
	
	
	@ResponseBody
	@RequestMapping("nicknameDupCheck")
	public String nicknameDupCheck(String memberNickname, Model model) { //return을 위한 model
		try {
			return adminMemberService.nicknameDupCheck(memberNickname) == 0 ? true+"" : false+""; 
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "아이디 중복체크 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("emailDupCheck")
	public String emailDupCheck(String memberEmail, Model model) {
		try {
			return adminMemberService.emailDupCheck(memberEmail) == 0 ? true+"" : false+"";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "이메일 중복체크 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
}
