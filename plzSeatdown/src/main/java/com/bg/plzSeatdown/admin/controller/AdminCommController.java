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
import com.bg.plzSeatdown.admin.model.service.AdminCommService;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/community/*")
public class AdminCommController {

	@Autowired
	private AdminCommService adminCommService;
	
	@RequestMapping("list")
	public String commList(Model model, 
			@RequestParam(value="currentPage", required=false) Integer currentPage, 
			@RequestParam(value="searchKey", required=false) String searchKey,
			@RequestParam(value="searchValue", required=false) String searchValue,
			@RequestParam(value="searchCategory", required=false) String searchCategory
			){
		try {
			Map<String, String> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
				map.put("searchCategory", searchCategory);
			}
			
		// 전체 게시글 수 조회
		int listCount = adminCommService.getListCount(map);
		
		// 현재 페이지 확인
		if(currentPage == null) currentPage = 1;
		
		// 페이지 정보 저장
		PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
		
		// 게시글 목록 조회
		List<Community> list = adminCommService.selectList(map, pInf);
		
		// 이미지 목록 조회
		//List<Attachment> iList = communityService.selectImageList(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pInf", pInf);
		//model.addAttribute("iList", iList);
		
		return "admin/community/communityList";
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "커뮤니티 관리 게시판 조회 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete")
	public String deleteComm(Model model, int no) {
		try {
			int result = adminCommService.deleteComm(no);
						
			if(result > 0) {
				model.addAttribute("no", no);
				model.addAttribute("msg", "게시글을 삭제했습니다.");
				return "admin/community/list";
			}else {
				model.addAttribute("msg", "게시글 삭제 실패");
				return "admin/community/list";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "커뮤니티 게시글 삭제 과정에서 오류 발생");
			return "common/errorPage";
		}
	}		
}
