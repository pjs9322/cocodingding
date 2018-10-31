package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.BookMarkVO;


public interface BookMarkService {
	
	// ��ü ��ٱ��� ��� ����
	public List<BookMarkVO> selectBookMarkList() throws Exception;

	// ���� ��ٱ��� �߰�
	public void insertBookMark(BookMarkVO bookMarkVO) throws Exception;
	
	// ������ ��ٱ��� ����
	public List<BookMarkVO> selectBookMark(String id) throws Exception;
	
	// ���� ��ٱ��� ����
	public void deleteBookMark(BookMarkVO bookMarkVO) throws Exception;
	
}
