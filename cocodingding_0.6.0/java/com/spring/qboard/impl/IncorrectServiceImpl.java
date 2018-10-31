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
		// Ʋ�� ���� ��� ��ȯ
		return IncorrectMapper.selectIncorrectList();
	}
	
	@Override
	public void insertIncorrect(IncorrectVO incorrectVO) throws Exception {
		// Ʋ�� ���� ����
		IncorrectMapper.insertIncorrect(incorrectVO);
	}

	@Override
	public List<IncorrectVO> selectIncorrect(String id) throws Exception {
		// ������ Ʋ�� ���� ã��
		return IncorrectMapper.selectIncorrect(id);
	}

	@Override
	public void deleteIncorrect(IncorrectVO incorrectVO) throws Exception {
		// Ʋ�� ���� ����
		IncorrectMapper.deleteIncorrect(incorrectVO);
	}

}
