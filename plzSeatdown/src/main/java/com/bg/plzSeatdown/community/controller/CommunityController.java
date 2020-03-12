package com.bg.plzSeatdown.community.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.FileRename;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.service.CommunityService;
import com.bg.plzSeatdown.community.model.vo.Community;
import com.sun.xml.internal.ws.api.message.Attachment;

@Controller
@RequestMapping("/community/*")
@SessionAttributes({"loginMember","msg"})
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	// 커뮤니티 게시판 목록 출력
	@RequestMapping("list")
	public String communityList(Model model,
			@RequestParam(value="currentPage", required=false) Integer currentPage,
			@RequestParam(value="searchKey", required=false) String searchKey,
			@RequestParam(value="searchValue", required=false) String searchValue,
			@RequestParam(value="searchCategory", required=false) String searchCategory) {
		
		try {
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, String> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchValue);
				map.put("searchValue", searchValue);
				map.put("searchCategory", searchCategory);
			}
			
			// 전체 게시글 수 조회
			int listCount = communityService.getListCount(map);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
			
			// 게시글 목록 조회
			List<Community> list = communityService.selectList(map, pInf);
			
			// 이미지 목록 조회
			//List<Attachment> iList = communityService.selectImageList(list);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			//model.addAttribute("iList", iList);
			
			return "community/communityList";
		}catch(Exception e) {
			return ExceptionForward.errorPage("게시글 목록 조회", model, e);
		}
	}
	
	// 커뮤니티 상세 조회
	
	
	// 글 등록 페이지로 이동
	@RequestMapping("insertForm")
	public String insertForm() {
		return "community/communityInsert";
	}

	/*
	// 이미지 등록
	@RequestMapping("insertImage")
	public String insertImage(@RequestParam(value="file", required=false) List<MultipartFile> images,
							Model model,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/communityImages";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) folder.mkdir();
		
		try {
			//List<Attachment> files = new ArrayList<Attachment>();
			//Attachment at = null;

			String changeFileName = null;
			
			for(MultipartFile mf : images) {
				if(!mf.getOriginalFilename().equals("")) {
					changeFileName = FileRename.rename(mf.getOriginalFilename());
				}
			}
			
			String uploadFile = savePath + "/" + changeFileName;
			response.getWriter().print(uploadFile);
		}catch(Exception e) {
			return ExceptionForward.errorPage("이미지 등록", model, e);
		}
	}*/
	
	
	// 글 등록
	
	
	// 글 수정
	
	
	// 글 삭제
}
