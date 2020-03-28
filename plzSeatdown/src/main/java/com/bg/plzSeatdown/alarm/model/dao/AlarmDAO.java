package com.bg.plzSeatdown.alarm.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;

public class AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Alarm> selectAlarmList(int memberNo) {
		return sqlSession.selectList("alarmMapper.selectAlarmList", memberNo);
	}

}
