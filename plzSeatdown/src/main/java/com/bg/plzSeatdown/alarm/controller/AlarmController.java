package com.bg.plzSeatdown.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bg.plzSeatdown.alarm.model.service.AlarmService;
import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.member.model.vo.Member;

@Controller
@RequestMapping("/alarm/*")
@SessionAttributes({"loginMember","msg"})
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	// 알림 목록 출력
	@ResponseBody
	@RequestMapping("alarmlist")
	public List<Alarm> alarmList(Model model) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		List<Alarm> alist = alarmService.selectAlarmList(loginMember.getMemberNo());
		model.addAttribute("alist", alist);
		return alist;
	}
	
	@RequestMapping("updateAlarm")
	public String updateAlarm(Integer no, String url, Model model, HttpServletRequest request) {
		System.out.println("no: "+ no);
		String detailUrl = request.getHeader("referer");
		try {
			int result = alarmService.updateAlarm(no);
			if(result > 0) {
				return "redirect:"+url;
			}else {
				return "redirect:"+detailUrl;
			}
			
		}catch(Exception e) {
			return ExceptionForward.errorPage("알람상태변경", model, e);
		}
	}
	
	
	@RequestMapping("deleteCheck")
	public String deleteCheck(Integer deleteCheck, Integer alarmNo, Model model, RedirectAttributes rdAttr,HttpServletRequest request) {
		
		String detailUrl = request.getHeader("referer");
		
		try {
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			int memberNo = loginMember.getMemberNo();
			
			int result = alarmService.deleteAlarmList(deleteCheck, alarmNo);
			
			String msg = null;
			
			if(result>0)  msg = "알람 삭제 성공";
			else if(result==0) msg = "알람 삭제 실패";
			else	 	  msg = "알람 오류 발생";
			
			System.out.println("resultcon " + result);
			
			rdAttr.addFlashAttribute("msg",msg);
			return "redirect:"+detailUrl;
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "알람 삭제 과정에서 오류 발생");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("alarmCount")
	public int alarmCount(Model model) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		int alarmCount = 0;
		try {
			alarmCount = alarmService.alarmCount(loginMember.getMemberNo());
		}catch(Exception e) {
			e.printStackTrace();
			alarmCount = 0;
		}
		return alarmCount;
	}
	
	
}
