package com.project.trip.member.service;

import java.util.List;

import com.project.trip.buy.vo.BookViewVO;
import com.project.trip.member.vo.MemberVO;
import com.project.trip.member.vo.TempMemberVO;

public interface MemberService {
	void join(MemberVO memberVO);
	MemberVO login(MemberVO memberVO);
	String selectId(MemberVO memberVO);
	MemberVO selectTell(MemberVO memberVO);
	List<String> selectName(MemberVO memberVO);
	TempMemberVO tempLogin(TempMemberVO tempMemberVO);
	MemberVO findId(MemberVO memberVO);
	MemberVO findPw(MemberVO memberVO);
	void changePw(MemberVO memberVO);
	void changeMemberInfo(MemberVO memberVO);
	void deactivateMember(MemberVO memberVO);
	MemberVO findDeactivateMember(MemberVO memberVO);

	MemberVO selectMemberInfo(MemberVO memberVO);
	List<BookViewVO> selectBookList(String memId);
	
	TempMemberVO selectTempMember(TempMemberVO tempMemberVO);
	
	int findTempMember(TempMemberVO tempMemberVO);
	
}
