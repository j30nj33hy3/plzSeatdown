package com.bg.plzSeatdown.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.notice.model.service.NoticeService;
import com.bg.plzSeatdown.notice.model.vo.Notice;


@Controller
@RequestMapping("/notice/*")
@SessionAttributes({"loginMember","msg"})
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/* ModelAndView 객체
	 * - Model : 응답 페이지에 값(data)를 전달할 때 Map 형식으로 저장하여 전달하는 객체
	 * - View : requestDispatcher를 이용한 페이지 이동 시 이동할 페이지의 정보(url)를 담는 객체
	 * 
	 * - ModelAndView
	 * 	: 컨트롤러 응답 처리 후 응답할 View와 View에 전달할 값을 저장하는 객체
	 * */
	
	// 공지사항 목록 출력
	@RequestMapping("list")
	public ModelAndView noticeList(ModelAndView mv,
			@RequestParam(value="searchKey", required=false) String searchKey,
			@RequestParam(value="searchValue", required=false) String searchValue,
			@RequestParam(value="currentPage", required=false) Integer currentPage) {
		// currentPage
		// searchKey
		// searchValue
		// 다 넘어올수도 아닐수도 있음
		// int i = currentPage; // Integer -> 바로 int로 사용 가능 Auto unboxing
		try {
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, String> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
			}
			
			// 1. 전체 공지사항 게시글 수 조회(페이징 처리를 위해서)
			int listCount = noticeService.getListCount(map);
			
			// 현재 페이지 계산
			if(currentPage == null) currentPage = 1; // Auto Boxing (작은게 큰거로)
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
			
			// 2. 공지사항 목록 조회
			List<Notice> list = noticeService.selectList(map, pInf);
			
//			for(Notice n:list) {
//				System.out.println(n);
//			}
			
			mv.addObject("list", list);
			mv.addObject("pInf", pInf);
			mv.setViewName("notice/noticeList");
			
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "공지사항 목록 조회중 오류 발생");
			mv.setViewName("common/errorPage"); // url 경로
		}
		return mv;
	}
	// Model은 데이터만 주고받음
	
	// 공지사항 상세 조회
	@RequestMapping("detail")
	public ModelAndView noticeDetail(ModelAndView mv, 
			@RequestParam(value="no", required=false) Integer no) {
		try {
			Notice notice = noticeService.selectNotice(no);
			if(notice!=null) {
				mv.addObject("notice", notice);
				mv.addObject("no", no);
//				mv.addObject("currentPage", currentPage);
				mv.setViewName("notice/noticeDetail");
			}
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "공지사항 상세 조회중 오류 발생");
			mv.setViewName("common/errorPage"); // url 경로
		}
		return mv;
	}
	
}
