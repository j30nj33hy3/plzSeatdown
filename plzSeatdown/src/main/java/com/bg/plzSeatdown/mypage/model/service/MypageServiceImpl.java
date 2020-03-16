
package com.bg.plzSeatdown.mypage.model.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bg.plzSeatdown.common.vo.FileRename;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.dao.MypageDAO;
import com.bg.plzSeatdown.mypage.model.vo.Profile;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;

@Service
public class MypageServiceImpl implements MypageService{
   
   @Autowired
   private MypageDAO mypageDAO;

   // 암호화를 위한 객체 DI(의존성 주입)
   @Autowired
   private BCryptPasswordEncoder bCryptPasswordEncoder;
   
   
   /** 마이페이지 조회용
    * @param memberNo
    * @return member
    * @throws Exception
    */
   public Member selectMypage(int memberNo) throws Exception {
      return mypageDAO.selectMypage(memberNo);
   }
   

   /** 마이페이지 그림 조회용
    * @param member
    * @return 
    * @throws Exception
    */
   @Override
   public Profile selectMypageProf(int memberNo) throws Exception {
      return mypageDAO.selectMypageProf(memberNo);
   }
   
   
   /** 마이페이지 수정용
    * @param member
    * @param image
    * @param savePath
    * @return result
    * @throws Exception
    */
   @Transactional(rollbackFor = Exception.class)
   @Override
   public int updateMypage(Member member, MultipartFile image, String savePath, int deleteCheck) throws Exception {
      
      Profile file = mypageDAO.selectMypageProf(member.getMemberNo());
      
      
      Profile insertFile = new Profile(); // 새롭게 삽입 (없던걸 생기게하는것)
      Profile updateFile = new Profile(); // 수정할것 삽입 (있던걸 고치는것)
      
      System.out.println("image : " + image);
      System.out.println("image.getOriginalFilename() : " + image.getOriginalFilename());
      
      if(!image.getOriginalFilename().equals("")) {
      
         String changeFileName = FileRename.rename(image.getOriginalFilename());
         
      // 이미지 기존에 O -> update 진행
      			if(file != null) { //이미지가 비어있지 않다면
      				updateFile = new Profile(file.getProfileNo(), 
      										 changeFileName);
      			}
      // 이미지 기존에 x -> insert 진행
      			else{
      				insertFile = new Profile(changeFileName);
      				insertFile.setMemberNo(member.getMemberNo());
      			}
      }
      	System.out.println("file : " + file);
      	System.out.println("insertFile : " + insertFile);
      	System.out.println("updateFile : " + updateFile);

      // DB수정
		int result = 0;

		result = mypageDAO.updateMypage(member);
		
		
		// 게시글 수정 성공 & 새로운 파일 있을 경우
		if(result>0 && insertFile.getProfilePath() != null) {
			result = 0;
			result = mypageDAO.insertProfile(insertFile);
			
			if(result==0) throw new Exception("파일 삽입 과정에서 오류 발생");
		}
		
		// 기존 Profile 테이블에 수정할 파일정보가(insertFile) 있을경우
		if(result>0 && updateFile.getProfilePath() != null) {
			result = 0;
			result = mypageDAO.updateProfile(updateFile);
			
			
			if(result==0) throw new Exception("파일 수정 과정에서 오류 발생");
		}
		
		// 삭제하기 버튼을 눌렀을 경우
		if(result>0 && deleteCheck == 1){
			System.out.println("deleteChec : " + deleteCheck);
	    	  result = 0;
	    	  result = mypageDAO.deleteProfile(member.getMemberNo());
    	  	
	    	  if(result==0) throw new Exception("파일 삭제 과정에서 오류 발생");
	    }
	
		
		System.out.println("result : " + result);
		
		// 서버 수정
		if(result>0 && insertFile.getProfilePath() != null) {
			image.transferTo(new File(savePath + "/" + insertFile.getProfilePath()));
		}
		
		if(result>0 && updateFile.getProfilePath() != null) {
			image.transferTo(new File(savePath + "/" + updateFile.getProfilePath()));
		}
		
		
		// 수정 전 이미지를 서버에서 삭제
		if(file != null) {
		if(file.getProfileNo() == insertFile.getProfileNo()) {
			File deletefile = new File(
						savePath + "/" + file.getProfilePath());
			deletefile.delete();
		} 
		
		if(file.getProfileNo() == updateFile.getProfileNo()) {
			File deletefile = new File(
						savePath + "/" + file.getProfilePath());
			deletefile.delete();
		}
	}
		
      return result;
   }
   
   
   
   /** 마이페이지 비밀번호 변경
    * @param member
    * @param newPwd1
    * @return
    * @throws Exception
    */
   @Transactional(rollbackFor = Exception.class)
   @Override
   public int updatePwd(Member member, String newPwd1) throws Exception {
      
      // DB에 저장되어 있는 암호화된 비밀번호를 조회
      String savePwd = mypageDAO.selectPwd(member.getMemberNo());
      
      System.out.println("savePwd :" + savePwd);
      System.out.println("member.getMemberPwd" + member.getMemberPwd());
      
      
      // 조회해온 비밀번호를 담을 int
      int result = 0;
      if(savePwd != null) {
         
         if(bCryptPasswordEncoder.matches(member.getMemberPwd(),savePwd)) {
                        // 암호화되지 않은 현재입력한 비번, DB에서 조회한 암호화 된 비번
         
         // 위에값이 true(일치) 하면 새로운 비밀번호의 암호화 진행
         String encPwd = bCryptPasswordEncoder.encode(newPwd1);
         
         // 회원번호, 암호화 된 새로운 비밀번호를 DAO 전달
         // -> 암호화 된 새로운 비밀번호를 member set(memeber 재활용)
         member.setMemberPwd(encPwd);
         
         result = mypageDAO.updatePwd(member);
         
      }else {
         
         result = -1;
      }
      
      }
      return result;
      
   }
   
   
   
   /** 마이페이지 회원 탈퇴용
    * @param member
    * @return
    * @throws Exception
    */
   @Transactional(rollbackFor = Exception.class)
   @Override
   public int deleteMember(Member member) throws Exception {
      
      String savePwd = mypageDAO.selectPwd(member.getMemberNo());
      int result = 0;
      
      if(savePwd != null) {
         
         if(bCryptPasswordEncoder.matches(member.getMemberPwd(),savePwd)) {
               // 암호화되지 않은 현재입력한 비번, DB에서 조회한 암호화 된 비번
         result = mypageDAO.deleteMember(member);
         
         }else {
         
            result = -1;
         }
      }
      
      return result;
   }
   
   
   /** 문의내역 전체 게시글수 조회용
    * @param map
    * @return
    * @throws Exception
    */
    @Override 
    public int getAskCount() throws Exception {
    return mypageDAO.getAskCount(); 
    }
    
   
   
   /** 문의내역 게시글 조회
    * @param map
    * @param pInf
    * @return
    * @throws Exception
    */
   @Override
   public List<QnAEH> selectQlist(PageInfo pInf) throws Exception {
      return mypageDAO.selectQlist(pInf);
   }
   
   
   

   /** 문의내역 게시글 상세조회
    * @param no
    * @return
    * @throws Exception
    */
   @Override
   public QnAEH selectAsk(Integer no) throws Exception {
      return mypageDAO.selectAsk(no);
   }
   
   

}
