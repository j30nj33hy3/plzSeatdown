package com.bg.plzSeatdown.admin.model.service;

import java.util.List;
import java.util.Map;

import com.bg.plzSeatdown.admin.model.vo.AdminQna;
import com.bg.plzSeatdown.admin.model.vo.AdminQnaAnswer;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.mypage.model.vo.QnAEH;

public interface AdminQnaService {

	public abstract int getListCount(Map<String, String> map) throws Exception;

	public abstract List<AdminQna> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	public abstract AdminQna selectQna(Integer no) throws Exception;

	public abstract int insertAnswer(AdminQnaAnswer adminQnaAnswer) throws Exception;

	public abstract int deleteQna(Integer no) throws Exception;

	public abstract List<AdminQna> selectInfo(Integer no) throws Exception;

	public abstract String selectAnswer(Integer no) throws Exception;




}
