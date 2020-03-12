package com.bg.plzSeatdown.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.community.model.vo.Community;

@Repository("communityDAO")
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 게시글 수 조회용 DAO
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("yhbCommunityMapper.getListCount", map);
	}

	/** 게시글 목록 조회용
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<Community> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage()-1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("yhbCommunityMapper.selectList", map, rowBounds);
	}

}
