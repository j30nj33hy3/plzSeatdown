package com.bg.plzSeatdown.review.model.service;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bg.plzSeatdown.alarm.model.vo.Alarm;
import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.FileRename;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.DAO.ReviewDAO;
import com.bg.plzSeatdown.review.model.vo.Review;
import com.bg.plzSeatdown.review.model.vo.ReviewImage;
import com.bg.plzSeatdown.review.model.vo.ReviewLike;
import com.bg.plzSeatdown.review.model.vo.ReviewReport;
import com.bg.plzSeatdown.review.model.vo.ReviewWrite;
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
	 * @param sr
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<SeatReview> selectReviewList(SeatReview sr) throws Exception {
		return reviewDAO.selectReviewList(sr);
	}

	/** 좌석별 모든 리뷰 조회용 Service
	 * @param review
	 * @return seatReviewList
	 */
	@Override
	public List<SeatReview> selectAllReview(SeatReview review){
		return reviewDAO.selectAllReview(review);
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

	/** 리뷰 좋아요 Service
	    * @param like
	    * @param likeStatus 
	    * @return statusChange
	    * @throws Exception 
	    */
	   @Transactional(rollbackFor = Exception.class)
	   @Override
	   public int updateLike(ReviewLike like, Integer likeStatus, Alarm alarm) throws Exception {
	   
	      int result = 0;
	      int statusChange = 0;
	      String alarmContent = null;
	      
	      // 좋아요가 눌린 상태
	      if(likeStatus > 0) {
	         result = reviewDAO.deleteLike(like);
	         
	         if(result > 0) statusChange = -1;
	         // 좋아요 O -> 좋아요 X
	      }else {
	         result = reviewDAO.insertLike(like);
	         
	         if(result > 0) {// 좋아요 X -> 좋아요 O
	            result=0;
	            
	            if(alarm.getAlarmContent().length()>=5) {
	               alarmContent = alarm.getAlarmContent().substring(0, 5);            
	            }else {
	               alarmContent = alarm.getAlarmContent();
	            }
	            
	            alarm.setAlarmType("L");
	            alarm.setAlarmContent("["+alarmContent+"...]에 좋아요가 달렸습니다.");
	            statusChange = reviewDAO.insertAlarm(alarm);
	         }
	      }
	      
	      return statusChange;
	   }
	   
	
	/** 리뷰 상세 조회용 Service
	 * @param no
	 * @return review
	 * @throws Exception
	 */
	@Override
	public SeatReview selectReview(Integer no) throws Exception {
		return reviewDAO.selectReview(no);
	}

	/** 리뷰 이미지 조회용 Service
	 * @param no
	 * @return files
	 * @throws Exception
	 */
	@Override
	public List<ReviewImage> selectFiles(Integer no) throws Exception {
		return reviewDAO.selectFiles(no);
	}

	/** 리뷰 수정용 Service
	 * @param review
	 * @param seatImg
	 * @param ticketImg
	 * @param savePath
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReview(Review review, MultipartFile seatImg, MultipartFile ticketImg, String savePath)
			throws Exception {
		// 기존 리뷰 이미지 정보 조회
		List<ReviewImage> files = reviewDAO.selectFiles(review.getReviewNo());
		
		// 좌석, 티켓 이미지 분리
		ReviewImage beforeSeat = null;
		ReviewImage beforeTicket = null;
		
		for(ReviewImage ri : files) {
			if(ri.getImageType() == 0) {
				beforeSeat = ri;
			}else {
				beforeTicket = ri;
			}
		}
		
		// 새롭게 삽입할 파일 목록
		List<ReviewImage> insertList = new ArrayList<ReviewImage>();
		// 기존 행을 수정할 파일 목록
		List<ReviewImage> updateList = new ArrayList<ReviewImage>();
		
		ReviewImage file = null; // 리스트에 추가될 이미지 객체 참조 변수 선언
		
		// 새롭게 등록된 좌석사진 확인
		if(!seatImg.getOriginalFilename().equals("")) {
			// 신규 좌석 이미지 존재
			// rename 작업 진행
			String changeFileName = FileRename.rename(seatImg.getOriginalFilename());
			
			// 기존 이미지 존재 -> update
			if(beforeSeat != null) {
				// 변경파일 = (기존 이미지 번호, 변경 이미지 이름)
				file = new ReviewImage(beforeSeat.getReviewImageNo(), changeFileName);
				file.setImageType(0); // 좌석 이미지
				updateList.add(file);
			}else {
				// 기존 이미지 X -> insert
				file = new ReviewImage(changeFileName);
				file.setImageType(0);
				file.setReviewNo(review.getReviewNo());
				insertList.add(file);
			}
		}

		// 새롭게 등록된 티켓 사진 확인
		if(!ticketImg.getOriginalFilename().equals("")) {
			String changeFileName = FileRename.rename(ticketImg.getOriginalFilename());
			
			// 기존 티켓 이미지 존재 -> update
			if(beforeTicket != null) {
				file = new ReviewImage(beforeTicket.getReviewImageNo(),changeFileName);
				file.setImageType(1);
				updateList.add(file);
			}else {
				// 기존 이미지X -> insert
				file = new ReviewImage(changeFileName);
				file.setImageType(1);
				file.setReviewNo(review.getReviewNo());
				insertList.add(file);
			}
		}
		
		// 리뷰 수정
		int result = 0;
		review.setReviewComment(review.getReviewComment().replace("\r\n", "<br>"));
		result = reviewDAO.updateReview(review);
		
		// 새로 삽입할 파일이 있을 경우
		if(result > 0 && !insertList.isEmpty()) {
			result = 0;
			for(ReviewImage ri : insertList) {
				result = reviewDAO.insertReviewImage(ri);
				if(result == 0) {
					throw new Exception("파일 삽입 과정에서 오류 발생");
				}
			}
		}
		// 기존 이미지 테이블을 수정할 파일이 있을 경우
		if(result > 0 && !updateList.isEmpty()) {
			result = 0;
			for(ReviewImage ri : updateList) {
				result = reviewDAO.updateReviewImage(ri);
				if(result == 0) {
					throw new Exception("파일 삽입 과정에서 오류 발생");
				}
			}
		}
		
		// DB 수정이 정상적으로 처리된 경우
		if(result > 0) {
			insertList.addAll(updateList);
			for(ReviewImage ri : insertList) {
				if(ri.getImageType() == 0) {
					seatImg.transferTo(new File(savePath+"/"+ri.getReviewImagePath()));
				}else {
					ticketImg.transferTo(new File(savePath+"/"+ri.getReviewImagePath()));
				}
			}
		}
		
		for(ReviewImage ri : files) {
			for(ReviewImage newImage : insertList) {
				if(ri.getReviewImageNo() == newImage.getReviewImageNo()) {
					File deleteFile = new File(savePath+"/"+ri.getReviewImagePath());
					deleteFile.delete();
				}
			}
		}
		return result;
	}

	/** 리뷰 삭제용 Service
	 * @param reviewNo
	 * @param savePath
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReview(Integer reviewNo, String savePath) throws Exception {
		int result = 0;
		List<ReviewImage> files = reviewDAO.selectFiles(reviewNo);
		if(files != null) {
			for(ReviewImage ri : files) {
				result = reviewDAO.deleteFiles(ri);
				File deleteFile = new File(savePath+"/"+ri.getReviewImagePath());
				deleteFile.delete();
			}
		}
		result = 0;
		result = reviewDAO.deleteReview(reviewNo);
		if(result == 0) {
			throw new Exception("리뷰 삭제 과정에서 오류 발생");
		}
		return result;
	}

	/** 공연장별 좌석 조회용 Service
	 * @param thCode
	 * @return sList
	 * @throws Exception
	 */
	@Override
	public List<Seat> selectSeatList(String thCode) throws Exception {
		return reviewDAO.selectSeatList(thCode);
	}

	/** 좌석 정보 조회용 Service
	 * @param rWrite
	 * @return seat
	 * @throws Exception
	 */
	@Override
	public Seat selectSeat(ReviewWrite rWrite) throws Exception {
		return reviewDAO.selectSeat(rWrite);
	}

	
}
