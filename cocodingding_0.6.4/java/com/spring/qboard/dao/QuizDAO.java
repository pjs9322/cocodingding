package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.QuizVO;

public interface QuizDAO {

	// ��ü ���� ��� ��ȯ
	public List<QuizVO> selectQuizList() throws Exception;

	// ���� ���� ��ü ����
	public void insertQuiz(QuizVO quizVO) throws Exception;

	// ���� ���� ��ü ��ȯ
	public QuizVO selectQuiz(int qnum) throws Exception;

	// ���� ���� ��ü ����
	public void updateQuiz(QuizVO quizVO) throws Exception;

	// ���� ���� ��ü ����
	public void deleteQuiz(int qnum) throws Exception;

}
