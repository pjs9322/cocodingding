package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.qboard.dao.IncorrectDAO;
import com.spring.qboard.service.IncorrectService;
import com.spring.qboard.vo.IncorrectVO;

@Service("IncorrectService")
public class IncorrectServiceImpl implements IncorrectService {
	@Autowired
	private IncorrectDAO IncorrectMapper;

	@Override
	public List<IncorrectVO> selectIncorrectList() throws Exception {
		// 틀린 문제 목록 반환
		return IncorrectMapper.selectIncorrectList();
	}
	
	@Override
	public void insertIncorrect(IncorrectVO incorrectVO) throws Exception {
		// 틀린 문제 삽입
		IncorrectMapper.insertIncorrect(incorrectVO);
	}

	@Override
	public List<IncorrectVO> selectIncorrect(String id) throws Exception {
		// 유저별 틀린 문제 찾기
		return IncorrectMapper.selectIncorrect(id);
	}

	@Override
	public void deleteIncorrect(IncorrectVO incorrectVO) throws Exception {
		// 틀린 문제 삭제
		IncorrectMapper.deleteIncorrect(incorrectVO);
	}

}
