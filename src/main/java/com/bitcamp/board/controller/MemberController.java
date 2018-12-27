package com.bitcamp.board.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.board.service.MemberService;
import com.bitcamp.member.model.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="userCheck")
	public @ResponseBody boolean userCheck(MemberDto memberDto, HttpSession session) {
		boolean resultBoo;
		MemberDto returnMemberDto = memberService.userCheck(memberDto);
		if (returnMemberDto != null) {
			resultBoo=true;
			session.setAttribute("userInfo", returnMemberDto);
		} else {
			resultBoo=false;
		}
		return resultBoo;
	}
	
	@RequestMapping(value="insertMember")
	public ModelAndView insertMember(MemberDto memberDto) {
		int result = memberService.insertMember(memberDto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	@RequestMapping(value="idCheck", method = RequestMethod.POST)
	public @ResponseBody boolean idcheck(String mid) {
		int result = memberService.idCheck(mid);
		return(result==0)?true:false;
	}
	
	@RequestMapping("join")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/join");
		return mav;
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup(){
		return "member/jusoPopup";
	}
	
	
}
