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
	private QuizDAO ReplyMapper;

	@Override
	public List<QuizVO> selectQuizList() throws Exception {
		// ��ü ���� ��� ��ȯ
		return ReplyMapper.selectQuizList();
	}

	@Override
	public void insertQuiz(QuizVO quizVO) throws Exception {
		// ���� ���� ��ü ����
		ReplyMapper.insertQuiz(quizVO);
	}

	@Override
	public QuizVO selectQuiz(int qnum) throws Exception {
		// ���� ���� ��ü ��ȯ
		return ReplyMapper.selectQuiz(qnum);
	}

	@Override
	public void updateQuiz(QuizVO quizVO) throws Exception {
		// ���� ���� ��ü ����
		ReplyMapper.updateQuiz(quizVO);
	}

	@Override
	public void deleteQuiz(int qnum) throws Exception {
		// ���� ���� ��ü ����
		ReplyMapper.deleteQuiz(qnum);
	}


}
