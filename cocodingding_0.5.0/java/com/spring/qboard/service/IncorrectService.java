package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.IncorrectVO;


public interface IncorrectService {
	
	// ��ü ��ٱ��� ��� ����
	public List<IncorrectVO> selectIncorrectList() throws Exception;

	// ���� ��ٱ��� �߰�
	public void insertIncorrect(IncorrectVO incorrectVO) throws Exception;
	
	// ������ ��ٱ��� ����
	public IncorrectVO selectIncorrect(int qnum) throws Exception;
	
	// ���� ��ٱ��� ����
	public void deleteIncorrect(IncorrectVO incorrectVO) throws Exception;
	
}
