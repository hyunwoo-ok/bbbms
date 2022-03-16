package com.bms.member.service;

import java.util.Map;

import com.bms.member.dto.MemberDto;

public interface MemberService {
	
	public MemberDto login(Map<String,String> loginMap) throws Exception;
	public void addMember(MemberDto memberDTO) throws Exception;
	public String overlapped(String id) throws Exception;
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

}
