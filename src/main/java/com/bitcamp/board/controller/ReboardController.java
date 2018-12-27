package com.bitcamp.board.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.bitcamp.board.common.service.CommonService;
import com.bitcamp.board.model.ReboardDto;
import com.bitcamp.board.service.ReboardService;
import com.bitcamp.member.model.MemberDto;
import com.bitcamp.util.PageNavigation;

@Controller
@RequestMapping("/reboard")
public class ReboardController {
  @Autowired
  private ReboardService reboardService;
  
  @Autowired
  private CommonService commonService;
  
  @RequestMapping("list.bit")
  public ModelAndView list(@RequestParam Map<String, String> param) {
    ModelAndView mav = new ModelAndView();
    List<ReboardDto> list = reboardService.listArticle(param);
    PageNavigation navigation = commonService.makePageNavigation(param);
    
    navigation.setRoot("/board");
    navigation.makeNavigator();
    
    mav.addObject("articlelist", list);
    mav.addObject("navigator", navigation);
    mav.setViewName("reboard/list");
    
    return mav;
  }
  
  @RequestMapping(value = "write.bit", method = RequestMethod.GET)
  public String write(@RequestParam Map<String, String> param) {
    return "reboard/write";
  }
  
  @RequestMapping(value = "write.bit", method = RequestMethod.POST)
  public String write(ReboardDto reboardDto, @RequestParam Map<String, String> param, HttpSession session, Model model) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if(memberDto != null) {
      reboardDto.setId(memberDto.getId());
      reboardDto.setName(memberDto.getName());
      reboardDto.setEmail(memberDto.getEmail());
      
      int seq = reboardService.writeArticle(reboardDto);
      if(seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다!!!");
    }
    
    return "reboard/writeOk";
  }
  
  @RequestMapping("view.bit")
  public String view(@RequestParam int seq, HttpSession session, Model model) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    
    if(memberDto != null) {
      ReboardDto reboardDto = reboardService.viewArticle(seq);
      model.addAttribute("article", reboardDto);
    }
    
    return "reboard/view";
  }
  
  @RequestMapping(value = "reply.bit", method = RequestMethod.GET)
  public String reply(@RequestParam int seq, Model model, HttpSession session) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    
    if(memberDto != null) {
      ReboardDto reboardDto = reboardService.viewArticle(seq);
      model.addAttribute("article", reboardDto);
    }
    
    return "reboard/reply";
  }
  
  @RequestMapping(value = "reply.bit", method = RequestMethod.POST)
  public String reply(ReboardDto reboardDto, @RequestParam Map<String, String> param, HttpSession session, Model model) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if(memberDto != null) {
      reboardDto.setId(memberDto.getId());
      reboardDto.setName(memberDto.getName());
      reboardDto.setEmail(memberDto.getEmail());
      
      int seq = reboardService.replyArticle(reboardDto);
      if(seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다!!!");
    }
    
    return "reboard/writeOk";
  }
}
