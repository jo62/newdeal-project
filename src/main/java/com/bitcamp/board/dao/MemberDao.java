package com.bitcamp.board.dao;

import com.bitcamp.member.model.MemberDto;

public interface MemberDao {
	int idCheck(String mid);
	void insertMember(MemberDto memberDto);
	MemberDto selectMember(String mid);
	void modifyMember(MemberDto memberDto);
	void deleteMember(String mid);
}
