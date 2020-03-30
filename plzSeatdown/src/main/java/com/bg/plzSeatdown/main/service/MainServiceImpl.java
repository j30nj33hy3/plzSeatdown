package com.bg.plzSeatdown.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.main.model.dao.MainDAO;
import com.bg.plzSeatdown.review.model.vo.Show;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;

	/** 상영중 공연 불러오기 서비스
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Show> selectShowing() throws Exception {
		return mainDAO.selectShowing();
	}

	/** 상연예정 공연 불러오기 서비스
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Show> comingShowing() throws Exception {
		return mainDAO.comingShowing();
	}
	
	
	

}
