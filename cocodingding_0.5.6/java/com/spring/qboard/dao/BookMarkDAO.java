package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BookMarkVO;

public interface BookMarkDAO {

	// ��ü ���� ��� ��ȯ
	public List<BookMarkVO> selectBookMarkList() throws Exception;

	// ��ٱ��� ���� ����
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception;

	// ��ٱ��� ���� ����
	public BookMarkVO selectBookMark(int qnum) throws Exception;

	// ��ٱ��� ���� ��ü ����
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception;

}
