package com.bg.plzSeatdown.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.community.model.service.CommunityService;

@Controller
@RequestMapping("/community/*")
@SessionAttributes({"loginMember","msg"})
public class CommunityController {

//	@Autowired
//	private CommunityService communityService;
	
	// 커뮤니티 게시판 목록 출력
	@RequestMapping("list")
	public String communityList() {
		return "community/communityList";
	}
	
	// 커뮤니티 상세 조회
	
	
	// 글 등록 페이지로 이동
	@RequestMapping("insertForm")
	public String insertForm() {
		return "community/communityInsert";
	}
	
	// 글 등록
	
	
	// 글 수정
	
	
	// 글 삭제
}
