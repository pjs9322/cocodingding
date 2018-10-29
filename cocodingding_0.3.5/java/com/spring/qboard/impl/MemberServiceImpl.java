package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.qboard.dao.MemberDAO;
import com.spring.qboard.service.MemberService;
import com.spring.qboard.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO MemberMapper;

	@Override
	public List<MemberVO> selectMemberList() throws Exception {
		// ��ü ���� ��� ��ȯ
		return MemberMapper.selectMemberList();
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// ���� ���� ��ü ����
		MemberMapper.insertMember(memberVO);
	}

	@Override
	public MemberVO selectMember(String id) throws Exception {
		// ���� ���� ��ü ��ȯ
		return MemberMapper.selectMember(id);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// ���� ���� ��ü ����
		MemberMapper.updateMember(memberVO);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		//���� ���� ��ü ����
		MemberMapper.deleteMember(id);
	}


}