package com.bg.plzSeatdown.alarm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.alarm.model.dao.AlarmDAO;
import com.bg.plzSeatdown.alarm.model.vo.Alarm;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private AlarmDAO alarmDAO;
	
	@Override
	public List<Alarm> selectAlarmList(int memberNo) {
		return alarmDAO.selectAlarmList(memberNo);
	}

}
