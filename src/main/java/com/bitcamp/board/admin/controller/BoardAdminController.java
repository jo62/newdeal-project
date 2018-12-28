package com.bitcamp.board.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.board.admin.service.BoardAdminService;

@Controller
@RequestMapping("/badmin")
public class BoardAdminController {
  @Autowired
  private BoardAdminService boardAdminService;
  
  @RequestMapping("main.bit")
  public String boardmenu(Map<String, Object> model) {
//    List<BoardListDto> list = boardAdminService.getBoardMenu();
//    
//    model.put("menu", list);
    
    return "member/login";
  }
}