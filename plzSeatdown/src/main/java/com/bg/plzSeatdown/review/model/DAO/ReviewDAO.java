package com.bg.plzSeatdown.review.model.DAO;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.review.model.vo.Review;
import com.bg.plzSeatdown.review.model.vo.ReviewImage;
import com.bg.plzSeatdown.review.model.vo.ReviewLike;
import com.bg.plzSeatdown.review.model.vo.ReviewReport;
import com.bg.plzSeatdown.review.model.vo.SeatReview;
import com.bg.plzSeatdown.review.model.vo.Show;
import com.bg.plzSeatdown.seat.model.vo.Seat;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 전체 공연장 수 조회용 DAO
	 * @param searchValue
	 * @return theaterCount
	 * @throws Exception
	 */
	public int getTheaterCount(String searchTheater) throws Exception{
		return sqlSession.selectOne("reviewMapper.getTheaterCount", searchTheater);
	}
	
	/** 공연시설장 목록 조회용 Service
	 * @param searchValue
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Theater> selectTheaterList(String searchTheater, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("reviewMapper.selectTheaterList", searchTheater, rowBounds);
	}

	/** 전체 공연 수 조회용 DAO
	 * @param map
	 * @return showCount
	 * @throws Exception
	 */
	public int getShowCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("reviewMapper.getShowCount", map);
	}

	/** 공연 목록 조회용 DAO
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Show> selectShowList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("reviewMapper.selectShowList", map, rowBounds);
	}

	/** 사이드 바에 출력할 공연 상세 정보 조회용 DAO
	 * @param selectShowCode
	 * @return show
	 */
	public Show selectShowDetail(String selectShowCode) {
		return sqlSession.selectOne("reviewMapper.selectShowDetail", selectShowCode);
	}
	
	/** 좌석 후기에서 공연장 상세 정보 조회용 DAO
	 * @param thCode
	 * @return theater
	 * @throws Exception
	 */
	public Theater selectTheaterDetail(String thCode) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectTheaterDetail", thCode);
	}

	/** 해당 공연장에서 현재 상영중인 공연 정보 조회용 DAO
	 * @param thCode
	 * @return nowShow
	 * @throws Exception
	 */
	public Show selectNowShow(String thCode) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectNowShow", thCode);
	}

	/** 공연장 목록 조회용 DAO
	 * @return tList
	 * @throws Exception
	 */
	public List<Theater> selectTList() throws Exception{
		return sqlSession.selectList("reviewMapper.selectTList");
	}

	/** 공연장 코드 조회용 DAO
	 * @param thName
	 * @return thCode
	 * @throws Exception
	 */
	public String selectTheaterCode(String thName) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectTheaterCode", thName);
	}

	/** 공연 목록 조회용 DAO
	 * @param show
	 * @return sList
	 * @throws Exception
	 */
	public List<Show> selectSList(Show show) throws Exception{
		return sqlSession.selectList("reviewMapper.selectSList", show);
	}

	/** 층 목록 조회용 DAO
	 * @param thCode
	 * @return fList
	 * @throws Exception
	 */
	public List<String> selectFList(String thCode) throws Exception{
		return sqlSession.selectList("reviewMapper.selectFList", thCode);
	}

	
	/** 구역 목록 조회용 DAO
	 * @param seat
	 * @return aList
	 * @throws Exception
	 */
	public List<String> selectAList(Seat seat) throws Exception{
		return sqlSession.selectList("reviewMapper.selectAList", seat);
	}

	/** 열 목록 조회용 DAO
	 * @param seat
	 * @return rList
	 * @throws Exception
	 */
	public List<String> selectRList(Seat seat) throws Exception{
		return sqlSession.selectList("reviewMapper.selectRList", seat);
	}

	/** 열 목록 조회용 DAO
	 * @param seat
	 * @return rList
	 * @throws Exception
	 */
	public List<String> selectRList2(Seat seat) throws Exception{
		return sqlSession.selectList("reviewMapper.selectRList2", seat);
	}

	/** 번호 목록 조회용 DAO
	 * @param seat
	 * @return cList
	 * @throws Exception
	 */
	public List<String> selectCList(Seat seat) throws Exception{
		return sqlSession.selectList("reviewMapper.selectCList", seat);
	}

	/** 좌석 코드 조회용  DAO
	 * @param seat
	 * @return seatCode
	 * @throws Exception
	 */
	public String selectSeatCode(Seat seat) throws Exception {
		return sqlSession.selectOne("reviewMapper.selectSeatCode", seat);
	}


	/** 다음 리뷰 번호 얻어오기
	 * @return reviewNo
	 * @throws Exception
	 */
	public int selectNextNo() throws Exception{
		return sqlSession.selectOne("reviewMapper.selectNextNo");
	}

	/** 리뷰 삽입용 DAO
	 * @param review
	 * @return result
	 * @throws Exception
	 */
	public int insertReview(Review review) throws Exception{
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	/** 파일 삽입용 DAO
	 * @param ri
 	 * @return result
	 * @throws Exception
	 */
	public int insertReviewImage(ReviewImage ri) throws Exception{
		return sqlSession.insert("reviewMapper.insertReviewImage", ri);
	}

	/** 공연장별 좌석 리뷰 조회용 DAO
	 * @param thCode
	 * @return rList
	 * @throws Exception
	 */
	public List<SeatReview> selectReviewList(String thCode) throws Exception{
		return sqlSession.selectList("reviewMapper.selectReviewList", thCode);
	}

	/** 좌석별 모든 리뷰 조회용 DAO
	 * @param review
	 * @return seatReviewList
	 */
	public List<SeatReview> selectAllReview(SeatReview review){
		return sqlSession.selectList("reviewMapper.selectAllReview", review);
	}
	
	/** 중복 신고 확인용 DAO
	 * @param report
	 * @return reportCount
	 * @throws Exception
	 */
	public int selectReviewReport(ReviewReport report) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectReviewReport", report);
	}

	/** 리뷰 신고 등록용 DAO
	 * @param report
	 * @return result
	 * @throws Exception
	 */
	public int insertReviewReport(ReviewReport report) throws Exception{
		return sqlSession.insert("reviewMapper.insertReviewReport", report);
	}

	/** 좌석 평점 리뷰 조회용 DAO
	 * @param thCode
	 * @return rating
	 * @throws Exception
	 */
	public List<SeatReview> selectRatingList(String thCode) throws Exception{
		return sqlSession.selectList("reviewMapper.selectRatingList", thCode);
	}

	/** 리뷰 좋아요 삽입용 DAO
	 * @param like
	 * @return result
	 */
	public int insertLike(ReviewLike like) {
		return sqlSession.insert("reviewMapper.insertLike", like);
	}

	/** 리뷰 좋아요 삭제용 DAO
	 * @param like
	 * @return result
	 */
	public int deleteLike(ReviewLike like) {
		return sqlSession.delete("reviewMapper.deleteLike", like);
	}

	
	/** 리뷰 상세 조회용 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public SeatReview selectReview(Integer no) throws Exception{
		return sqlSession.selectOne("reviewMapper.selectReview", no);
	}

	/** 리뷰 첨부 이미지 조회용 DAO
	 * @param no
	 * @return files
	 * @throws Exception
	 */
	public List<ReviewImage> selectFiles(Integer no) throws Exception{
		return sqlSession.selectList("reviewMapper.selectFiles", no);
	}

	/** 리뷰 수정용 DAO
	 * @param review
	 * @return result
	 * @throws Exception
	 */
	public int updateReview(Review review) throws Exception{
		return sqlSession.update("reviewMapper.updateReview", review);
	}

	/** 리뷰 이미지 수정용 DAO
	 * @param ri
	 * @return result
	 * @throws Exception
	 */
	public int updateReviewImage(ReviewImage ri) throws Exception{
		return sqlSession.update("reviewMapper.updateReviewImage", ri);
	}

	/** 리뷰 삭제용 DAO
	 * @param reviewNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteReview(Integer reviewNo) throws Exception{
		return sqlSession.update("reviewMapper.deleteReview", reviewNo);
	}

	/** 공연장별 좌석 조회용 DAO
	 * @param thCode
	 * @return sList
	 * @throws Exception
	 */
	public List<Seat> selectSeatList(String thCode) throws Exception{
		return sqlSession.selectList("reviewMapper.selectSeatList", thCode);
	}
	
	

	

	

	

}
