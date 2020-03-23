package com.bg.plzSeatdown.review.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.service.ReviewService;
import com.bg.plzSeatdown.review.model.vo.Show;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("theater")
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
			int theaterCount = reviewService.getTheaterCount(searchValue);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(9, 5, currentPage, theaterCount);
			
			// 공연시설장 목록 조회
			List<Theater> list = reviewService.selectTheaterList(searchValue, pInf);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			
			return "review/reviewTheater";
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "공연장 목록 조회중 오류 발생");
			return "common/errorPage";
		}
	}	
	
	// 공연별
	@RequestMapping("show")
	public String showList(Model model, 
							@RequestParam(value="currentPage", required=false) Integer currentPage,
							@RequestParam(value="showStatus", required=false) String showStatus,
							@RequestParam(value="searchShow", required=false) String searchShow) {

		try {
			
			if(showStatus == null) showStatus = "공연중";
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("showStatus", showStatus);
			map.put("searchShow", searchShow);
			
			// 전체 공연 수 조회
			//int showCount = reviewService.getShowCount(searchValue);
			int showCount = reviewService.getShowCount(map);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(8, 5, currentPage, showCount);
			
			// 공연 목록 조회
			//List<Show> list = reviewService.selectList(searchValue, pInf);
			List<Show> list = reviewService.selectShowList(map, pInf);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			
			return "review/reviewShow";
		
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "공연 목록 조회중 오류 발생");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="selectShowDetail", produces="application/json")
	public String selectShowDetail(String selectShowCode) {
		
		Show show = reviewService.selectShowDetail(selectShowCode);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		//return new Gson().toJson(show);
		return gson.toJson(show);
	}
	
	@RequestMapping("seats")
	public String seats(String thCode) {
		
		return "review/reviewSeats";
	}
	
	@RequestMapping(value="write")
	public String reviewWrite(Model model,
			RedirectAttributes rdAttr,
			HttpServletRequest request) {
		try {
			String referer = request.getHeader("Referer");
			String view = null;
			List<Theater> tList = reviewService.selectTList();
			if(tList != null) {
				model.addAttribute("tList", tList);
				view = "review/reviewWrite";
			}else {
				rdAttr.addFlashAttribute("msg", "리뷰 작성 화면 전환 실패");
				view = "redirect:"+referer;
			}
			return view;
		}catch (Exception e) {
			return ExceptionForward.errorPage("리뷰 작성화면 전환", model, e);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="selectShowList", produces="application/json; charset=utf-8")
	public String selectShowList(
			@RequestParam(value="showDt", required = false)String date,
			@RequestParam(value="theater", required = false)String thName){
		try {
			Date showDate = Date.valueOf(date);
			String thCode = reviewService.selectTheaterCode(thName);
			Show show = new Show(showDate, thCode);
			List<Show> sList = reviewService.selectSList(show);
			
			return new Gson().toJson(sList);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="selectSeatFloor", produces="application/json; charset=utf-8")
	public String selectFloorList(
			@RequestParam(value = "theater", required = false)String thName) {
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			List<String> fList = reviewService.selectFList(thCode);
			return new Gson().toJson(fList);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
}
