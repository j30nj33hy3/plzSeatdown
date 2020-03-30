package com.bg.plzSeatdown.main.service;

import java.util.List;

import com.bg.plzSeatdown.review.model.vo.Show;

public interface MainService {

	/** 상영중 공연 불러오기 서비스
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Show> selectShowing() throws Exception;

	/** 상연예정 공연 불러오기 서비스
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Show> comingShowing() throws Exception;

}
