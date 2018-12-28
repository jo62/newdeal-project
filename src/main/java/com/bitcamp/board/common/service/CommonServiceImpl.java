package com.bitcamp.board.common.service;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bitcamp.board.common.dao.CommonDao;
import com.bitcamp.util.BoardConstance;
import com.bitcamp.util.PageNavigation;

@Service
public class CommonServiceImpl implements CommonService {

  @Autowired
  SqlSession sqlSession;
  
  @Override
  public PageNavigation makePageNavigation(Map<String, String> param) {
    int pg = Integer.parseInt(param.get("pg"));
    int pageSize = BoardConstance.Page_COUNT;
    int listSize = BoardConstance.List_COUNT;
    
    PageNavigation navigation = new PageNavigation();
    int newArticleCount = sqlSession.getMapper(CommonDao.class)
        .getNewArticleCount(Integer.parseInt(param.get("bcode")));
    int totalArticleCount = sqlSession.getMapper(CommonDao.class).getTotalArticleCount(param);
    int totalPageCount = (totalArticleCount - 1) / listSize + 1;
    
    navigation.setNewArticleCount(newArticleCount);
    navigation.setTotalArticleCount(totalArticleCount);
    navigation.setTotalPageCount(totalPageCount);
    navigation.setPageNo(pg);
    navigation.setNowFirst(pg <= pageSize);
    navigation.setNowEnd((totalPageCount - 1) / pageSize * pageSize < pg);
    
    return navigation;
  }

}
