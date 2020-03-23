package com.bg.plzSeatdown.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.service.CommunityService;
import com.bg.plzSeatdown.community.model.vo.Community;
import com.bg.plzSeatdown.community.model.vo.Reply;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/community/*")
@SessionAttributes({"loginMember","msg","detailUrl"})
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
		
		if(searchCategory !=null && searchCategory.equals("")) {
			searchCategory = null;
		}
		try {
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, Object> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, Object>();
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
			
			// 이미지 여부 조회
			//List<Community> iList = communityService.selectImageList(list);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			//model.addAttribute("iList", iList);
			
			return "community/communityList";
		}catch(Exception e) {
			return ExceptionForward.errorPage("게시글 목록 조회", model, e);
		}
	}
	
	// 커뮤니티 상세 조회
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String communityDetail(Integer no,
								Model model,
								RedirectAttributes rdAttr,
								HttpServletRequest request,
								@RequestParam(value="currentPage", required=false) Integer currentPage,
								@RequestParam(value="searchKey", required=false) String searchKey,
								@RequestParam(value="searchValue", required=false) String searchValue,
								@RequestParam(value="searchCategory", required=false) String searchCategory) {
		String beforeUrl = request.getHeader("referer");
		
		if(searchCategory !=null && searchCategory.equals("")) {
			searchCategory = null;
		}
		try {
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, Object> map = null;
			map = new HashMap<String, Object>();
			map.put("no",no);
			if(searchKey != null && searchValue != null) {
				map.put("searchKey", searchValue);
				map.put("searchValue", searchValue);
				map.put("searchCategory", searchCategory);
			}
			
			//System.out.println("no : " + no);
			//System.out.println("searchCategory : " + searchCategory);
			// 전체 게시글 수 조회
			int listCount = communityService.getListCount(map);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
			
			// 게시글 목록 조회
			List<Community> list = communityService.selectList(map, pInf);
			
			Community community = communityService.selectCommunity(map);
			//System.out.println(community);
			if(community != null) {
				// 조회수 증가
				int result = communityService.increaseCount(no);
				community.setCommunityCount(community.getCommunityCount()+1);
				
				model.addAttribute("community", community);
				model.addAttribute("list", list);
				model.addAttribute("pInf", pInf);
				return "community/communityDetail";
			}else {
				rdAttr.addFlashAttribute("msg", "글 상세 조회 실패");
				return "redirect:"+beforeUrl;
			}
		}catch(Exception e) {
			return ExceptionForward.errorPage("글 상세 조회", model, e);
		}
	}
	
	// 글 등록 페이지로 이동
	@RequestMapping("insertForm")
	public String insertForm() {
		return "community/communityInsert";
	}

	/*
	// 이미지 등록
	@RequestMapping("insertImage")
	@ResponseBody
	public ResponseEntity<?> insertImage(@RequestParam(value="uploadFile", required=false) MultipartFile multipartFile,
							HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/communityImages";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) folder.mkdir();
		
		String originFileName = multipartFile.getOriginalFilename();
		String changeFileName = FileRename.rename(originFileName);
		
		File file = new File(savePath+"/"+changeFileName);
		
		try {
			multipartFile.transferTo(file);
			
			//jsonObject.addProperty("url", request.getContextPath()+"/resuorces/communityImages/"+changeFileName);
			//jsonObject.addProperty("responseCode", "success");
			return ResponseEntity.ok().body(savePath+"/"+changeFileName);
		}catch(Exception e) {
			//FileUtils.deleteDirectory(file); //저장된 파일 삭제
			//jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
	}
	*/
	
	
	// 글 등록
	@RequestMapping("insert")
	public String insertCommunity(Community community,
								Model model, RedirectAttributes rdAttr) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		int communityWriter= loginMember.getMemberNo();
		
		community.setCommunityWriter(communityWriter);
		
		try {
			int result = communityService.insertCommunity(community);
			
			String msg = null;
			String url = null;
			if(result>0) {
				url = "detail?no="+result+"&currentPage=1";
			}else {
				msg = "글 등록 실패";
				url = "list";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:"+url;
		}catch(Exception e) {
			return ExceptionForward.errorPage("글 등록 과정", model, e);
		}
	}
	
	// 글 수정 화면으로 이동
	@RequestMapping("updateForm")
	public String updateForm(Integer no, Model model, HttpServletRequest request) {
		String detailUrl = request.getHeader("referer");
		
		model.addAttribute("detailUrl", detailUrl);
		
		try {
			Community community = communityService.selectCommunity(no);
			
			model.addAttribute("community", community);
			return "community/communityUpdate";
		}catch(Exception e) {
			return ExceptionForward.errorPage("글 수정 화면 이동", model, e);
		}
	}
	
	// 글 수정
	@RequestMapping("update")
	public String updateCommunity(Integer no, Community community, Model model,
								RedirectAttributes rdAttr) {
		String detailUrl = (String)model.getAttribute("detailUrl");
		community.setCommunityNo(no);
		try {
			int result = communityService.updateCommunity(community);
			
			String msg = null;
			if(result>0) msg = "글을 수정했습니다.";
			else		msg = "수정을 실패했습니다.";
			rdAttr.addFlashAttribute("msg", msg);
			
			return "redirect:"+detailUrl;
		}catch(Exception e) {
			return ExceptionForward.errorPage("게시글 수정", model, e);
		}
	}
	
	// 글 삭제
	@RequestMapping("delete")
	public String deleteCoummunity(Integer no, Model model, HttpServletRequest request, 
									RedirectAttributes rdAttr) {
		try {
			int result = communityService.deleteCommunity(no);
			String msg = null;
			String url = null;
			if(result>0) {
				msg = "삭제되었습니다.";
				url = "redirect:list";
			}else {
				msg = "삭제 실패";
				// 이전페이지 (상세조회 페이지) 주소 저장
				String prevUrl = request.getHeader("referer");
				url = "redirect:"+prevUrl;
			}
			return url;
		}catch(Exception e) {
			return ExceptionForward.errorPage("게시글 삭제", model, e);
		}
	}
	
	// 부모 댓글 등록 
	@ResponseBody
	@RequestMapping(value="insertReply", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	public int insertReply(Reply reply) {
		int result = 0;
		try {
			result = communityService.insertReply(reply);
		}catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	// 댓글 조회
	@ResponseBody
	@RequestMapping(value="selectReplyList", produces="application/json; charset=utf-8")
	public String selectReplyList(int communityNo) {
		List<Reply> rList = communityService.selectReplyList(communityNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
		return gson.toJson(rList);
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping("updateReply")
	public int updateReply(Reply reply) {
		int result = 0;
		try {
			result = communityService.updateReply(reply);
		}catch(Exception e){
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	// 자식 댓글 등록
	@ResponseBody
	@RequestMapping("insertReReply")
	public int insertReReply(Reply reply) {
		int result = 0;
		try {
			result = communityService.insertReReply(reply);
		}catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteReply")
	public int deleteReply(Reply reply) {
		int result = 0;
		try {
			result = communityService.deleteReply(reply);
		}catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	// 커뮤니티 신고
	@RequestMapping("communityReport")
	public String communityReport(Community community,
								Model model,
								RedirectAttributes rdAttr,
								HttpServletRequest request) {
		//System.out.println(community.getCommunityReportContent());
		String referer= request.getHeader("Referer");
		int result = 0;
		try {
			result = communityService.insertCommunityReport(community);
			String msg = null;
			if(result>0) msg = "해당 글을 신고했습니다.";
			else if(result == -1) msg = "이미 신고한 게시글입니다."; 
			else msg = "신고 실패";
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:"+referer;
		}catch(Exception e) {
			return ExceptionForward.errorPage("글 상세 조회", model, e);
		}
	}
	
	// 댓글 신고
	@RequestMapping("replyReport")
	public String communityReport(Reply reply,
								Model model,
								RedirectAttributes rdAttr,
								HttpServletRequest request) {
		String referer= request.getHeader("Referer");
		int result = 0;
		try {
			result = communityService.insertReplyReport(reply);
			String msg = null;
			if(result>0) msg = "해당 댓글을 신고했습니다.";
			else if(result == -1) msg = "이미 신고한 댓글입니다."; 
			else msg = "신고 실패";
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:"+referer;
		}catch(Exception e) {
			return ExceptionForward.errorPage("글 상세 조회", model, e);
		}
	}
}
