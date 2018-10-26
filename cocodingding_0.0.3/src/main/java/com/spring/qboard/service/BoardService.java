package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.BoardVO;


public interface BoardService {
	public List<BoardVO> selectBoardList() throws Exception;
	public void insertBoard(BoardVO boardVO);
}
