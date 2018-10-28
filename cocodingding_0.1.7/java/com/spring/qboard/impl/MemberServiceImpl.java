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
	private MemberDAO ReplyMapper;

	@Override
	public List<MemberVO> selectMemberList() throws Exception {
		// 전체 유저 목록 반환
		return ReplyMapper.selectMemberList();
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// 단일 유저 객체 삽입
		ReplyMapper.insertMember(memberVO);
	}

	@Override
	public MemberVO selectMember(String id) throws Exception {
		// 단일 유저 객체 반환
		return ReplyMapper.selectMember(id);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// 단일 유저 객체 수정
		ReplyMapper.updateMember(memberVO);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		//단일 유저 객체 삭제
		ReplyMapper.deleteMember(id);
	}


}
