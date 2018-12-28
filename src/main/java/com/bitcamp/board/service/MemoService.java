package com.bitcamp.board.service;

import com.bitcamp.board.model.MemoDto;

public interface MemoService {
  int writeMemo(MemoDto memoDto);
  String listMemo(int seq);
  int modifyMemo(MemoDto memoDto);
  int deleteMemo(int mseq);
}
