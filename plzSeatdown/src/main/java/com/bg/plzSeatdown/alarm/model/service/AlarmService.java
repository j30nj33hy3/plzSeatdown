package com.bg.plzSeatdown.alarm.model.service;

import java.util.List;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;

public interface AlarmService {

	public abstract List<Alarm> selectAlarmList(int memberNo);

	public abstract int updateAlarm(Integer no) throws Exception;

}
