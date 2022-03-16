package com.bms.member.dao;

import java.util.Map;

import com.bms.member.dto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(Map<String,String> loginMap) throws Exception;
	public void insertNewMember(MemberDto memberDto) throws Exception;
	public String selectOverlappedID(String id) throws Exception;

}
