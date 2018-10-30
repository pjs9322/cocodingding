package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.BookMarkVO;


public interface BookMarkService {
	
	// ��ü ��ٱ��� ��� ����
	public List<BookMarkVO> selectBookMarkList() throws Exception;

	// ���� ��ٱ��� �߰�
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception;
	
	// ������ ��ٱ��� ����
	public BookMarkVO selectBookMark(int qnum) throws Exception;
	
	// ���� ��ٱ��� ����
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception;
	
}
