package com.bitcamp.board.service;

import java.util.List;
import com.bitcamp.member.model.MemberDto;

public interface MemberService {
	int idCheck(String mid);
	MemberDto userCheck(MemberDto memberDto);
	int insertMember(MemberDto memberDto);
	MemberDto selectMember(String mid);
	List<MemberDto> selectMemberAll();
	void modifyMember(MemberDto memberDto);
	void deleteMember(String mid);
}
