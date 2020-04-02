
package com.bg.plzSeatdown.mypage.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;
import com.bg.plzSeatdown.community.model.vo.Reply;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.service.MypageService;
import com.bg.plzSeatdown.mypage.model.vo.Like;
import com.bg.plzSeatdown.mypage.model.vo.Profile;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;
import com.bg.plzSeatdown.mypage.model.vo.ReviewEH;
import com.bg.plzSeatdown.mypage.model.vo.ReviewImageEH;
import com.bg.plzSeatdown.qna.model.vo.QnA;
import com.bg.plzSeatdown.review.model.vo.SeatReview;

@SessionAttributes({"loginMember","msg","detailUrl"})
@Controller
@RequestMapping("/mypage/*") 
public class MypageController {
 
	
	@Autowired private MypageService mypageService;
	
	
	// 마이페이지 조회
	@RequestMapping("mypage") 
	public String mypage(Model model) {

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		try {
			
			Member member = mypageService.selectMypage(loginMember.getMemberNo());
			model.addAttribute("loginMember", member);
			return "mypage/mypage";
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "마이페이지 조회 과정에서 오류 발생");
			return "common/erroPage";
		}
	}
	
	
	// 마이페이지 수정
	@RequestMapping("updateprofile")
	public String updateprofile(Model model, 
			 					RedirectAttributes rdAttr,
								Member member,
								MultipartFile image,
								HttpServletRequest request,
								Integer deleteCheck
								) {

		
		String detailUrl = request.getHeader("referer");
		model.addAttribute("detailUrl", detailUrl);
		
		String detailUrl2 = (String)model.getAttribute("detailUrl");
		
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		member.setMemberNo(loginMember.getMemberNo());
		
		
		String root 
		= request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "/profileImages";
		
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
		
		try {
			
			int result
			= mypageService.updateMypage(member,image,savePath,deleteCheck);
			String msg = null;
			
			if(result>0) msg = "수정 성공!";
			else 		 msg = "수정 실패!";
			
			Member updateMember = mypageService.selectMypage(member.getMemberNo());
			
			request.getSession().removeAttribute("loginMember");
			model.addAttribute("loginMember", updateMember);
			rdAttr.addFlashAttribute("msg",msg);
			return "redirect:" + detailUrl2;
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "정보 수정 과정에서 오류 발생");
			return "common/errorPage";
		}
		
	}
	
	
	// 비밀번호 변경 페이지 이동
		@RequestMapping("changePwd")
		public String changePwd() {
			return "mypage/changePwd";
		}
		

		 // 회원 탈퇴 페이지 이동
		 @RequestMapping("secession") 
		 public String secession() { 
			 return "mypage/secession"; 
		}
	
	

			// 비밀번호 변경
			@RequestMapping("updatePwd")
			public String updatePwd(Model model, Member member, String newPwd1
					, RedirectAttributes rdAttr) {
				// 현재 비밀번호에 입력한 값(member), 새로운 비밀번호에 입력한 값(newPwd1)
				// 회원번호 또는 회원 아이디(model)
				// Member member = memberPwd
				
				// Session에서 번호를 얻어오기
				int memberNo 
				= ((Member)model.getAttribute("loginMember")).getMemberNo();
				
				// 커맨드 객체 member를 재활용하여 회원 번호와, 
				// 현재 비밀번호에 입력한 값을 한번에 저장
				// Member member = 비밀번호, 회원번호(추가됨)
				member.setMemberNo(memberNo);
				
				try {
					int result = mypageService.updatePwd(member, newPwd1);
					
					String msg = null;
					
					if(result>0)  msg = "비밀번호 변경 성공";
					else if(result==0) msg = "비밀번호 변경 실패";
					else	 	  msg = "현재 비밀번호가 일치하지 않습니다";
					
					rdAttr.addFlashAttribute("msg",msg);
					return "redirect:mypage";
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("errorMsg", "비밀번호 수정 과정에서 오류 발생");
					return "common/errorPage";
				}
			}
		 
		 
			// 회원 탈퇴용
			 @RequestMapping("deleteMember") 
			 public String deleteMember(Model model, Member member, SessionStatus status,
					 RedirectAttributes rdAttr) { 
				 
				Member loginMember = (Member)model.getAttribute("loginMember");
				
				int memberNo 
				= ((Member)model.getAttribute("loginMember")).getMemberNo();
				
				member.setMemberNo(memberNo);
				
				try {
					
					int result = mypageService.deleteMember(member);
					
					String msg = null;
					
					if(result>0) {
						msg = "탈퇴 성공";
						status.setComplete();
					}
					else if(result==0) msg = "탈퇴 실패";
					else	 	  msg = "현재 비밀번호가 일치하지 않습니다";
					 
					
					model.addAttribute("msg", msg);
					//rdAttr.addFlashAttribute("msg",msg);
					return "redirect:/";
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("errorMsg", "비밀번호 수정 과정에서 오류 발생");
					return "common/errorPage";
				}
				 
			}
		 
			 
			 
			 
			 
		 
		 
		 // 문의내역 페이지 조회
		@RequestMapping("ask") 
		public String ask(Model model,
			@RequestParam(value="currentPage",required=false)Integer currentPage
				) { 
			
			try {
				
				int memberNo 
				= ((Member)model.getAttribute("loginMember")).getMemberNo();
				
				
				// 전체 게시글 수 조회
				int listCount = mypageService.getAskCount(memberNo);
				
				// 현재 페이지 확인
				if(currentPage == null) currentPage = 1;
				
				// 페이지 정보를 저장
				PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);
				
				// 게시글 목록 조회
				List<QnAEH> qlist = mypageService.selectQlist(pInf,memberNo);
				
				model.addAttribute("list",qlist);
				model.addAttribute("pInf",pInf);
				
				return "mypage/ask";
				
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
				return "common/errorPage";
			}
			
		}
			 
		
		
		// 문의내역 상세페이지 조회
		@RequestMapping(value="detail", method= RequestMethod.GET)
		public String askDetail(Integer no, // 조회할 글번호  / no는 list의 게시글 상세보기 script에 적힌 no를 가져오는것
				Model model, // 요청 응답
				RedirectAttributes rdAttr,   // 조회 실패시 이전 목록으로 리다이렉트 할 때 메세지 전달 
				HttpServletRequest request){ // 이전 페이지 (referer) url 얻어오기 
			
			
			String beforeUrl = request.getHeader("referer"); // 이전 페이지 주소를 얻어옴
			
			try {
				
				// 1) 글 번호를 이용하여 해당 테이블에서 해당 조회
				
				QnAEH qnaeh = mypageService.selectAsk(no);
				
				if(qnaeh != null) {
					
					model.addAttribute("qnaeh", qnaeh);
					return "mypage/askDetail";
					
				}else{
					rdAttr.addFlashAttribute("msg","답변 대기중 입니다"); // 실패 경고 메시지 띄운후
					return "redirect:" + beforeUrl ; // 위에서 선언한 전페이지 redirect 해라
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "게시글 상세 조회 과정에서 오류 발생");
				return "common/errorPage";
			}
			
		}
		
		
		
		// 마이티켓 페이지 조회
//			@RequestMapping("myticket")
//			public String myticket(Model model,
//					@RequestParam(value="currentPage",required=false)Integer currentPage) {
//				
//				try {
//					
//					int memberNo 
//					= ((Member)model.getAttribute("loginMember")).getMemberNo();
//					
//					int listCount = mypageService.getTicketCount(memberNo);
//
//					// 현재 페이지 확인
//					if(currentPage == null) currentPage = 1;
//					
//					// 페이지 정보를 저장
//					PageInfo pInf = Pagination.getPageInfo(8, 5, currentPage, listCount);
//					
//					// 티켓게시글 목록 조회
//					List<ReviewImageEH> rimgList = mypageService.selectRimgList(pInf, memberNo);
//					
//					model.addAttribute("rimgList",rimgList);
//					model.addAttribute("pInf",pInf);
//					
//					return "mypage/myticket";
//					
//				}catch(Exception e) {
//					e.printStackTrace();
//					model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
//					return "common/errorPage";
//				}
//				
//			}
		
		// 마이티켓 페이지 조회
		@RequestMapping("myticket")
		public String myticket(Model model) {
			
			try {
				
				int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
				
				int listCount = mypageService.getTicketCount(memberNo);

				List<SeatReview> ticketList = mypageService.selectTicketList(memberNo);
				model.addAttribute("ticketList",ticketList);
				
				return "mypage/myticket";
				
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
				return "common/errorPage";
			}
			
		}	
			
			
			
		// 마이리뷰 조회
			@RequestMapping("myreview")
			public String myreview(Model model,
					@RequestParam(value="currentPage",required=false)Integer currentPage
					) { 
				
				try {
					
					int memberNo 
					= ((Member)model.getAttribute("loginMember")).getMemberNo();
					
					// 전체 게시글 수 조회
					int listCount = mypageService.getReviewCount(memberNo);
					
					
					// 현재 페이지 확인
					if(currentPage == null) currentPage = 1;
					
					// 페이지 정보를 저장
					PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);
					
					// 게시글 목록 조회
					List<SeatReview> list = mypageService.selectRlist(pInf, memberNo);
					
					List<ReviewImageEH> rimgList = mypageService.selectRimglist(list);
					
			/*
			 * int i = 0;
			 * 
			 * for(i=0; i<list.size(); i++) { if(list.get(i).getReviewComment() != null) {
			 * list.get(i).setReviewComment(list.get(i).getReviewComment().replace("<br>",
			 * "\r\n")); } }
			 */
			 
	
					Profile profile = mypageService.selectMypageProf(memberNo);
					
					model.addAttribute("list",list);
					model.addAttribute("rimgList",rimgList);
					model.addAttribute("profile",profile);
					model.addAttribute("pInf",pInf);
					
					return "mypage/myreview";
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
					return "common/errorPage";
				}
				
			}
			
		
			
			// 마이 리뷰  페이지(글) 조회
			@RequestMapping("mycommu") 
			public String mycommu(Model model,
				@RequestParam(value="currentPage",required=false)Integer currentPage
					) { 
							
				try {
								
							int memberNo 
							= ((Member)model.getAttribute("loginMember")).getMemberNo();
								
								// 전체 게시글 수 조회
								int listCount = mypageService.getWriteCount(memberNo);
								
								
								// 현재 페이지 확인
								if(currentPage == null) currentPage = 1;
								
								// 페이지 정보를 저장
								PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);
								
								// 게시글 목록 조회
								List<Community> clist = mypageService.selectClist(pInf,memberNo);
								
								model.addAttribute("clist",clist);
								model.addAttribute("pInf",pInf);
								
								return "mypage/mycommu";
								
							}catch(Exception e) {
								e.printStackTrace();
								model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
								return "common/errorPage";
							}
							
						}
			
			
			
			// 마이커뮤 페이지(댓글) 조회
			@RequestMapping("mycommu2") 
			public String mycommu2(Model model,
				@RequestParam(value="currentPage",required=false)Integer currentPage
					) { 
				try {
								
							int memberNo 
							= ((Member)model.getAttribute("loginMember")).getMemberNo();
								
								// 전체 게시글 수 조회
								int listCount = mypageService.getWriteReply(memberNo);
								
								
								// 현재 페이지 확인
								if(currentPage == null) currentPage = 1;
								
								// 페이지 정보를 저장
								PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage, listCount);
								
								// 게시글 목록 조회
								List<Reply> replist = mypageService.selectReplist(pInf,memberNo);
								
								model.addAttribute("replist",replist);
								model.addAttribute("pInf",pInf);
								
								return "mypage/mycommu2";
								
							}catch(Exception e) {
								e.printStackTrace();
								model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
								return "common/errorPage";
							}
							
						}
			
			 
				 
			// 마이페이지 알람 조회
			
			 // 문의내역 페이지 조회
			@RequestMapping("alarmSetting") 
			public String alarmSetting(Model model
					) { 
				
				try {
					
					int memberNo 
					= ((Member)model.getAttribute("loginMember")).getMemberNo();
					
			/*
			 * // 전체 게시글 수 조회 int listCount = mypageService.getAskCount(memberNo);
			 * 
			 * // 현재 페이지 확인 if(currentPage == null) currentPage = 1;
			 * 
			 * // 페이지 정보를 저장 PageInfo pInf = Pagination.getPageInfo(5, 10, currentPage,
			 * listCount);
			 */
					// 알람 목록 조회
					List<Alarm> alist = mypageService.selectAlarmlist(memberNo);
					Alarm alarm = null;
					
					
					model.addAttribute("alist",alist);
					
					return "mypage/alarmSetting";
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("errorMsg","게시글 목록 조회 과정에서 오류 발생");
					return "common/errorPage";
				}
				
			}
			
			
			
			// 닉네임 중복 검사
			@ResponseBody
			@RequestMapping("nicknameDupCheck")
			public String nicknameDupCheck(String memberNickname, Model model) {
				try {
					return mypageService.nicknameDupCheck(memberNickname) == 0? true+"" : false+"";
				}catch (Exception e) {
					return ExceptionForward.errorPage("닉네임 중복체크", model, e);
				}
			}
			
			
			
			
			
		
			
			
	
		

}

