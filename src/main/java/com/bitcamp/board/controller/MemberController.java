package com.bitcamp.board.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.board.admin.model.BoardListDto;
import com.bitcamp.board.admin.service.BoardAdminService;
import com.bitcamp.board.service.MemberService;
import com.bitcamp.member.model.MemberDto;
import com.bitcamp.util.AES256Cipher;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private BoardAdminService boardAdminService;
	

	@RequestMapping(value="modifyinfo", method = RequestMethod.PUT, headers={"Content-type=application/json"})
	public @ResponseBody int modifyMemberInfo(@RequestBody MemberDto memberDto) {
		System.out.println(memberDto.getMaddrcode());
		return memberService.modifyMember(memberDto);
	}
	
	@RequestMapping(value="modify")
	public ModelAndView modifyMember(MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/modify");
		return mav;
	}

	@RequestMapping(value="userCheck")
	public @ResponseBody boolean userCheck(MemberDto memberDto, HttpSession session) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		boolean resultBoo;
		AES256Cipher a256 = AES256Cipher.getInstance();
		String secu = a256.AES_Encode(memberDto.getMpwd());
		memberDto.setMpwd(secu);
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
	public ModelAndView insertMember(MemberDto memberDto) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		AES256Cipher a256 = AES256Cipher.getInstance();
		String secu = a256.AES_Encode(memberDto.getMpwd());
		memberDto.setMpwd(secu);
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
	public ModelAndView join(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/join");
		return mav;
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup(){
		return "member/jusoPopup";
	}
	
	@RequestMapping("login")
	public String login(Map<String, Object> model, HttpSession session, 
	                    @RequestParam("mid") String mid) {
	  List<BoardListDto> list = boardAdminService.getBoardMenu();
      model.put("menu", list);
      session.setAttribute("sessionID", mid);
	  
	  return "main/main";
	}
	
	@RequestMapping(value="memberList")
	public String memberList(Model model) {
		
		// 멤버리스트
		List<MemberDto> list = memberService.selectMemberAll();
		model.addAttribute("list", list);
		
		// 게시판
		List<BoardListDto> blist = boardAdminService.getBoardMenu();
		model.addAttribute("menu", blist);
		
		return "member/memberList";
	}
	
	@RequestMapping("memberView/{mid}")
	public String memberView(Model model, @RequestBody @PathVariable("mid") String mid) {
		
		// 멤버
		MemberDto member = memberService.selectMember(mid);
		model.addAttribute("member", member);
		
		// 게시판
		List<BoardListDto> blist = boardAdminService.getBoardMenu();
		model.addAttribute("menu", blist);
		
		return "member/memberView";
	}
	
	@RequestMapping(value="memberDelete/{mid}", method=RequestMethod.DELETE)
	public @ResponseBody String memberDelete(@PathVariable(value="mid") String mid) {
		
		// 멤버 삭제
		memberService.deleteMember(mid);
		
		return "../../member/memberList";
	}

}
