package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminQnaDAO;
import com.bg.plzSeatdown.admin.model.vo.AdminQna;
import com.bg.plzSeatdown.admin.model.vo.AdminQnaAnswer;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	private AdminQnaDAO adminQnaDAO;

	@Override
	public int getListCount(Map<String, String> map) throws Exception{
		return adminQnaDAO.getListCount(map);
	}

	@Override
	public List<AdminQna> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminQnaDAO.selectList(map, pInf);
	}

	@Override
	public AdminQna selectQna(Integer no) throws Exception {
		AdminQna adminQna = adminQnaDAO.selectQna(no);
		adminQna.setQnaContent(adminQna.getQnaContent().replace("<br>","\r\n"));
		return adminQna;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAnswer(AdminQnaAnswer adminQnaAnswer) throws Exception {
		
		int result = 0;
		adminQnaAnswer.setQnaAnswer(adminQnaAnswer.getQnaAnswer().replace("<br>", "\r\n"));		

		result = adminQnaDAO.insertAnswer(adminQnaAnswer);

		int no = adminQnaAnswer.getQnaNo();
//		System.out.println("서비스 no : " + no);
		int status = adminQnaDAO.updateQnaStatus(no);
//		if(result > 0 ) {
		if(result > 0 && status > 0) {
			
			result = no;
		}
		return  result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteQna(Integer no) throws Exception {
		return adminQnaDAO.deleteQna(no);
	}

	@Override
	public List<AdminQna> selectInfo(Integer no) throws Exception {
		return adminQnaDAO.selectInfo(no);
	}

	@Override
	public String selectAnswer(Integer no) throws Exception {
		return adminQnaDAO.selectAnswer(no);
	}





}
