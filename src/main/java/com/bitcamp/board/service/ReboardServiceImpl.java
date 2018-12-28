package com.bitcamp.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bitcamp.board.common.dao.CommonDao;
import com.bitcamp.board.dao.ReboardDao;
import com.bitcamp.board.model.ReboardDto;
import com.bitcamp.util.BoardConstance;

@Service
public class ReboardServiceImpl implements ReboardService {
  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public int writeArticle(ReboardDto reboardDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    reboardDto.setSeq(seq);
    reboardDto.setRef(seq);
    int cnt = sqlSession.getMapper(ReboardDao.class).writeArticle(reboardDto);
    
    return cnt != 0 ? seq : 0;
  }

  @Override
  public List<ReboardDto> listArticle(Map<String, String> param) {
    int pg = Integer.parseInt(param.get("pg"));
    int end = pg * BoardConstance.List_COUNT;
    int start = end - BoardConstance.List_COUNT;
    param.put("start", start + "");
    param.put("end", end + "");
    
    return sqlSession.getMapper(ReboardDao.class).listArticle(param);
  }

  @Override
  public ReboardDto viewArticle(int seq) {
    ReboardDto reboardDto = sqlSession.getMapper(ReboardDao.class).viewArticle(seq);
    if(reboardDto != null) {
      reboardDto.setContent(reboardDto.getContent().replace("\n", "<br>"));
      sqlSession.getMapper(CommonDao.class).updateHit(seq);
    }
    
    return reboardDto;
  }
  
  @Override
  public ReboardDto getArticle(int seq) {
    return sqlSession.getMapper(ReboardDao.class).viewArticle(seq);
  }

  @Override
  @Transactional
  public int replyArticle(ReboardDto reboardDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    reboardDto.setSeq(seq);
    ReboardDao  reboardDao = sqlSession.getMapper(ReboardDao.class);
    reboardDao.updateStep(reboardDto);
    reboardDao.replyArticle(reboardDto);
    reboardDao.updateReply(reboardDto.getPseq());
    
    return seq;
  }

  @Override
  public void modifyArticle(ReboardDto reboardDto) {
    // TODO Auto-generated method stub
    
  }

  @Override
  public void deleteArticle(int seq) {
    // TODO Auto-generated method stub
    
  }
}
