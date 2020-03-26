package com.bg.plzSeatdown.review.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.DAO.ReviewDAO;
import com.bg.plzSeatdown.review.model.vo.Review;
import com.bg.plzSeatdown.review.model.vo.ReviewImage;
import com.bg.plzSeatdown.review.model.vo.ReviewReport;
import com.bg.plzSeatdown.review.model.vo.SeatReview;
import com.bg.plzSeatdown.review.model.vo.Show;
import com.bg.plzSeatdown.seat.model.vo.Seat;

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
	public int getTheaterCount(String searchTheater) throws Exception {
		return reviewDAO.getTheaterCount(searchTheater);
	}
	
	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Theater> selectTheaterList(String searchTheater, PageInfo pInf) throws Exception {
		return reviewDAO.selectTheaterList(searchTheater, pInf);
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

	/** 구역 목록 조회용 Service
	 * @param seat
	 * @return aList
	 * @throws Exception
	 */
	@Override
	public List<String> selectAList(Seat seat) throws Exception {
		return reviewDAO.selectAList(seat);
	}

	/** 열 목록 조회용 Service
	 * @param seat
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<String> selectRList(Seat seat) throws Exception {
		return reviewDAO.selectRList(seat);
	}

	/** 열 목록 조회용 Service
	 * @param seat
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<String> selectRList2(Seat seat) throws Exception {
		return reviewDAO.selectRList2(seat);
	}

	/** 번호 목록 조회용 Service
	 * @param seat
	 * @return cList
	 * @throws Exception
	 */
	@Override
	public List<String> selectCList(Seat seat) throws Exception {
		return reviewDAO.selectCList(seat);
	}

	/** 좌석 코드 조회 Service
	 * @param seat
	 * @return seatCode
	 * @throws Exception
	 */
	@Override
	public String selectSeatCode(Seat seat) throws Exception {
		return reviewDAO.selectSeatCode(seat);
	}

	/** 리뷰 등록용 Service
	 * @param review
	 * @param files
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(Review review, List<ReviewImage> files) throws Exception {
		int result = 0;
		
		// 다음 리뷰 번호(SEQ_RVNO) 얻어오기
		int reviewNo = reviewDAO.selectNextNo();
		
		if(reviewNo > 0) {
			review.setReviewComment(review.getReviewComment().replace("\r\n", "<br>"));
			review.setReviewNo(reviewNo);
			result = reviewDAO.insertReview(review);
		}
		if(result > 0 && !files.isEmpty()) {
			result = 0;
			for(ReviewImage ri : files) {
				ri.setReviewNo(reviewNo);
				result = reviewDAO.insertReviewImage(ri);
				if(result == 0) {
					throw new Exception();
				}
			}
		}
		
		return result;
	}

	/** 공연장별 좌석 리뷰 조회용 Service
	 * @param thCode
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<SeatReview> selectReviewList(String thCode) throws Exception {
		return reviewDAO.selectReviewList(thCode);
	}

	/** 좌석별 모든 리뷰 조회용 Service
	 * @param seatValue
	 * @return seatReviewList
	 */
	@Override
	public List<SeatReview> selectAllReview(String seatValue){
		return reviewDAO.selectAllReview(seatValue);
	}

	/** 리뷰 신고 등록용 Service
	 * @param report
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReviewReport(ReviewReport report) throws Exception {
		
		int result = 0;
		
		// 중복 신고 확인
		int reportCount = reviewDAO.selectReviewReport(report);
		
		if(reportCount > 0) result = -1;
		else result = reviewDAO.insertReviewReport(report);
		
		return result;
	}
	
	/** 좌석 평점 조회용 Service
	 * @param thCode
	 * @return rating
	 * @throws Exception
	 */
	@Override
	public List<SeatReview> selectRatingList(String thCode) throws Exception {
		return reviewDAO.selectRatingList(thCode);
	}
	
	

	

	
}
