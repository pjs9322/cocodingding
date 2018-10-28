package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BoardVO;

public interface BoardDAO {
	
	// ��ü �Խ��� ��� ����
	public List<BoardVO> selectBoardList() throws Exception;

	// �Խ��� ��ü ����
	public void insertBoard(BoardVO boardVO);
	
	// �Խ��� ��ü ����
	public BoardVO selectBoard(int bnum);

	// �Խ��� ��ü ����
	public void updateBoard(BoardVO boardVO);

	// �Խ��� ��ü ����
	public void deleteBoard(int bnum);
}
