package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BookMarkVO;

public interface BookMarkDAO {

	// ��ü ���� ��� ��ȯ
	public List<BookMarkVO> selectBookMarkList() throws Exception;

	// ��ٱ��� ���� ����
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception;

	// ������ ��ٱ��� ���� ����
	public List<BookMarkVO> selectBookMark(String id) throws Exception;

	// ��ٱ��� ���� ��ü ����
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception;

}
