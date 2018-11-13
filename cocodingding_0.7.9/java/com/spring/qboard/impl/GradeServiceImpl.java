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
		// 전체 게시판 목록 반환
		return GradeMapper.selectGradeList();
	}

	@Override
	public void insertGrade(GradeVO gradeVO) throws Exception {
		// 단일 게시판 객체 삽입
		GradeMapper.insertGrade(gradeVO);
	}

	@Override
	public List<GradeVO> selectGrade(String id) throws Exception {
		// 단일 게시판 객체 반환
		return GradeMapper.selectGrade(id);
	}
	
	@Override
	public void updateGrade(GradeVO gradeVO) throws Exception {
		// 단일 게시판 객체 수정
		GradeMapper.updateGrade(gradeVO);
	}
}
