package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.QuizVO;

public interface QuizDAO {

	// 전체 문제 목록 반환
	public List<QuizVO> selectQuizList() throws Exception;

	// 단일 문제 객체 삽입
	public void insertQuiz(QuizVO quizVO) throws Exception;

	// 단일 문제 객체 반환
	public QuizVO selectQuiz(int qnum) throws Exception;

	// 단일 문제 객체 수정
	public void updateQuiz(QuizVO quizVO) throws Exception;

	// 단일 문제 객체 삭제
	public void deleteQuiz(int qnum) throws Exception;

}
