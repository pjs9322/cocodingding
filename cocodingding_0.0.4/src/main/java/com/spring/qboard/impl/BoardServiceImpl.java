package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.qboard.dao.BoardDAO;
import com.spring.qboard.service.BoardService;
import com.spring.qboard.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardMapper;

	@Override
	@Transactional
	public List<BoardVO> selectBoardList() throws Exception {
		// 전체 게시판 목록 반환
		return boardMapper.selectBoardList();
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		// 단일 게시판 객체 삽입
		boardMapper.insertBoard(boardVO);
	}

	@Override
	public BoardVO selectBoard(int bnum) {
		// 단일 게시판 객체 반환
		return boardMapper.selectBoard(bnum);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		// 단일 게시판 객체 수정
		boardMapper.updateBoard(boardVO);
	}

	@Override
	public void deleteBoard(int bnum) {
		// 단일 게시판 객체 삭제
		boardMapper.deleteBoard(bnum);
	}
}
