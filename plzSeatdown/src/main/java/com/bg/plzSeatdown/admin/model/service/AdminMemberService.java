package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;

public interface AdminMemberService {

	public abstract int getListCount(Map<String, String> map) throws Exception;

	public abstract List<Member> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	public abstract Member selectMember(Integer no) throws Exception;

	public abstract Attachment selectImg(Integer no) throws Exception;

	public abstract int updateMember(Member member) throws Exception;

	public abstract int deleteMember(Integer no) throws Exception;

	public abstract int deleteImg(Integer no) throws Exception;

	public abstract List<Member> selectSortList(Map<String, String> map, PageInfo pInf) throws Exception;

}
