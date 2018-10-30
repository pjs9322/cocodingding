package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.qboard.dao.GradeDAO;
import com.spring.qboard.service.GradeService;
import com.spring.qboard.vo.GradeVO;

@Service("GradeService")
public class GradeServiceImpl implements GradeService {
	@Autowired
	private GradeDAO GradeMapper;

	@Override
	@Transactional
	public List<GradeVO> selectGradeList() throws Exception {
		// ��ü �Խ��� ��� ��ȯ
		return GradeMapper.selectGradeList();
	}

	@Override
	public void insertGrade(GradeVO gradeVO) throws Exception {
		// ���� �Խ��� ��ü ����
		GradeMapper.insertGrade(gradeVO);
	}

	@Override
	public List<GradeVO> selectGrade(String id) throws Exception {
		// ���� �Խ��� ��ü ��ȯ
		return GradeMapper.selectGrade(id);
	}
	
	@Override
	public void updateGrade(GradeVO gradeVO) throws Exception {
		// ���� �Խ��� ��ü ����
		GradeMapper.updateGrade(gradeVO);
	}
}
