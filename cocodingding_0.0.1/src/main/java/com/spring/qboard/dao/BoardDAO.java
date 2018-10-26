package com.spring.qboard.dao;

import java.util.List;

import com.spring.qboard.vo.BoardVO;

public interface BoardDAO {
     List<BoardVO> selectBoardList() throws Exception;
}