package com.bitcamp.board.service;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyMember(MemberDto memberDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMember(String mid) {
		// TODO Auto-generated method stub

	}

}
