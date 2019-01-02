package com.bitcamp.board.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/badmin")
public class BoardAdminController {
  
  @RequestMapping("main.bit")
  public String boardmenu(Map<String, Object> model, HttpSession session) {
    if(session.getAttribute("userInfo") != null) {
    	return "main/main";
    }
    
    return "member/login";
  }
}