package com.bg.plzSeatdown.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bg.plzSeatdown.common.vo.PageInfo;
import com.bg.plzSeatdown.member.model.vo.Attachment;
import com.bg.plzSeatdown.member.model.vo.Member;

@Repository("adminMemberDAO")
public class AdminMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 전체 회원 수 조회
	 * @param map
	 * @return listCount
	 */
	public int getListCount(Map<String, String> map) {
		return sqlSession.selectOne("adminMemberMapper.getListCount", map);
	}

	/** 회원 목록 조회 
	 * @param map
	 * @param pInf
	 * @return list
	 */
	public List<Member> selectList(Map<String, String> map, PageInfo pInf) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminMemberMapper.selectList", map, rowBounds);
	}

	/** 회원 상세조회
	 * @param no
	 * @return member
	 * @throws Exception
	 */
	public Member selectMember(Integer no) throws Exception{
		return sqlSession.selectOne("adminMemberMapper.selectMember", no);
	}

	/** 회원 프로필 이미지 조회
	 * @param no
	 * @return attachment
	 * @throws Exception
	 */
	public Attachment selectImg(Integer no) throws Exception{
		return sqlSession.selectOne ("adminMemberMapper.selectImg", no);
	}

	/** 회원 정보 수정
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Member member) throws Exception {
		return sqlSession.update("adminMemberMapper.updateMember", member);
	}
	
	/** 회원 삭제
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deleteMember(Integer no) throws Exception {
		return sqlSession.update("adminMemberMapper.deleteMember", no);
	}

	public int deleteImg(Integer no) throws Exception{
		return sqlSession.update("adminMemberMapper.deleteImg", no);
	}

	public List<Member> selectSortList(Map<String, String> map, PageInfo pInf) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("adminMemberMapper.selectSortList", map, rowBounds);
	}

	public int nicknameDupChekc(String memberNickname) throws Exception {
		return sqlSession.selectOne("adminMemberMapper.nicknameDupCheck", memberNickname);
	}

}
