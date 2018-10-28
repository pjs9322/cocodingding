package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.MemberVO;


public interface MemberService {
	
	// ��ü ���� ��� ����
	public List<MemberVO> selectMemberList() throws Exception;

	// �ű� ���� ȸ������
	public void insertMember(MemberVO memberVO) throws Exception;
	
	// ���� �������� ����
	public MemberVO selectMember(String string) throws Exception;
	
	// ���� �������� ����
	public void updateMember(MemberVO memberVO) throws Exception;
	
	// ���� Ż��
	public void deleteMember(String id) throws Exception;
}
