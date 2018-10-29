package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.GradeVO;

public interface GradeDAO {

	// ��ü ���� ��� ��ȯ
	public List<GradeVO> selectGradeList() throws Exception;

	// ���� ���� ��ü ����
	public void insertGrade(GradeVO gradeVO) throws Exception;

	// ���� ���� ��ü ��ȯ
	public GradeVO selectGrade(String id, String field, String levels) throws Exception;

	// ���� ���� ��ü ����
	public void updateGrade(GradeVO gradeVO) throws Exception;

}
