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

import com.bg.plzSeatdown.admin.model.service.AdminReviewService;
import com.bg.plzSeatdown.admin.model.vo.AdminReview;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/review/*")
public class AdminReviewController {
	
	@Autowired
	private AdminReviewService adminReviewService;
	
	@RequestMapping("list")
	public String reviewList(Model model, 
			@RequestParam(value="currentPage", required=false) Integer currentPage, 
			@RequestParam(value="searchKey", required=false) String searchKey,
			@RequestParam(value="searchValue", required=false) String searchValue){
		
		try {
			Map<String, String> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey",searchKey);
				map.put("searchValue",searchValue);				
			}
			
			// 전체 게시글 수 조회
			int listCount = adminReviewService.getListCount(map);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
			
			// 게시글 목록 조회
			List<AdminReview> list = adminReviewService.selectList(map, pInf);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			
			return "admin/review/reviewList";
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "리뷰 관리 게시글 조회 과정 중 오류 발생");
			return "common/errorPage";
		}	
	}
}
