
package com.bg.plzSeatdown.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;

@Repository
public class MypageDAO {

   @Autowired //rootcontext에 bean 설정 되있음
   private SqlSessionTemplate sqlSession;
   

   

   /** 마이페이지 조회용
    * @param memberNo
    * @return
    * @throws Exception
    */
   public Member selectMypage(int memberNo) throws Exception {
      return sqlSession.selectOne("mypageMapper.selectMypage", memberNo);
   }



   /** 마이페이지 그림 조회용
    * @param memberNo
    * @return
    * @throws Exception
    */
   public Profile selectMypageProf(int memberNo) throws Exception{
      return sqlSession.selectOne("mypageMapper.selectMypageProf", memberNo);
   }



   /** 비밀번호 조회용 DAO
    * @param memberNo
    * @return
    * @throws Exception
    */
   public String selectPwd(int memberNo) throws Exception{
      return sqlSession.selectOne("mypageMapper.selectPwd", memberNo);
   }



   /** 비밀번호 수정용 DAO
    * @param member
    * @return
    * @throws Exception
    */
   public int updatePwd(Member member) throws Exception{
      return sqlSession.update("mypageMapper.updatePwd", member);
   }



   /** 회원 탈퇴용 DAO
    * @param member
    * @return
    * @throws Exception
    */
   public int deleteMember(Member member) throws Exception {
      return sqlSession.update("mypageMapper.deleteMember", member);
   }


   /** 문의내역 전체 게시글수 조회용
    * @return
    * @throws Exception
    */
   public int getAskCount() throws Exception{
   return sqlSession.selectOne("mypageMapper.getAskCount");
   }


   /** 문의내역 게시글 조회
    * @param map
    * @param pInf
    * @return
    * @throws Exception
    */
   public List<QnAEH> selectQlist(PageInfo pInf) throws Exception{
      int offset = (pInf.getCurrentPage() - 1) *  pInf.getLimit();
      RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
      return sqlSession.selectList("mypageMapper.selectQlist", rowBounds );
   }



   /** 문의내역 게시글 상세 조회
    * @param no
    * @return
    */
   public QnAEH selectAsk(Integer no) throws Exception {
      return sqlSession.selectOne("mypageMapper.selectAsk", no);
   }



   /** 마이페이지 수정용
    * @param member
    * @return
    */
   public int updateMypage(Member member)throws Exception  {
	   return sqlSession.update("mypageMapper.updateMypage", member);
   }



   /** 마이페이지 프로필  삽입용
    * @param insertFile
 	* @return
 	* @throws Exception
 	*/
   public int insertProfile(Profile insertFile)throws Exception  {
	   return sqlSession.insert("mypageMapper.insertProfile", insertFile);
   }



   /** 마이페이지 프로필 수정용
    * @param updateFile
    * @return
    */
   public int updateProfile(Profile updateFile)throws Exception {
	   return sqlSession.update("mypageMapper.updateProfile", updateFile);
   }
   
   
   
   
   

}

