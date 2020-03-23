package com.bg.plzSeatdown.seat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.seat.model.dao.SeatDAO;
import com.bg.plzSeatdown.seat.model.vo.Seat;

@Service
public class SeatServiceImpl implements SeatService{

	@Autowired
	private SeatDAO seatDAO;

	/** 좌석 데이터 추가용 Service 
	 * @param seat
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertSeat(Seat seat) throws Exception {
		return seatDAO.insertSeat(seat);
	}

	/** 좌석 데이터 추가용 Service (구역 없음)
	 * @param seat
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertSeat2(Seat seat) throws Exception {
		return seatDAO.insertSeat2(seat);
	}
	
	
}
