package com.bitcamp.board.service;

import com.bitcamp.member.model.MemberDto;

public interface MemberService {
	int idCheck(String mid);
	void insertMember(MemberDto memberDto);
	MemberDto selectMember(String mid);
	void modifyMember(MemberDto memberDto);
	void deleteMember(String mid);
}
