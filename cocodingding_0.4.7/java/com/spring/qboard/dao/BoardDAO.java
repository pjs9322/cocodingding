package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BoardVO;

public interface BoardDAO {
	
	// 전체 게시판 목록 보기
	public List<BoardVO> selectBoardList() throws Exception;

	// 게시판 객체 삽입
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	// 게시판 객체 보기
	public BoardVO selectBoard(int bnum) throws Exception;

	// 게시판 객체 수정
	public void updateBoard(BoardVO boardVO) throws Exception;

	// 게시판 객체 삭제
	public void deleteBoard(int bnum) throws Exception;

	// 조회수 증가
	public void viewsRise(int bnum) throws Exception;
}
