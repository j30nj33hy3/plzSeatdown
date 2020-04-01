package com.bg.plzSeatdown.review.controller;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.FileRename;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.review.model.service.ReviewService;
import com.bg.plzSeatdown.review.model.vo.Review;
import com.bg.plzSeatdown.review.model.vo.ReviewImage;
import com.bg.plzSeatdown.review.model.vo.ReviewLike;
import com.bg.plzSeatdown.review.model.vo.ReviewReport;
import com.bg.plzSeatdown.review.model.vo.ReviewWrite;
import com.bg.plzSeatdown.review.model.vo.SeatReview;
import com.bg.plzSeatdown.review.model.vo.Show;
import com.bg.plzSeatdown.seat.model.vo.Seat;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author user1
 *
 */
@Controller
@RequestMapping("/review/*")
@SessionAttributes({"loginMember","msg"})
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("theater")
	public String theaterList(Model model, 
								@RequestParam(value="currentPage", required=false) Integer currentPage,
								@RequestParam(value="searchTheater", required=false) String searchTheater) {
			
		try {
			
			// 전체 공연시설장 수 조회
			int theaterCount = reviewService.getTheaterCount(searchTheater);
			
			// 현재 페이지 확인
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(9, 5, currentPage, theaterCount);
			
			// 공연시설장 목록 조회
			List<Theater> list = reviewService.selectTheaterList(searchTheater, pInf);
			
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
			
			//if(showStatus == null) showStatus = "전체";
			
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
	
	// 공연 상세 정보 사이드 패널 Ajax
	@ResponseBody
	@RequestMapping(value="selectShowDetail", produces="application/json")
	public String selectShowDetail(String selectShowCode) {
		
		Show show = reviewService.selectShowDetail(selectShowCode);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		//return new Gson().toJson(show);
		return gson.toJson(show);
	}
	
	// 좌석 리뷰 페이지
	@RequestMapping("seats")
	public String seats(Model model, 
						HttpServletRequest request,
						@RequestParam(value="thCode", required=false) String thCode) {
		
		try {
			
			// Session에서 회원번호 얻어오기
			Member loginMember = (Member)model.getAttribute("loginMember");
			int memberNo = 0;
			
			if(loginMember == null) memberNo = 0;
			else memberNo = loginMember.getMemberNo();
			
			Theater theater = reviewService.selectTheaterDetail(thCode);
			Show nowShow = reviewService.selectNowShow(thCode);
			List<SeatReview> rating = reviewService.selectRatingList(thCode);
			List<Seat> sList = reviewService.selectSeatList(thCode);
			
			SeatReview sr = new SeatReview();
			sr.setThCode(thCode);
			sr.setLikeStatus(memberNo);
			List<SeatReview> nReview = reviewService.selectReviewList(sr);
			
			model.addAttribute("nReview", nReview);
			model.addAttribute("rating", rating);
			model.addAttribute("theater", theater);
			model.addAttribute("show", nowShow);
			model.addAttribute("sList", sList);
			
			return "review/reviewSeats";
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "좌석 리뷰 조회중 오류 발생");
			return "common/errorPage";
		}
		
	}
	
	// 리뷰 작성 화면 전환
	@RequestMapping(value="writeForm")
	public String reviewWrite(Model model,
			RedirectAttributes rdAttr,
			HttpServletRequest request,
			ReviewWrite rWrite) {
		try {
			String referer = request.getHeader("Referer");
			String view = null;
			List<Theater> tList = reviewService.selectTList();
			if(rWrite.getSeatVal() != 0) {
				Show show = null;
				if(!rWrite.getShowCode().equals("")) {
					show = reviewService.selectShowDetail(rWrite.getShowCode());
					rWrite.setShowTitle(show.getShowTitle());
				}
				Seat seat = reviewService.selectSeat(rWrite);
				if(seat != null) {
					rWrite.setSeatFloor(seat.getSeatFloor());
					rWrite.setSeatArea(seat.getSeatArea());
					rWrite.setSeatRow(seat.getSeatRow());
					rWrite.setSeatCol(seat.getSeatCol());
					rWrite.setSeatCode(seat.getSeatCode());
				}
				model.addAttribute("rWrite", rWrite);
			}
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
	
	// 공연 목록 조회
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
	
	
	// 층 목록 조회
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
	
	
	// 구역 목록 조회
	@ResponseBody
	@RequestMapping(value="selectSeatArea", produces="application/json; charset=utf-8")
	public String selectAreaList(
			@RequestParam(value = "theater", required = false)String thName,
			@RequestParam(value = "seatFloor", required = false)String seatFloor) {
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			Seat seat = new Seat(seatFloor, thCode);
			List<String> aList = reviewService.selectAList(seat);
			return new Gson().toJson(aList);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	
	// 열 목록 조회 (구역 없음)
	@ResponseBody
	@RequestMapping(value="selectSeatRow1", produces="application/json; charset=utf-8")
	public String selectRowList(
			@RequestParam(value = "theater", required = false)String thName,
			@RequestParam(value = "seatFloor", required = false)String seatFloor) {
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			Seat seat = new Seat(seatFloor, thCode);
			List<String> rList = reviewService.selectRList(seat);
			return new Gson().toJson(rList);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	// 열 목록 조회 (구역 없음)
	@ResponseBody
	@RequestMapping(value="selectSeatRow2", produces="application/json; charset=utf-8")
	public String selectRowList2(
			@RequestParam(value = "theater", required = false)String thName,
			@RequestParam(value = "seatFloor", required = false)String seatFloor,
			@RequestParam(value = "seatArea", required = false)String seatArea) {
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			Seat seat = new Seat(seatFloor, seatArea, thCode);
			List<String> rList = reviewService.selectRList2(seat);
			return new Gson().toJson(rList);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	// 번호 목록 조회
	@ResponseBody
	@RequestMapping(value="selectSeatCol", produces="application/json; charset=utf-8")
	public String selectColList(
			@RequestParam(value = "theater", required = false)String thName,
			@RequestParam(value = "seatFloor", required = false)String seatFloor,
			@RequestParam(value = "seatArea", required = false)String seatArea,
			@RequestParam(value = "seatRow", required = false)String seatRow) {
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			Seat seat = new Seat(seatFloor, seatArea, seatRow, thCode);
			List<String> cList = reviewService.selectCList(seat);
			return new Gson().toJson(cList);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="selectSeatCode", produces="application/json; charset=utf-8")
	public String selectSeatCode(
			@RequestParam(value = "theater", required = false)String thName,
			@RequestParam(value = "seatFloor", required = false)String seatFloor,
			@RequestParam(value = "seatArea", required = false)String seatArea,
			@RequestParam(value = "seatRow", required = false)String seatRow,
			@RequestParam(value = "seatCol", required = false)String seatCol) {
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			Seat seat = new Seat(seatFloor, seatArea, seatRow, seatCol, thCode);
			String result = reviewService.selectSeatCode(seat);
			return new Gson().toJson(result);
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value="write")
	public String insertReview(Review review, Model model,
			HttpServletRequest request, // 파일경로
			RedirectAttributes rdAttr,
			@RequestParam(value="thName", required=false)String thName,
			@RequestParam(value="seatFile", required=false)MultipartFile seatImg,
			@RequestParam(value="ticketFile", required=false)MultipartFile ticketImg) {
		
		// Session에서 회원번호 얻어오기
		Member loginMember = (Member)model.getAttribute("loginMember");
		int reviewWriter = loginMember.getMemberNo();
		
		review.setReviewWriter(reviewWriter);
		
		// 파일 저장 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/reviewImages";
		
		// 저장 폴더 선택
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
		
		try {
			String thCode = reviewService.selectTheaterCode(thName);
			List<ReviewImage> files = new ArrayList<ReviewImage>();
			ReviewImage ri = null;
			
			if(!seatImg.getOriginalFilename().equals("")) {
				String changeFileName = FileRename.rename(seatImg.getOriginalFilename());
				ri = new ReviewImage(changeFileName);
				ri.setImageType(0);
				files.add(ri);
			}
			if(!ticketImg.getOriginalFilename().equals("")) {
				String changeFileName = FileRename.rename(ticketImg.getOriginalFilename());
				ri = new ReviewImage(changeFileName);
				ri.setImageType(1);
				files.add(ri);
			}
			
			int result = reviewService.insertReview(review, files);
			
			String msg = null;
			String url = null;
			
			if(result > 0) {
				for(ReviewImage file : files) {
					if(file.getImageType() == 0) {
						seatImg.transferTo(new File(savePath+"/"+file.getReviewImagePath()));
					}else {
						ticketImg.transferTo(new File(savePath+"/"+file.getReviewImagePath()));
					}
				}
				msg = "리뷰 등록 성공";
				url = "seats?thCode="+thCode;
			}else {
				msg = "리뷰 등록 실패";
				url = "write";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:"+url;
		}catch (Exception e) {
			return ExceptionForward.errorPage("리뷰 작성", model, e);
		}
	}
	
	// 모든 리뷰 출력
	@ResponseBody
	@RequestMapping(value="selectAllReview", produces="application/json; charset=utf-8")
	public String selectAllReview(Model model, @RequestParam(value = "seatValue", required = false)Integer seatValue,
												@RequestParam(value = "loginMemberNo", required = false)Integer loginMemberNo) {
		
		if(loginMemberNo == null) loginMemberNo = 0;
		
		SeatReview review = new SeatReview(seatValue, loginMemberNo);
		
		List<SeatReview> seatReviewList = reviewService.selectAllReview(review);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		
		return gson.toJson(seatReviewList);
	}
	
	// 리뷰 신고 등록
	@RequestMapping("insertReviewReport")
	public String insertReviewReport(ReviewReport report, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");
		
		int result = 0;
		
		try {
			
			result = reviewService.insertReviewReport(report);
			String msg = null;
			
			if(result > 0) msg = "해당 리뷰를 신고했습니다.";
			else if(result == -1) msg = "이미 신고한 리뷰입니다.";
			else msg = "신고 실패";
			
			rdAttr.addFlashAttribute("msg", msg);
			
			return "redirect:"+referer;
			
		}catch (Exception e) {
			return ExceptionForward.errorPage("리뷰 신고 등록", model, e);
		}
	}
	
	// 리뷰 좋아요
	   @ResponseBody
	   @RequestMapping("updateLike")
	   public ReviewLike updateLike(Model model, Integer reviewNo, Integer likeStatus, Alarm alarm) {
	      
	      // Session에서 회원번호 얻어오기
	      Member loginMember = (Member)model.getAttribute("loginMember");
	      int memberNo = loginMember.getMemberNo();
	      
	      ReviewLike like = new ReviewLike(memberNo, reviewNo);
	      
	      int statusChange =0;
	      int likeCount = 0;
	      try {
	         statusChange = reviewService.updateLike(like, likeStatus, alarm);
	         likeCount = reviewService.getLikeCount(reviewNo);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         statusChange =1;
	      }
	      
	      // statusChange == -1   좋아요 O -> 좋아요 X
	      // statusChange == 1   좋아요 X -> 좋아요 O
	      // statusChange == 0   좋아요 작동 실패
	      
	      ReviewLike rl = new ReviewLike(statusChange, likeCount);
	   
	      return rl;
	   }
	
	
		// 리뷰 수정 화면 전환
		@RequestMapping("updateForm")
		public String updateForm(Integer no, 
				Model model, 
				HttpServletRequest request) {
				
			// 이전 페이지(상세조회) 주소를 저장
			String detailUrl = request.getHeader("referer");
			model.addAttribute("url", detailUrl);
				
			try {
				List<Theater> tList = reviewService.selectTList();
				SeatReview review = null;
				List<String> fList = null;
				List<String> aList = null;
				List<String> rList = null;
				List<String> cList = null;
				Show show = null;
				if(tList != null) {
					// 1) 리뷰 상세 조회
					review = reviewService.selectReview(no);
					if(review != null) {
						if(review.getReviewComment() != null) {
							review.setReviewComment(review.getReviewComment().replace("<br>", "\r\n"));
						}
						List<ReviewImage> files = reviewService.selectFiles(no);
						if(!files.isEmpty()) {
							model.addAttribute("files", files);
						}
						// 공연 조회
						show = reviewService.selectShow(review);
						// 해당 공연장의 층, 구역, 열, 번호 목록 호출
						String thCode = review.getThCode();
						String seatFloor = review.getSeatFloor();
						String seatArea = review.getSeatArea();
						String seatRow = review.getSeatRow();
						String seatCol = review.getSeatCol();
							
						Seat seat = new Seat(seatFloor,seatArea,seatRow,seatCol,thCode);
						fList = reviewService.selectFList(thCode);
						aList = reviewService.selectAList(seat);
						if(aList.size() == 1) {
							seat.setSeatArea("-1");
							rList = reviewService.selectRList(seat);
						}else {
							rList = reviewService.selectRList2(seat);
						}
						cList = reviewService.selectCList(seat);
					}
				}
				model.addAttribute("show", show);
				model.addAttribute("tList", tList);
				model.addAttribute("fList", fList);
				model.addAttribute("aList", aList);
				model.addAttribute("rList", rList);
				model.addAttribute("cList", cList);
				model.addAttribute("review", review);
				return "review/reviewUpdate";
			}catch (Exception e) {
				return ExceptionForward.errorPage("수정화면 전환", model, e);
			}
				
		}
			
			
		// 리뷰 수정
		@RequestMapping("update")
		public String updateReview(Integer no,
				String url,
				Review review, Model model,
				RedirectAttributes rdAttr, HttpServletRequest request,
				@RequestParam(value="thName", required=false)String thName,
				@RequestParam(value="seatFile", required=false)MultipartFile seatImg,
				@RequestParam(value="ticketFile", required=false)MultipartFile ticketImg) {
			review.setReviewNo(no);
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/reviewImages";
				
			File folder = new File(savePath);
			if(!folder.exists()) folder.mkdir();
			try {
				int result = reviewService.updateReview(review, seatImg, ticketImg, savePath);
				String msg = null;
				if(result > 0) msg = "리뷰 수정 성공";
				else		   msg = "리뷰 수정 실패";
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:"+url;
			}catch (Exception e) {
				return ExceptionForward.errorPage("리뷰 수정", model, e);
			}			
		}
		
		@RequestMapping("delete")
		public String deleteNotice(Model model,
				HttpServletRequest request, 
				RedirectAttributes rdAttr,
				@RequestParam(value="no", required=true)Integer reviewNo) {
			String referer = request.getHeader("Referer");
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/reviewImages";
			try {
				int result = reviewService.deleteReview(reviewNo, savePath);
				if(result > 0) {
					rdAttr.addFlashAttribute("msg", "리뷰 삭제 성공");
				}else {
					rdAttr.addFlashAttribute("msg", "리뷰 삭제 실패");
				}
				return "redirect:"+referer;
			}catch (Exception e) {
				return ExceptionForward.errorPage("리뷰 삭제", model, e);
			}
		}
}
