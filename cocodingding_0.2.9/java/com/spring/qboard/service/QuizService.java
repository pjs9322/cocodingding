package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.QuizVO;


public interface QuizService {
	
	// ��ü ���� ��� ����
	public List<QuizVO> selectQuizList() throws Exception;

	// �ű� ���� ȸ������
	public void insertQuiz(QuizVO quizVO) throws Exception;
	
	// ���� �������� ����
	public QuizVO selectQuiz(int qnum) throws Exception;
	
	// ���� �������� ����
	public void updateQuiz(QuizVO quizVO) throws Exception;
	
	// ���� Ż��
	public void deleteQuiz(int qnum) throws Exception;
}
