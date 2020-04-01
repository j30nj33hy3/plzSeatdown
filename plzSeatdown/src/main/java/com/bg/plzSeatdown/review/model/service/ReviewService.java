package com.bg.plzSeatdown.review.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.vo.Review;
import com.bg.plzSeatdown.review.model.vo.ReviewImage;
import com.bg.plzSeatdown.review.model.vo.ReviewLike;
import com.bg.plzSeatdown.review.model.vo.ReviewReport;
import com.bg.plzSeatdown.review.model.vo.ReviewWrite;
import com.bg.plzSeatdown.review.model.vo.SeatReview;
import com.bg.plzSeatdown.review.model.vo.Show;
import com.bg.plzSeatdown.seat.model.vo.Seat;

/**
 * @author A
 *
 */
public interface ReviewService {
	
	
	/** 전체 공연시설장 수 조회용 Service
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	int getTheaterCount(String searchTheater) throws Exception;
	
	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	List<Theater> selectTheaterList(String searchTheater, PageInfo pInf) throws Exception;

	/** 전체 공연 수 조회용 Service
	 * @param map
	 * @return showCount
	 * @throws Exception
	 */
	int getShowCount(Map<String, String> map) throws Exception;

	/** 공연 목록 조회용 Service
	 * @param searchValue
	 * @param map
	 * @return list
	 * @throws Exception
	 */
	List<Show> selectShowList(Map<String, String> map, PageInfo pInf) throws Exception;

	/** 사이드 바에 출력할 공연 상세 정보 조회용 Service(Ajax)
	 * @param selectShowCode
	 * @return show
	 */
	Show selectShowDetail(String selectShowCode);
	
	/** 좌석 후기에서 공연장 상세 정보 조회용 Service
	 * @param thCode
	 * @return theater
	 * @throws Exception
	 */
	Theater selectTheaterDetail(String thCode) throws Exception;

	/** 해당 공연장에서 현재 상영중인 공연 정보 조회용 Service
	 * @param thCode
	 * @return nowShow
	 * @throws Exception
	 */
	Show selectNowShow(String thCode) throws Exception;

	/** 공연장 목록 조회용 Service
	 * @return tList
	 * @throws Exception
	 */
	List<Theater> selectTList() throws Exception;

	/** 공연장 코드 조회용 Service
	 * @param thName
	 * @return thCode
	 * @throws Exception
	 */
	String selectTheaterCode(String thName) throws Exception;

	/** 공연 목록 조회용 Service
	 * @param show
	 * @return sList
	 * @throws Exception
	 */
	List<Show> selectSList(Show show) throws Exception;

	/** 층 목록 조회용 Service
	 * @param thCode
	 * @return fList
	 * @throws Exception
	 */
	List<String> selectFList(String thCode) throws Exception;

	/** 구역 목록 조회용 Service
	 * @param seat
	 * @return aList
	 * @throws Exception
	 */
	List<String> selectAList(Seat seat) throws Exception;

	/** 열 목록 조회용 Service
	 * @param seat
	 * @return rList
	 * @throws Exception
	 */
	List<String> selectRList(Seat seat) throws Exception;

	/** 열 목록 조회용 Service
	 * @param seat
	 * @return rList
	 * @throws Exception
	 */
	List<String> selectRList2(Seat seat) throws Exception;

	/** 번호 목록 조회용 Service
	 * @param seat
	 * @return cList
	 * @throws Exception
	 */
	List<String> selectCList(Seat seat) throws Exception;

	/** 좌석 코드 조회 Service
	 * @param seat
	 * @return seatCode
	 * @throws Exception
	 */
	String selectSeatCode(Seat seat) throws Exception;

	/** 리뷰 등록용 Service
	 * @param review
	 * @param files
	 * @return result
	 * @throws Exception
	 */
	int insertReview(Review review, List<ReviewImage> files) throws Exception;

	/** 공연장별 좌석 리뷰 조회용 Service
	 * @param sr
	 * @return rList
	 * @throws Exception
	 */
	List<SeatReview> selectReviewList(SeatReview sr) throws Exception;

	/** 좌석별 모든 리뷰 조회용 Service
	 * @param review
	 * @return seatReviewList
	 */
	List<SeatReview> selectAllReview(SeatReview review);

	/** 리뷰 신고 등록용 Service
	 * @param report
	 * @return result
	 * @throws Exception
	 */
	int insertReviewReport(ReviewReport report) throws Exception;

	/** 좌석 평점 조회용 Service
	 * @param thCode
	 * @return rating
	 * @throws Exception
	 */
	List<SeatReview> selectRatingList(String thCode) throws Exception;

	/** 리뷰 좋아요 Service
	 * @param like
	 * @param likeStatus 
	 * @return statusChange
	 */
	 int updateLike(ReviewLike like, Integer likeStatus, Alarm alarm)throws Exception;

	/** 리뷰 상세 조회용 Service
	 * @param no
	 * @return review
	 * @throws Exception
	 */
	SeatReview selectReview(Integer no) throws Exception;

	/** 리뷰 이미지 조회용 Service
	 * @param no
	 * @return files
	 * @throws Exception
	 */
	List<ReviewImage> selectFiles(Integer no) throws Exception;

	/** 리뷰 수정용 Service
	 * @param review
	 * @param seatImg
	 * @param ticketImg
	 * @param savePath
	 * @return result
	 * @throws Exception
	 */
	int updateReview(Review review, MultipartFile seatImg, MultipartFile ticketImg, String savePath) throws Exception;

	/** 리뷰 삭제용 Service
	 * @param reviewNo
	 * @param savePath
	 * @return result
	 * @throws Exception
	 */
	int deleteReview(Integer reviewNo, String savePath) throws Exception;

	/** 공연장별 좌석 조회용 Service
	 * @param thCode
	 * @return sList
	 * @throws Exception
	 */
	List<Seat> selectSeatList(String thCode) throws Exception;

	/** 좌석 정보 조회용 Service
	 * @param rWrite
	 * @return seat
	 * @throws Exception
	 */
	Seat selectSeat(ReviewWrite rWrite) throws Exception;

	/** 공연 조회 Service
	 * @param review
	 * @return show
	 * @throws Exception
	 */
	Show selectShow(SeatReview review) throws Exception;


}
