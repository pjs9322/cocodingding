package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.qboard.dao.BookMarkDAO;
import com.spring.qboard.service.BookMarkService;
import com.spring.qboard.vo.BookMarkVO;

@Service("BookMarkService")
public class BookMarkServiceImpl implements BookMarkService {
	@Autowired
	private BookMarkDAO BookMarkMapper;

	@Override
	public List<BookMarkVO> selectBookMarkList() throws Exception {
		// 장바구니 문제 목록 반환
		return BookMarkMapper.selectBookMarkList();
	}
	
	@Override
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception {
		// 장바구니 문제 삽입
		BookMarkMapper.insertBookMark(bookMarkVO);
	}

	@Override
	public BookMarkVO selectBookMark(int qnum) throws Exception {
		// 장바구니 문제 찾기
		return BookMarkMapper.selectBookMark(qnum);
	}

	@Override
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception {
		// 장바구기 문제 삭제
		BookMarkMapper.deleteBookMark(bookMarkVO);
	}

}
