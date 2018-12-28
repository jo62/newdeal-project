package com.bitcamp.board.dao;

import java.util.List;
import com.bitcamp.member.model.MemberDto;

public interface MemberDao {
	int idCheck(String mid);
	MemberDto userCheck(MemberDto memberDto);
	int insertMember(MemberDto memberDto);
	MemberDto selectMember(String mid);
	int modifyMember(MemberDto memberDto);
	List<MemberDto> selectMemberAll();
	void deleteMember(String mid);
}
