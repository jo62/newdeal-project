package com.bitcamp.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.board.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="idcheck")
	public @ResponseBody boolean idcheck(String mid) {
		int result = memberService.idCheck(mid);
		return(result!=0)?true:false;
	}
	
	@RequestMapping("join")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/join");
		return mav;
	}
}
