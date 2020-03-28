package com.bg.plzSeatdown.alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bg.plzSeatdown.alarm.model.service.AlarmService;
import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.member.model.vo.Member;

@Controller
@RequestMapping("/alarm/*")
@SessionAttributes({"loginMember","msg"})
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	// 알림 목록 출력
	@ResponseBody
	@RequestMapping(value="alarmlist", produces="application/json; charset=utf-8")
	public List<Alarm> alarmList(Model model) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		List<Alarm> alist = alarmService.selectAlarmList(loginMember.getMemberNo());
		System.out.println(alist);
		return alist;
	}
}
