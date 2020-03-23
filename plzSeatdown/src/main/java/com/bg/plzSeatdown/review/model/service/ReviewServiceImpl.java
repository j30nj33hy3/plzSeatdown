package com.bg.plzSeatdown.review.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.DAO.ReviewDAO;
import com.bg.plzSeatdown.review.model.vo.Show;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	 
	/** 전체 공연장 수 조회
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	@Override
	public int getTheaterCount(String searchValue) throws Exception {
		return reviewDAO.getTheaterCount(searchValue);
	}
	
	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Theater> selectTheaterList(String searchValue, PageInfo pInf) throws Exception {
		return reviewDAO.selectTheaterList(searchValue, pInf);
	}

	/** 전체 공연 수 조회용 Service
	 * @param map
	 * @return showCount
	 * @throws Exception
	 */
	@Override
	public int getShowCount(Map<String, String> map) throws Exception {
		return reviewDAO.getShowCount(map);
	}

	/** 공연 목록 조회용 Service
	 * @param searchValue
	 * @param map
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Show> selectShowList(Map<String, String> map, PageInfo pInf) throws Exception {
		return reviewDAO.selectShowList(map, pInf);
	}

	/** 사이드 바에 출력할 공연 상세 정보 조회용 Service
	 * @param selectShowCode
	 * @return show
	 */
	@Override
	public Show selectShowDetail(String selectShowCode) {
		return reviewDAO.selectShowDetail(selectShowCode);
	}
	
	/** 좌석 후기에서 공연장 상세 정보 조회용 Service
	 * @param thCode
	 * @return theater
	 * @throws Exception
	 */	
	@Override
	public Theater selectTheaterDetail(String thCode) throws Exception {
		return reviewDAO.selectTheaterDetail(thCode);
	}

	/** 해당 공연장에서 현재 상영중인 공연 정보 조회용 Service
	 * @param thCode
	 * @return nowShow
	 * @throws Exception
	 */
	@Override
	public Show selectNowShow(String thCode) throws Exception {
		return reviewDAO.selectNowShow(thCode);
	}

	/** 공연장 목록 조회용 Service
	 * @return tList
	 * @throws Exception
	 */
	@Override
	public List<Theater> selectTList() throws Exception {
		return reviewDAO.selectTList();
	}

	/** 공연장 코드 조회용 Service
	 * @param thName
	 * @return thCode
	 * @throws Exception
	 */
	@Override
	public String selectTheaterCode(String thName) throws Exception {
		return reviewDAO.selectTheaterCode(thName);
	}

	/** 공연 목록 조회용 Service
	 * @param show
	 * @return sList
	 * @throws Exception
	 */
	@Override
	public List<Show> selectSList(Show show) throws Exception {
		return reviewDAO.selectSList(show);
	}

	/** 층 목록 조회용 Service
	 * @param thCode
	 * @return fList
	 * @throws Exception
	 */
	@Override
	public List<String> selectFList(String thCode) throws Exception {
		return reviewDAO.selectFList(thCode);
	}

	

	

	
}
