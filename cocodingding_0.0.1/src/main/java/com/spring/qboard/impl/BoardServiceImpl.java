package com.spring.qboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.qboard.dao.BoardDAO;
import com.spring.qboard.service.BoardService;
import com.spring.qboard.vo.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

     @Autowired
     private BoardDAO boardMapper;

     @Override
     @Transactional
     public List<BoardVO> selectBoardList() throws Exception {
         return boardMapper.selectBoardList();
     }

}