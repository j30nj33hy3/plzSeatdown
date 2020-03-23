package com.bg.plzSeatdown.seat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.seat.model.vo.Seat;

@Repository
public class SeatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 좌석 데이터 추가용 DAO
	 * @param seat
	 * @return result
	 * @throws Exception
	 */
	public int insertSeat(Seat seat) throws Exception{
		return sqlSession.insert("seatMapper.insertSeat", seat);
	}

	/** 좌석 데이터 추가용 DAO(구역없음)
	 * @param seat
	 * @return result
	 * @throws Exception
	 */
	public int insertSeat2(Seat seat) throws Exception{
		return sqlSession.insert("seatMapper.insertSeat2", seat);
	}
	
}
