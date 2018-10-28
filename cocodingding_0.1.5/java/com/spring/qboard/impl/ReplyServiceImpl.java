package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.qboard.dao.ReplyDAO;
import com.spring.qboard.service.ReplyService;
import com.spring.qboard.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO ReplyMapper;

	@Override
	@Transactional
	public List<ReplyVO> selectReplyList(int bnum) throws Exception {
		// 댓글 목록 반환
		return ReplyMapper.selectReplyList(bnum);
	}

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		ReplyMapper.insertReply(replyVO);
	}

	@Override
	public void deleteReply(int rnum) throws Exception {
		ReplyMapper.deleteReply(rnum);
	}

}
