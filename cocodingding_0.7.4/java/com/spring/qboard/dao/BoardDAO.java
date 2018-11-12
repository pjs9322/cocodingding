package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BoardVO;

public interface BoardDAO {
	
	// ��ü �Խ��� ��� ����
	public List<BoardVO> selectBoardList() throws Exception;

	// �Խ��� ��ü ����
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	// �Խ��� ��ü ����
	public BoardVO selectBoard(int bnum) throws Exception;

	// �Խ��� ��ü ����
	public void updateBoard(BoardVO boardVO) throws Exception;

	// �Խ��� ��ü ����
	public void deleteBoard(int bnum) throws Exception;

	// ��ȸ�� ����
	public void viewsRise(int bnum) throws Exception;
}