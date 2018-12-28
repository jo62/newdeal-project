package com.bitcamp.board.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bitcamp.board.model.MemoDto;
import com.bitcamp.board.service.MemoService;
import com.bitcamp.member.model.MemberDto;

//@RestController(@Controller + @ResponseBody 합친것)
@Controller
public class MemoController {
  @Autowired
  private MemoService memoService;
  
  @RequestMapping(value="memo", method=RequestMethod.POST, headers={"Content-type=application/json"})
  public @ResponseBody String write(@RequestBody MemoDto memoDto, HttpSession session) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    
    if(memberDto != null) {
      memoDto.setId(memberDto.getMid());
      memoDto.setName(memberDto.getMname());
      int cnt = memoService.writeMemo(memoDto);
    }
   
    String memolist = memoService.listMemo(memoDto.getSeq());
    
    return memolist;
  }
  
  @RequestMapping(value="memo/{seq}", method=RequestMethod.GET)
  public @ResponseBody String list(@PathVariable("seq") int seq) {
    String memolist = memoService.listMemo(seq);
    
    return memolist;
  }
  
  @RequestMapping(value="memo", method=RequestMethod.PUT, headers={"Content-type=application/json"})
  public @ResponseBody String modify(@RequestBody MemoDto memoDto, HttpSession session) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    
    if(memberDto != null) {
      int cnt = memoService.modifyMemo(memoDto);
    }
   
    String memolist = memoService.listMemo(memoDto.getSeq());
    
    return memolist;
  }
  
  @RequestMapping(value="memo/{seq}/{mseq}", method=RequestMethod.DELETE)
  public @ResponseBody String delete(@PathVariable(value="seq") int seq, @PathVariable(value="mseq") int mseq) {
    memoService.deleteMemo(mseq);
    String memolist = memoService.listMemo(seq);
    
    return memolist;
  }
  
}
