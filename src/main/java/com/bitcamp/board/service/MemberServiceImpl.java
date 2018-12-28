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
	public void insertMember(MemberDto memberDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberDto selectMember(String mid) {
		return sqlSession.getMapper(MemberDao.class).selectMember(mid);
	}

	@Override
	public void modifyMember(MemberDto memberDto) {
		// TODO Auto-generated method stub

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