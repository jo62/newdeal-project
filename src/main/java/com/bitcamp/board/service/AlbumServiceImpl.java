package com.bitcamp.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bitcamp.board.common.dao.CommonDao;
import com.bitcamp.board.dao.AlbumDao;
import com.bitcamp.board.model.AlbumDto;

@Service
public class AlbumServiceImpl implements AlbumService {
  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public int writeArticle(AlbumDto albumDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    albumDto.setSeq(seq);
    return sqlSession.getMapper(AlbumDao.class).writeArticle(albumDto);
  }

  @Override
  public List<AlbumDto> listArticle(Map<String, String> param) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public AlbumDto viewArticle(int seq) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public AlbumDto getArticle(int seq) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public void modifyArticle(AlbumDto albumDto) {
    // TODO Auto-generated method stub
    
  }

  @Override
  public void deleteArticle(int seq) {
    // TODO Auto-generated method stub
    
  }
  
}
