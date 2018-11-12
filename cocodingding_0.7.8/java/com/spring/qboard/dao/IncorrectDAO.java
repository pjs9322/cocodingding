package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.IncorrectVO;

public interface IncorrectDAO {

	// ��ü ���� ��� ��ȯ
	public List<IncorrectVO> selectIncorrectList() throws Exception;

	// Ʋ������ ����
	public void insertIncorrect(IncorrectVO incorrectVO) throws Exception;

	// Ʋ������ ���� ����
	public List<IncorrectVO> selectIncorrect(String id) throws Exception;

	// Ʋ������ ���� ��ü ����
	public void deleteIncorrect(IncorrectVO incorrectVO) throws Exception;

}
