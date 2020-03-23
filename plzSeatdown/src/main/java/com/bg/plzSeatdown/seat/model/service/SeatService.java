package com.bg.plzSeatdown.seat.model.service;

import com.bg.plzSeatdown.seat.model.vo.Seat;

public interface SeatService {

	/** 좌석 데이터 추가용 Service 
	 * @param seat
	 * @return result
	 * @throws Exception
	 */
	int insertSeat(Seat seat) throws Exception;

	/** 좌석 데이터 추가용 Service (구역 없음)
	 * @param seat
	 * @return result
	 * @throws Exception
	 */
	int insertSeat2(Seat seat) throws Exception;

}
