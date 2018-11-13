package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BookMarkVO;

public interface BookMarkDAO {

	// 전체 문제 목록 반환
	public List<BookMarkVO> selectBookMarkList() throws Exception;

	// 장바구니 문제 삽입
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception;

	// 유저별 장바구니 문제 보기
	public List<BookMarkVO> selectBookMark(String id) throws Exception;

	// 장바구니 문제 객체 삭제
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception;

}
