package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> selectBoardList() throws Exception;
	public void insertBoard(BoardVO boardVO);
}
