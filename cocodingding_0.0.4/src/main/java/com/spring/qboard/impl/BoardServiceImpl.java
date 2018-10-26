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
		// ��ü �Խ��� ��� ��ȯ
		return boardMapper.selectBoardList();
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		// ���� �Խ��� ��ü ����
		boardMapper.insertBoard(boardVO);
	}

	@Override
	public BoardVO selectBoard(int bnum) {
		// ���� �Խ��� ��ü ��ȯ
		return boardMapper.selectBoard(bnum);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		// ���� �Խ��� ��ü ����
		boardMapper.updateBoard(boardVO);
	}

	@Override
	public void deleteBoard(int bnum) {
		// ���� �Խ��� ��ü ����
		boardMapper.deleteBoard(bnum);
	}
}
