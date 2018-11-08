package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.IncorrectVO;

public interface IncorrectDAO {

	// 전체 문제 목록 반환
	public List<IncorrectVO> selectIncorrectList() throws Exception;

	// 틀린문제 삽입
	public void insertIncorrect(IncorrectVO incorrectVO) throws Exception;

	// 틀린문제 문제 보기
	public List<IncorrectVO> selectIncorrect(String id) throws Exception;

	// 틀린문제 문제 객체 삭제
	public void deleteIncorrect(IncorrectVO incorrectVO) throws Exception;

}
