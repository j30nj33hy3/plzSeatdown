package com.bg.plzSeatdown.websocket.model.service;

import com.bg.plzSeatdown.member.model.vo.Member;
import com.bg.plzSeatdown.mypage.model.vo.Profile;

public interface WebChattingService {

	public abstract Member selectNickName(int memberNo) throws Exception;

	public abstract Profile selectProfileProp(int memberNo) throws Exception;

}
