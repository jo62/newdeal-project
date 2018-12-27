package com.bitcamp.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.board.admin.model.BoardListDto;
import com.bitcamp.board.admin.service.BoardAdminService;
import com.bitcamp.board.service.MemberService;
import com.bitcamp.member.model.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardAdminService boardAdminService;
	
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
	
	@RequestMapping("memberList")
	public String memberList(Model model) {
		
		// 멤버
		List<MemberDto> list = memberService.selectMemberAll();
		model.addAttribute("list", list);
		
		// 게시판
		List<BoardListDto> blist = boardAdminService.getBoardMenu();
		model.addAttribute("menu", blist);
		
		return "member/memberList";
	}
	/*
	@RequestMapping("memberReg")
	public String memberReg(Model model) {
		
		// 게시판
		List<BoardListDto> blist = boardAdminService.getBoardMenu();
		model.addAttribute("menu", blist);
		
		return "member/memberReg";
	}
	
	@RequestMapping("memberView")
	public String memberView(Model model) {
		
		// 게시판
		List<BoardListDto> blist = boardAdminService.getBoardMenu();
		model.addAttribute("menu", blist);
		
		return "member/memberView";
	}
	*/
}