package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.QuizVO;


public interface QuizService {
	
	// 전체 유저 목록 보기
	public List<QuizVO> selectQuizList() throws Exception;

	// 신규 유저 회원가입
	public void insertQuiz(QuizVO quizVO) throws Exception;
	
	// 유저 개인정보 보기
	public QuizVO selectQuiz(int qnum) throws Exception;
	
	// 유저 개인정보 수정
	public void updateQuiz(QuizVO quizVO) throws Exception;
	
	// 유저 탈퇴
	public void deleteQuiz(int qnum) throws Exception;
}
