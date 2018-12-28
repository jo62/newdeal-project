package com.bitcamp.board.dao;

import java.util.List;

import com.bitcamp.member.model.MemberDto;

public interface MemberDao {
	int idCheck(String mid);
	MemberDto userCheck(MemberDto memberDto);
	int insertMember(MemberDto memberDto);
	MemberDto selectMember(String mid);
	List<MemberDto> selectMemberAll();
	int modifyMember(MemberDto memberDto);
	void deleteMember(String mid);
}