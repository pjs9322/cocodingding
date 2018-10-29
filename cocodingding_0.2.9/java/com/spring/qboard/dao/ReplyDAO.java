package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.ReplyVO;

public interface ReplyDAO {
	
	// 댓글 목록 보기
	public List<ReplyVO> selectReplyList(int rnum);

	public void insertReply(ReplyVO replyVO);

	public void deleteReply(int rnum);
}
