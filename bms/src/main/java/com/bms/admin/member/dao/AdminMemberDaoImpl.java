package com.bms.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.member.dto.MemberDto;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberDto> listMember(Map<String,Object> condMap) throws Exception{
		return sqlSession.selectList("mapper.admin.member.listMember" , condMap);
	}
	
	public MemberDto memberDetail(String memberId) throws Exception{
		return sqlSession.selectOne("mapper.admin.member.memberDetail" , memberId);
	}
	
	public void modifyMemberInfo(Map<String,String> memberMap) throws Exception{
		sqlSession.update("mapper.admin.member.modifyMemberInfo" , memberMap);
	}
	
}
