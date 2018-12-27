package com.bitcamp.board.common.service;

import java.util.Map;
import com.bitcamp.util.PageNavigation;

public interface CommonService {
  PageNavigation makePageNavigation(Map<String, String> param);
}
