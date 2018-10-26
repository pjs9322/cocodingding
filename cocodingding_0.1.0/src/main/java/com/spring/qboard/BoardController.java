package com.spring.qboard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	@RequestMapping(value = "/boardList.bo", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {

	    List<BoardVO> list = boardService.selectBoardList();

	    logger.info(list.toString());

	    model.addAttribute("list", list);

	    return "list";
	}
	
	/**
	 * 게시판 등록폼
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardWriteForm.bo", method = RequestMethod.GET)
	public String boardWriteForm(Model model) throws Exception {

	    return "write";
	}
	
	/**
	 * 글을 등록합니다.
	 * @param boardVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardInsert.bo", method = RequestMethod.POST)
	public String boardInsert(BoardVO boardVO, Model model) {
		
		boardService.insertBoard(boardVO);
		
		return "redirect:/boardList.bo";
	}
	
	/**
	 * 글을 확인합니다.
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardView.bo", method = RequestMethod.GET)
	public String boardView(HttpServletRequest request, Model model) {
		
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		BoardVO article = boardService.selectBoard(bnum);
		
		request.setAttribute("bnum", request.getParameter("bnum"));
		model.addAttribute("article", article);
		
		return "view";
	}
	
	/**
	 * 게시판 수정폼
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardModifyForm.bo", method = RequestMethod.GET)
	public String boardModifyForm(HttpServletRequest request, Model model) {
		
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		BoardVO article = boardService.selectBoard(bnum);
		
		request.setAttribute("bnum", request.getParameter("bnum"));
		model.addAttribute("article", article);
		
		return "modify";
	}
	
	/**
	 * 글을 수정합니다.
	 * @param request
	 * @param boardVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardUpdate.bo", method = RequestMethod.POST)
	public String boardUpdate(HttpServletRequest request, BoardVO boardVO, Model model) {

		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		boardVO.setBnum(bnum);
		boardService.updateBoard(boardVO);
				
		return "redirect:/boardList.bo";
	}
	
	/**
	 * 게시판 삭제폼
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardRemoveForm.bo", method = RequestMethod.GET)
	public String boardRemoveForm(HttpServletRequest request, Model model) {
		
		request.setAttribute("bnum", request.getParameter("bnum"));
		
		return "delete";
	}
	
	/**
	 * 글을 삭제합니다.
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardDelete.bo", method = RequestMethod.POST)
	public String boardDelete(HttpServletRequest request, Model model) {
		
		int bnum = Integer.parseInt(request.getParameter("bnum"));

		boardService.deleteBoard(bnum);
				
		return "redirect:/boardList.bo";
	}
}
