package com.bg.plzSeatdown.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.admin.model.service.AdminShowService;
import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/show/*")
public class AdminShowController {

	@Autowired
	private AdminShowService adminShowService;
	
	// 공연장 화면으로 이동하여 공연장 리스트 출력
	@RequestMapping("list")
	public String showList(Model model, 
							@RequestParam(value="currentPage", required=false) Integer currentPage,
							@RequestParam(value="searchShow", required=false) String searchShow) {
		
		try {
			
			String searchValue = null;
			
			// 검색 조건이 있는지 확인하여 변수에 저장
			if(searchShow != null) {
				searchValue = searchShow;
			}
			
			// 전체 공연 수 조회
			int showCount = adminShowService.getShowCount(searchValue);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(8, 5, currentPage, showCount);
			
			// 공연 목록 조회
			List<Show> list = adminShowService.selectList(searchValue, pInf);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			
			return "admin/show";
			
		}catch(Exception e) {
			return ExceptionForward.errorPage("공연 리스트 출력", model, e);
		}
	}
}
