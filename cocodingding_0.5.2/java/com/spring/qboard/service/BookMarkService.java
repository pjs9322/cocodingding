package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.BookMarkVO;


public interface BookMarkService {
	
	// 전체 장바구니 목록 보기
	public List<BookMarkVO> selectBookMarkList() throws Exception;

	// 유저 장바구니 추가
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception;
	
	// 유저별 장바구니 보기
	public BookMarkVO selectBookMark(int qnum) throws Exception;
	
	// 유저 장바구니 삭제
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception;
	
}
