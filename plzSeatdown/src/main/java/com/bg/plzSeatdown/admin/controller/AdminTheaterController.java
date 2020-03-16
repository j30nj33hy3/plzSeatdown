package com.bg.plzSeatdown.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.admin.model.service.AdminTheaterService;
import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/theater/*")
public class AdminTheaterController {

		@Autowired
		private AdminTheaterService adminTheaterService;
		
		// 공연장 화면으로 이동하여 공연장 리스트 출력
		@RequestMapping("list")
		public String theaterList(Model model, 
								@RequestParam(value="currentPage", required=false) Integer currentPage,
								@RequestParam(value="searchTheater", required=false) String searchTheater) {
			
			try {
				
				String searchValue = null;
				
				// 검색 조건이 있는지 확인하여 변수에 저장
				if(searchTheater != null) {
					searchValue = searchTheater;
				}
				
				// 전체 공연시설장 수 조회
				int theaterCount = adminTheaterService.getTheaterCount(searchValue);
				
				// 현재 페이지 확인
				if(currentPage == null) currentPage = 1;
				
				// 페이지 정보 저장
				PageInfo pInf = Pagination.getPageInfo(9, 5, currentPage, theaterCount);
				
				// 공연시설장 목록 조회
				List<Theater> list = adminTheaterService.selectList(searchValue, pInf);
				
				model.addAttribute("list", list);
				model.addAttribute("pInf", pInf);
				
				return "admin/theater";
				
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "공연장 목록 조회중 오류 발생");
				return "common/errorPage";
			}
		}
		
}
