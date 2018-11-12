package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.GradeVO;


public interface GradeService {

	// ��ü ���� ��� ��ȯ
	public List<GradeVO> selectGradeList() throws Exception;

	// ���� ���� ��ü ����
	public void insertGrade(GradeVO gradeVO) throws Exception;

	// ���� ���� ��ü ��ȯ
	public List<GradeVO> selectGrade(String id) throws Exception;

	// ���� ���� ��ü ����
	public void updateGrade(GradeVO gradeVO) throws Exception;
}