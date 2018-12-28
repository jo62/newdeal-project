package com.bitcamp.board.service;

import java.util.List;
import java.util.Map;
import com.bitcamp.board.model.ReboardDto;

public interface ReboardService {
  int writeArticle(ReboardDto reboardDto);
  List<ReboardDto> listArticle(Map<String, String> param);
  ReboardDto viewArticle(int seq);
  ReboardDto getArticle(int seq);
  int replyArticle(ReboardDto reboardDto);
  
  void modifyArticle(ReboardDto reboardDto);
  void deleteArticle(int seq);
  
}
