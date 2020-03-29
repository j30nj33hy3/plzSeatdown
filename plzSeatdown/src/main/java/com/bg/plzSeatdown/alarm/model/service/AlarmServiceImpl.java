package com.bg.plzSeatdown.alarm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public int updateAlarm(Integer no) throws Exception {
		return alarmDAO.updateAlarm(no);
	}
	
	@Transactional
	@Override
	public int deleteAlarmList(Integer deleteCheck, Integer alarmNo) throws Exception {
	
		int result = 0;
		
		if(deleteCheck==1) {
			result = alarmDAO.deleteAlarmList(alarmNo);
		}
		
		System.out.println("resultimpl " + result);
		
		return result;

	}
	
}
