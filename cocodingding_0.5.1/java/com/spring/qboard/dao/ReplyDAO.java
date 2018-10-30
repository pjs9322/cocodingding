package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.ReplyVO;

public interface ReplyDAO {
	
	// ��� ��� ����
	public List<ReplyVO> selectReplyList(int rnum) throws Exception;

	public void insertReply(ReplyVO replyVO) throws Exception;

	public ReplyVO selectReply(int rnum) throws Exception;

	public void deleteReply(int rnum) throws Exception;
}
