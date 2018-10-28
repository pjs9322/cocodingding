package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.BoardVO;


public interface BoardService {
	
	// ��ü �Խ��� ����Ʈ ����
	public List<BoardVO> selectBoardList() throws Exception;

	// �Խ��� ��ü ����
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	// �Խ��� ��ü ����
	public BoardVO selectBoard(int bnum) throws Exception;
	
	// �Խ��� ��ü ����
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	// �Խ��� ��ü ����
	public void deleteBoard(int bnum) throws Exception;
}
