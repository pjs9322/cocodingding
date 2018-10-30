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
		// ��ٱ��� ���� ��� ��ȯ
		return BookMarkMapper.selectBookMarkList();
	}
	
	@Override
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception {
		// ��ٱ��� ���� ����
		BookMarkMapper.insertBookMark(bookMarkVO);
	}

	@Override
	public BookMarkVO selectBookMark(int qnum) throws Exception {
		// ��ٱ��� ���� ã��
		return BookMarkMapper.selectBookMark(qnum);
	}

	@Override
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception {
		// ��ٱ��� ���� ����
		BookMarkMapper.deleteBookMark(bookMarkVO);
	}

}
