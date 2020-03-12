package com.bg.plzSeatdown.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.dao.CommunityDAO;
import com.bg.plzSeatdown.community.model.vo.Community;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDAO communityDAO;

	/** 전체 게시글 수 조회용 Service
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return communityDAO.getListCount(map);
	}

	/** 게시글 목록 조회용 Service
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Community> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return communityDAO.selectList(map, pInf);
	}
	
	

}
