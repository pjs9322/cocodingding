package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.MemberVO;


public interface MemberService {
	
	// 전체 유저 목록 보기
	public List<MemberVO> selectMemberList() throws Exception;

	// 신규 유저 회원가입
	public void insertMember(MemberVO memberVO) throws Exception;
	
	// 유저 개인정보 보기
	public MemberVO selectMember(String string) throws Exception;
	
	// 유저 개인정보 수정
	public void updateMember(MemberVO memberVO) throws Exception;
	
	// 유저 탈퇴
	public void deleteMember(String id) throws Exception;
}
