
package com.bg.plzSeatdown.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;

public interface MypageService {

   
   
   /** 마이페이지 조회용
    * @param memberNo
    * @return member
    * @throws Exception
    */
   public abstract Member selectMypage(int memberNo) throws Exception;
   

   
   /** 마이페이지 그림 조회용
    * @param memberNo
    * @return 
    * @throws Exception
    */
   public abstract Profile selectMypageProf(int memberNo) throws Exception;

   

   /** 마이페이지 수정용
    * @param member
    * @param image
 * @param savePath 
    * @param savePath
    * @return result
    * @throws Exception
    */
   public abstract int updateMypage(Member member, MultipartFile image, String savePath, int deleteCheck)throws Exception;



   
   /** 마이페이지 비밀번호 변경
    * @param member
    * @param newPwd1
    * @return
    * @throws Exception
    */
   public abstract int updatePwd(Member member, String newPwd1)throws Exception;



   /** 마이페이지 회원 탈퇴용
    * @param member
    * @return
    * @throws Exception
    */
   public abstract int deleteMember(Member member)throws Exception;



   /** 문의내역 전체 게시글수 조회용
    * @param map
    * @return
    * @throws Exception
    */
   public abstract int getAskCount()throws Exception;



   /** 문의내역 게시글 조회
    * @param pInf
    * @return
    * @throws Exception
    */
   public abstract List<QnAEH> selectQlist(PageInfo pInf)throws Exception;



   /** 문의내역 게시글 상세조회
    * @param no
    * @return
    * @throws Exception
    */
   public abstract QnAEH selectAsk(Integer no)throws Exception;



}