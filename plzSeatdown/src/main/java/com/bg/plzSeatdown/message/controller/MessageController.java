package com.bg.plzSeatdown.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("receiveList")
    public String receiveList(Model model, Member member,
    @RequestParam(value="currentPage", required=false) Integer currentPage) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		String nickName = loginMember.getMemberNickname();

		try {

            int listCount = messageService.getListCount(nickName);
            if(currentPage == null) currentPage = 1;

            PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
            List<Message> rList = messageService.selectList(nickName, pInf);

            model.addAttribute("rList", rList);
            model.addAttribute("pInf", pInf);

            return "message/receiveList";

        }catch(Exception e) {
            e.printStackTrace();
            return ExceptionForward.errorPage("받은 쪽지 목록 조회", model, e);
        }
    }
	
	

	@RequestMapping("sendList")
	public String sendList(Model model,
	@RequestParam(value="currentPage", required=false) Integer currentPage) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
        String nickName = loginMember.getMemberNickname();

		try {
			int listCount = messageService.getListCount2(nickName);
			if(currentPage == null) currentPage = 1;
			PageInfo pInf = Pagination.getPageInfo(10, 5, currentPage, listCount);
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
			model.addAttribute("message", message);
			return "message/messageDetail";
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "쪽지창에서 오류 발생");
			return "common/errorPage";	
		}
		
	}
	
	// 답장 화면으로 이동
	@RequestMapping("replyForm")
	public String replyForm() {
		return "message/messageReplyForm";
	}
	
	
}
