package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bg.plzSeatdown.admin.model.dao.AdminMemberDAO;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return adminMemberDAO.getListCount(map);
	}

	@Override
	public List<Member> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminMemberDAO.selectList(map, pInf);
	}

	@Override
	public Member selectMember(Integer no) throws Exception {
		return adminMemberDAO.selectMember(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member member) throws Exception {
		return adminMemberDAO.updateMember(member);
	}
	
	@Override
	public Attachment selectImg(Integer no) throws Exception {
		return adminMemberDAO.selectImg(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteMember(Integer no) throws Exception {
		return adminMemberDAO.deleteMember(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteImg(Integer no) throws Exception {
		return adminMemberDAO.deleteImg(no);
	}

	@Override
	public List<Member> selectSortList(Map<String, String> map, PageInfo pInf) throws Exception {
		return adminMemberDAO.selectSortList(map, pInf);
	}

	@Override
	public int nicknameDupCheck(String memberNickname) throws Exception {
		return adminMemberDAO.nicknameDupChekc(memberNickname);
	}
	

}
