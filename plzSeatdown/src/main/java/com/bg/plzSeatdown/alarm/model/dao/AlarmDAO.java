package com.bg.plzSeatdown.alarm.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;
@Repository
public class AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Alarm> selectAlarmList(int memberNo) {
		return sqlSession.selectList("alarmMapper.selectAlarmList", memberNo);
	}

	public int updateAlarm(Integer no) throws Exception{
		return sqlSession.update("alarmMapper.updateAlarm", no);
	}

	public int deleteAlarmList(Integer alarmNo) {
		return sqlSession.update("alarmMapper.deleteAlarmList",alarmNo);
	}

	public int alarmCount(int memberNo) throws Exception{
		return sqlSession.selectOne("alarmMapper.alarmCount", memberNo);
	}

}
