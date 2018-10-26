package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.BoardVO;


public interface BoardService {
	
	// 전체 게시판 리스트 보기
	public List<BoardVO> selectBoardList() throws Exception;

	// 게시판 객체 삽입
	public void insertBoard(BoardVO boardVO);
	
	// 게시판 객체 보기
	public BoardVO selectBoard(int bnum);
	
	// 게시판 객체 수정
	public void updateBoard(BoardVO boardVO);
	
	// 게시판 객체 삭제
	public void deleteBoard(int bnum);
}
