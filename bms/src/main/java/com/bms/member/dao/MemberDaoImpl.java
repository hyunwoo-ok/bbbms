package com.bms.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberDto login(Map<String,String> loginMap) throws Exception{
	   return sqlSession.selectOne("mapper.member.login" , loginMap);
	}
	
	@Override
	public void insertNewMember(MemberDto memberDto) throws Exception{
		sqlSession.insert("mapper.member.insertNewMember" , memberDto);
	}

	@Override
	public String selectOverlappedID(String id) throws Exception{
		return sqlSession.selectOne("mapper.member.selectOverlappedID" , id);
	}
	
	
}
