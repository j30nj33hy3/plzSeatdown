package com.bg.plzSeatdown.message.controller;

import java.util.List;

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
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.message.model.service.MessageService;
import com.bg.plzSeatdown.message.model.vo.Message;

@RequestMapping("/message/*")
@SessionAttributes({"loginMember", "msg"})
@Controller
public class MessageController {


	@Autowired
	private MessageService messageService;

	// 쪽지보내기(커뮤니티 화면에서)
	@RequestMapping("insert")
	public String insertMessage(Model model, RedirectAttributes rdAttr, String messageContent, int communityWriter, Message message, HttpServletRequest request) {
		String beforeUrl = request.getHeader("referer");
		Member loginMember = (Member)model.getAttribute("loginMember");

		message.setMessageSenderNo(loginMember.getMemberNo());
		message.setMessageReceiverNo(communityWriter);
		message.setMessageContent(messageContent);

		String msg="";

		try {
			int result = messageService.insertMessage(message);

			if(result > 0) {
				msg="쪽지를 발송했습니다.";
			} else {
				msg="쪽지 발송이 실패했습니다.";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + beforeUrl;
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지 전송 과정에서 오류 발생");
			return "common/errorPage";		
		}
	}
	
	// 받은 쪽지함 조회
	@RequestMapping("receiveList")
    public String receiveList(Model model, Member member,
    @RequestParam(value="currentPage", required=false) Integer currentPage) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		String nickName = loginMember.getMemberNickname();

		try {

            int listCount = messageService.getListCount(nickName);
            if(currentPage == null) currentPage = 1;

            PageInfo pInf = Pagination.getPageInfo(5, 5, currentPage, listCount);
            List<Message> rList = messageService.selectList(nickName, pInf);

            model.addAttribute("rList", rList);
            model.addAttribute("pInf", pInf);

            return "message/receiveList";

        }catch(Exception e) {
            e.printStackTrace();
            return ExceptionForward.errorPage("받은 쪽지 목록 조회", model, e);
        }
    }
	
	
	// 보낸 쪽지함 조회
	@RequestMapping("sendList")
	public String sendList(Model model,
	@RequestParam(value="currentPage", required=false) Integer currentPage) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
        String nickName = loginMember.getMemberNickname();

		try {
			int listCount = messageService.getListCount2(nickName);
			if(currentPage == null) currentPage = 1;
			PageInfo pInf = Pagination.getPageInfo(5, 5, currentPage, listCount);
			List<Message> sList = messageService.selectList2(nickName, pInf);
			
			model.addAttribute("sList", sList);
			model.addAttribute("pInf", pInf);
			
			return "message/sendList";
			
		}catch(Exception e) {
			e.printStackTrace();
			return ExceptionForward.errorPage("보낸 쪽지 목록 조회", model, e);
		}
	}
	
	// 쪽지창으로 이동 + 쪽지 조회
	@RequestMapping("detail")
	public String detailMessage(Model model, Integer no) {
		try {
			Message message = messageService.selectMessage(no);
			int result = 0;
			if (message != null) {
				result = messageService.updateMessage(no);
			}
			model.addAttribute("message", message);
			return "message/messageDetail";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지창에서 오류 발생");
			return "common/errorPage";
		}
	}

	// 받은 메세지 상세 화면에서 삭제
	@RequestMapping("deleteMessage")
	public String deleteMessage(Model model, Integer no, RedirectAttributes rdAttr, HttpServletRequest request) {
		String beforeUrl = request.getHeader("referer");
		try {
			int result = -1;
			result = messageService.deleteMessage(no);
			String path=null;
			if(result > 0) {
				model.addAttribute("msg", "쪽지를 삭제하였습니다.");
				return "redirect:receiveList";
			} else if (result == 0) {
				model.addAttribute("msg", "쪽지를 삭제하는데 실패하였습니다.");
				return "receiveDetail.jsp";
			}
			return path;
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지 삭제 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 답장 화면으로 이동
	@RequestMapping("replyForm")
	public String replyForm(Model model, Integer no) {
		try {
			Message message = messageService.selectReplyForm(no);
			model.addAttribute("message", message);
			return "message/messageReplyForm";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "오류 발생");
			return "common/errorPage";
		}
	}
	
	// 안읽은 메세지 수 세기
	@ResponseBody
	@RequestMapping("msgCount")
	public int msgCount(Model model, Integer no) {
		int result = 0; 		
		try {
			result = messageService.msgCount(no);
		}catch(Exception e) {			
			e.printStackTrace();
			result = -1;
		}			
		return result;
	}
	
	// 보낸 메세지 상세보기
	@RequestMapping("sendDetail")
	public String sendDetail(Model model, Integer no) {
		try {
			Message message = messageService.selectSendMessage(no);
			model.addAttribute("message", message);
			return "message/sendMsgDetail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지창에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 답장하기
	@RequestMapping("sendReply")
	public String sendReply(Model model, Message message, int senderNo, int receiverNo, String messageReply, HttpServletRequest request, RedirectAttributes rdAttr) {
		message.setMessageSenderNo(senderNo);
		message.setMessageReceiverNo(receiverNo);
		message.setMessageContent(messageReply);
		String beforeUrl = request.getHeader("referer"); // 이전 페이지 주소를 얻어옴

		try {
			int result = messageService.sendReply(message); 			
			if(result > 0 ) {
				model.addAttribute("msg", "답장을 전송했습니다.");
				return "redirect:"+beforeUrl+beforeUrl;
			} else {
				rdAttr.addFlashAttribute("msg", "쪽지 전송 실패 실패");
				return "redirect:"+beforeUrl;
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지 답장 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 받은 쪽지함 쪽지 삭제 
	@RequestMapping(value = "checkDel", method = RequestMethod.POST) 
	public String checkDel(@RequestParam("checkRow") int[] checkRow, Model model) throws Exception { 
		// 삭제할 사용자 ID마다 반복해서 사용자 삭제 
		int result = 0;
		for (int check : checkRow) { 
			//System.out.println("체크박스 삭제" + check); 
			result = messageService.checkDel(check); 
			
			if(result == 0) break;
		} 
		
		if(result > 0) {
			return "redirect:/message/receiveList";
		}else {
			model.addAttribute("errorMsg", "쪽지 삭제 과정에서 오류 발생");
			return "redirect:/message/receiveList";
		}
	}
	
	// 보낸 쪽지함 쪽지 삭제 
	@RequestMapping(value = "sendDel", method = RequestMethod.POST) 
	public String sendDel(@RequestParam("checkRow") int[] checkRow, Model model) throws Exception { 
		// 삭제할 사용자 ID마다 반복해서 사용자 삭제 
		int result = 0;
		for (int check : checkRow) { 
			//System.out.println("체크박스 삭제" + check); 
			result = messageService.sendDel(check); 
			
			if(result == 0) break;
		} 
		
		if(result > 0) {
			return "redirect:/message/sendList";
		}else {
			model.addAttribute("errorMsg", "쪽지 삭제 과정에서 오류 발생");
			
			return "redirect:/message/sendList";
		}
	}	
	
	// 보낸메세지 상세조회 화면에서 삭제하기 
	@RequestMapping("sendDelMsg")
	public String sendDelMsg(Model model, Integer no, RedirectAttributes rdAttr, HttpServletRequest request) {
		String beforeUrl = request.getHeader("referer"); // 이전 페이지 주소를 얻어옴
		try {
			int result = -1;
			result = messageService.sendDelMsg(no);
			if(result > 0) {
				model.addAttribute("msg", "쪽지를 삭제하였습니다.");
				return "redirect:/message/sendList";
			} else {
				model.addAttribute("msg", "쪽지를 삭제하는데 실패하였습니다.");
				return "sendDetail.jsp";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지 삭제 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	
}
