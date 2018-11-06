package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.MemberVO;

public interface MemberDAO {

	// ��ü ���� ��� ��ȯ
	public List<MemberVO> selectMemberList() throws Exception;

	// ���� ���� ��ü ����
	public void insertMember(MemberVO memberVO) throws Exception;

	// ���� ���� ��ü ��ȯ
	public MemberVO selectMember(String id) throws Exception;

	// ���� ���� ��ü ����
	public void updateMember(MemberVO memberVO) throws Exception;

	// ���� ���� ��ü ����
	public void deleteMember(String id) throws Exception;

}
