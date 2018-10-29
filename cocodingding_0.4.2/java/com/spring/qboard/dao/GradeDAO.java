package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.GradeVO;

public interface GradeDAO {

	// 전체 점수 목록 반환
	public List<GradeVO> selectGradeList() throws Exception;

	// 단일 점수 객체 삽입
	public void insertGrade(GradeVO gradeVO) throws Exception;

	// 단일 점수 객체 반환
	public List<GradeVO> selectGrade(String id) throws Exception;

	// 단일 점수 객체 수정
	public void updateGrade(GradeVO gradeVO) throws Exception;

}
