package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.IncorrectVO;


public interface IncorrectService {
	
	// 전체 장바구니 목록 보기
	public List<IncorrectVO> selectIncorrectList() throws Exception;

	// 유저 장바구니 추가
	public void insertIncorrect(IncorrectVO incorrectVO) throws Exception;
	
	// 유저별 장바구니 보기
	public IncorrectVO selectIncorrect(int qnum) throws Exception;
	
	// 유저 장바구니 삭제
	public void deleteIncorrect(IncorrectVO incorrectVO) throws Exception;
	
}
