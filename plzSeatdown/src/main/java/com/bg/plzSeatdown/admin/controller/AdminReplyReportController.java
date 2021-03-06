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

import com.bg.plzSeatdown.admin.model.service.AdminReplyReportService;
import com.bg.plzSeatdown.admin.model.vo.AdminReplyReport;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/reply_report/*")
public class AdminReplyReportController {
	
	@Autowired
	private AdminReplyReportService adminReplyReportService;
	
	@RequestMapping("list")
	public String replyRerpotList(Model model, 
			@RequestParam(value="currentPage", required=false) Integer currentPage, 
			@RequestParam(value="searchKey", required=false) String searchKey,
			@RequestParam(value="searchValue", required=false) String searchValue			
			){
		
		try {
			Map<String, String> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);	
				
				System.out.println(map);
			}
			
			// 전체 게시글 수 조회
			int listCount = adminReplyReportService.getListCount(map);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
			
			// 게시글 목록 조회
			List<AdminReplyReport> list = adminReplyReportService.selectList(map, pInf);
					
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			
			return "admin/reply_report";
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "커뮤니티 관리 게시판 조회 과정에서 오류 발생");
			return "common/errorPage";
		}
				
	}
	
	@RequestMapping("updateRpCnt")
	public String updateRpCnt(Model model, int no, int reportNo) { 

		try {
			int result = adminReplyReportService.updateRpCnt(no, reportNo);
						
			if(result > 0) {
				model.addAttribute("no", no);
				return "redirect:list";
				
			}else {
				model.addAttribute("msg", "신고처리 업데이트를 실패했습니다.");
				return "redirect:list";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "댓글 신고글 처리 과정에서 오류 발생");
			return "common/errorPage";
		}
	}	
}
