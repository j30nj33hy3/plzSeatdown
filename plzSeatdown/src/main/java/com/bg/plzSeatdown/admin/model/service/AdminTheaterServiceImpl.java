package com.bg.plzSeatdown.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.admin.model.dao.AdminTheaterDAO;
import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service("adminTheaterService")
public class AdminTheaterServiceImpl implements AdminTheaterService{
	
	@Autowired
	private AdminTheaterDAO adminTheaterDAO;

	/** 공연시설장 수 조회용 Service
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	@Override
	public int getTheaterCount(String searchValue) throws Exception {
		return adminTheaterDAO.getTheaterCount(searchValue);
	}

	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Theater> selectList(String searchValue, PageInfo pInf) throws Exception {
		return adminTheaterDAO.selectList(searchValue, pInf);
	}

}
