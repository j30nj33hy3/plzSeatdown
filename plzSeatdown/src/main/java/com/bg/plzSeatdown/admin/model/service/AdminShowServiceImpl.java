package com.bg.plzSeatdown.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.admin.model.dao.AdminShowDAO;
import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.common.vo.PageInfo;

@Service("adminShowService")
public class AdminShowServiceImpl implements AdminShowService{

	@Autowired
	private AdminShowDAO adminShowDAO;

	/** 공연 수 조회용 Service
	 * @param searchValue
	 * @return showCount
	 * @throws Exception
	 */
	@Override
	public int getShowCount(String searchValue) throws Exception {
		return adminShowDAO.getShowCount(searchValue);
	}

	/** 공연 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Show> selectList(String searchValue, PageInfo pInf) throws Exception {
		return adminShowDAO.selectList(searchValue, pInf);
	}
	
	
}
