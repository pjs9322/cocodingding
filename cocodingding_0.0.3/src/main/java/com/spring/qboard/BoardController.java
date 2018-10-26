package com.spring.qboard;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.qboard.service.BoardService;
import com.spring.qboard.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	/**
	 *  게시판 목록
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {

	    List<BoardVO> list = boardService.selectBoardList();

	    logger.info(list.toString());

	    model.addAttribute("list", list);

	    return "list";
	}
	
	/**
	 * 게시판 등록폼
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardRegisterForm.do", method = RequestMethod.GET)
	public String boardRegisterForm(BoardVO boardVO, Model model) throws Exception {

	    return "write";
	}
	
	/**
	 * 글을 등록합니다.
	 * @return
	 */
	@RequestMapping(value = "/boardInsert.do", method = RequestMethod.POST)
	public String boardInsert(BoardVO boardVO, Model model) {
		
		boardService.insertBoard(boardVO);
		
		return "redirect:/boardList.do";
	}
}
