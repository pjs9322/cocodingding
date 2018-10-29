package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.MemberVO;

public interface MemberDAO {

	// 전체 유저 목록 반환
	public List<MemberVO> selectMemberList() throws Exception;

	// 단일 유저 객체 삽입
	public void insertMember(MemberVO memberVO) throws Exception;

	// 단일 유저 객체 반환
	public MemberVO selectMember(String id) throws Exception;

	// 단일 유저 객체 수정
	public void updateMember(MemberVO memberVO) throws Exception;

	// 단일 유저 객체 삭제
	public void deleteMember(String id) throws Exception;

}
