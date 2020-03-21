package com.bg.plzSeatdown.admin.model.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminTheaterDAO;
import com.bg.plzSeatdown.admin.model.vo.TheaterLogo;
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

	/** 공연시설장 로고 삽입용 Service(Ajax)
	 * @param logo
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertLogo(TheaterLogo logo, String savePath) {
		
		int result = 0;
		String originPath = adminTheaterDAO.selectLogo(logo.getTheaterCode());
		
		if(originPath != null) {
			result = adminTheaterDAO.deleteLogo(logo.getTheaterCode());
			
			if(result > 0) {
				result = adminTheaterDAO.insertLogo(logo);
				
				if(result > 0) {// 기존 이미지 서버에서 삭제
					
					File deleteFile = new File(savePath + "/" + originPath);
					deleteFile.delete();
				}
			}
			
		}else {
			result = adminTheaterDAO.insertLogo(logo);
		}
		return result;
	}

	/** 공연시설장 로고 삭제용 Service(Ajax)
	 * @param theaterCode
	 * @param savePath
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteLogo(String theaterCode, String savePath) {
		
		int result = 0;
		String originPath = adminTheaterDAO.selectLogo(theaterCode);
		
		if(originPath != null) {
			
			result = adminTheaterDAO.deleteLogo(theaterCode);
			
			if(result > 0) {
				File deleteFile = new File(savePath + "/" + originPath);
				deleteFile.delete();
			}
			
		}else {
			result = -1;
		}
		
		return result;
	}

}
