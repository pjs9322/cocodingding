package com.spring.qboard.service;

import java.util.List;

import com.spring.qboard.vo.ReplyVO;


public interface ReplyService {
	
	// 댓글 목록 보기
	public List<ReplyVO> selectReplyList(int bnum) throws Exception;

	public void insertReply(ReplyVO replyVO) throws Exception;

	public ReplyVO selectReply(int rnum) throws Exception;

	public void deleteReply(int rnum) throws Exception;
}
