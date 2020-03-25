package com.bg.plzSeatdown.websocket.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;
import com.bg.plzSeatdown.websocket.model.dao.WebChattingDAO;

@Service
public class WebChattingServiceImpl implements WebChattingService{
	
	@Autowired
	private WebChattingDAO webChattingDAO;

	@Override
	public Member selectNickName(int memberNo) throws Exception {
		return webChattingDAO.selectNickName(memberNo);
	}

	@Override
	public Profile selectProfileProp(int memberNo) throws Exception {
		return webChattingDAO.selectPropfileProp(memberNo);
	}

}
