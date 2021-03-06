package com.bitcamp.board.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.board.dao.MemberDao;
import com.bitcamp.member.model.MemberDto;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String mid) {
		int result = sqlSession.getMapper(MemberDao.class).idCheck(mid);
		return result;
	}

	@Override
	public MemberDto userCheck(MemberDto memberDto) {
		MemberDto result = sqlSession.getMapper(MemberDao.class).userCheck(memberDto);
		return result;
	}
	
	@Override
	public int insertMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberDao.class).insertMember(memberDto);
	}

	@Override
	public MemberDto selectMember(String mid) {
		return sqlSession.getMapper(MemberDao.class).selectMember(mid);
	}

	@Override
	public int modifyMember(MemberDto memberDto) {
		System.out.println("서비스");
		return sqlSession.getMapper(MemberDao.class).modifyMember(memberDto);

	}

	@Override
	public void deleteMember(String mid) {
		sqlSession.getMapper(MemberDao.class).deleteMember(mid);

	}
	
	@Override
    public List<MemberDto> selectMemberAll(){
        return sqlSession.getMapper(MemberDao.class).selectMemberAll();
    }

}
