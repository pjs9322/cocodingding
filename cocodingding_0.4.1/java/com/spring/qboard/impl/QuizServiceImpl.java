package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.qboard.dao.QuizDAO;
import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.QuizVO;

@Service("QuizService")
public class QuizServiceImpl implements QuizService {
	@Autowired
	private QuizDAO QuizMapper;

	@Override
	public List<QuizVO> selectQuizList() throws Exception {
		// 전체 문제 목록 반환
		return QuizMapper.selectQuizList();
	}

	@Override
	public void insertQuiz(QuizVO quizVO) throws Exception {
		// 단일 문제 객체 삽입
		QuizMapper.insertQuiz(quizVO);
	}

	@Override
	public QuizVO selectQuiz(int qnum) throws Exception {
		// 단일 문제 객체 반환
		return QuizMapper.selectQuiz(qnum);
	}

	@Override
	public void updateQuiz(QuizVO quizVO) throws Exception {
		// 단일 문제 객체 수정
		QuizMapper.updateQuiz(quizVO);
	}

	@Override
	public void deleteQuiz(int qnum) throws Exception {
		// 단일 문제 객체 삭제
		QuizMapper.deleteQuiz(qnum);
	}


}
