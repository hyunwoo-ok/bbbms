package com.bms.member.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bms.member.dao.MemberDao;
import com.bms.member.dto.MemberDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public MemberDto login(Map<String,String> loginMap) throws Exception{
		
		MemberDto memberDto = memberDao.login(loginMap);

		if (memberDto != null) {
			
			if (passwordEncoder.matches(loginMap.get("memberPw") , memberDto.getMemberPw())) {
				return memberDto;
			}
		}
		
		return null;
		
	}
	
	
	@Override
	public void addMember(MemberDto memberDTO) throws Exception{
		memberDao.insertNewMember(memberDTO);
	}
	
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDao.selectOverlappedID(id);
	}


	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSBMEYOFSV9JW4H"; 
		String api_secret = "OVZWTJOGMFMFEPZOBVSDVUXAKYLMCSE0"; 
		Message coolsms = new Message(api_key, api_secret); 
		
		// 4 params(to, from, type, text) are mandatory. must be filled 
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to",userPhoneNumber); // 수신전화번호 
		params.put("from", "01089194807"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
		params.put("app_version", "test app 1.2"); // application name and version 
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString()); 
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage()); 
				System.out.println(e.getCode()); 
			}
		}
		
	}
	

