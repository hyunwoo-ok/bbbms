package com.bms.admin.member.service;

import java.util.List;
import java.util.Map;

import com.bms.member.dto.MemberDto;

public interface AdminMemberService {
	
	public List<MemberDto> listMember(Map<String,Object> condMap) throws Exception;
	public MemberDto memberDetail(String memberId) throws Exception;
	public void modifyMemberInfo(Map<String,String> memberMap) throws Exception;
	
}
