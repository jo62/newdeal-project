package com.bitcamp.board.admin.dao;

import java.util.List;
import com.bitcamp.board.admin.model.BoardListDto;
import com.bitcamp.board.admin.model.BoardTypeDto;
import com.bitcamp.board.admin.model.CategoryDto;

public interface BoardAdminDao {
  List<BoardListDto> getBoardMenu();
  
  List<CategoryDto> getCategory();
  void makeCategory(CategoryDto categoryDto);
  List<BoardTypeDto> getBoardType();
  void makeBoard(BoardListDto boardListDto);
}
