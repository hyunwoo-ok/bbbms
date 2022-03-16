package com.bms.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bms.member.dto.MemberDto;
import com.bms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value="/login.do" , method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		
		MemberDto memberDto = memberService.login(loginMap);		
		
		if (memberDto != null && memberDto.getDelYn().equals("N")) { 	
			HttpSession session = request.getSession();		
			session.setAttribute("isLogOn" , true);			
			session.setAttribute("memberInfo" , memberDto);		
			session.setMaxInactiveInterval(60 * 30);
			mv.setViewName("redirect:/main/main.do");	
		}
		else { 
			mv.addObject("invalidMember", true);
			mv.setViewName("/member/loginForm");
		}
		return mv;
		
	}
	
	
	@RequestMapping(value="/logout.do" , method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		
		mv.setViewName("redirect:/main/main.do");
		
		return mv;
	
	}
	
	
	@RequestMapping(value="/addMember.do" , method = RequestMethod.POST)
	public ResponseEntity<String> addMember(MemberDto memberDto ,@RequestParam("phone") String phone, HttpServletRequest request) throws Exception {
		memberDto.setHp1( phone.substring(0,3));
		memberDto.setHp2( phone.substring(3,7));
		memberDto.setHp3( phone.substring(7,11));
		
		if (memberDto.getEmailstsYn() == null)  memberDto.setEmailstsYn("N");
		if (memberDto.getSmsstsYn() == null)    memberDto.setSmsstsYn("N");
		
		memberDto.setMemberPw(passwordEncoder.encode(memberDto.getMemberPw()));
		
		memberService.addMember(memberDto);

		
		String message  = "<script>";
			   message += " alert('회원가입되었습니다.');";
			   message += " location.href='" + request.getContextPath() + "/member/loginForm.do';";
			   message += " </script>";
	    
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@RequestMapping(value="/overlapped.do" , method = RequestMethod.POST)
	public ResponseEntity<String> overlapped(@RequestParam("id") String id) throws Exception{
		return new ResponseEntity<String>(memberService.overlapped(id), HttpStatus.OK);
	}

	@RequestMapping(value="/loginForm.do" , method = RequestMethod.GET)
	public ModelAndView loginForm() throws Exception {
		return new ModelAndView("/member/loginForm");
	}

	@RequestMapping(value="/memberForm.do" , method = RequestMethod.GET)
	public ModelAndView memberForm() throws Exception {
		return new ModelAndView("/member/memberForm");
	}
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber)
	{ // 휴대폰 문자보내기 
		System.out.println(userPhoneNumber);
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		memberService.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); } 

	}

	
