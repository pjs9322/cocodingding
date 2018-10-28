package com.spring.qboard;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.qboard.service.BoardService;
import com.spring.qboard.service.ReplyService;
import com.spring.qboard.vo.BoardVO;
import com.spring.qboard.vo.ReplyVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;

	@Resource(name = "replyService")
	private ReplyService replyService;
	
	/**
	 *  게시판 목록
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardList.bo", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {

	    List<BoardVO> list = boardService.selectBoardList();

	    model.addAttribute("list", list);

	    return "/board/list";
	}
	
	/**
	 * 게시판 등록폼
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardWriteForm.bo", method = RequestMethod.GET)
	public String boardWriteForm(Model model) throws Exception {

	    return "board/write";
	}
	
	/**
	 * 글을 등록합니다.
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/boardInsert.bo", method = RequestMethod.POST)
	public String boardInsert(BoardVO boardVO, Model model) throws Exception {
		
		boardService.insertBoard(boardVO);
		
		return "redirect:/boardList.bo";
	}
	
	/**
	 * 글을 확인합니다.
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/boardView.bo/{bnum}", method = RequestMethod.GET)
	public String boardView(@PathVariable int bnum, Model model) throws Exception {

		BoardVO article = boardService.selectBoard(bnum);
		List<ReplyVO> replylist = replyService.selectReplyList(bnum);
		
		model.addAttribute("bnum", bnum);
		model.addAttribute("article", article);
		model.addAttribute("replylist", replylist);
		
		return "board/view";
	}
	
	/**
	 * 댓글을 등록합니다.
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/replyInsert.bo/{bnum}", method = RequestMethod.POST)
	public String replyInsert(@PathVariable int bnum, ReplyVO replyVO, Model model) throws Exception {
				
		replyService.insertReply(replyVO);
		
		return "redirect:/boardView.bo/" + bnum;
	}
	
	/**
	 * 댓글을 삭제합니다.
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/replyDelete.bo/{bnum}/{rnum}", method = RequestMethod.GET)
	public String replyDelete(@PathVariable int bnum, @PathVariable int rnum, Model model) throws Exception {
		
		replyService.deleteReply(rnum);
		
		return "redirect:/boardView.bo/" + bnum;
	}
	
	/**
	 * 게시판 수정폼
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/boardModifyForm.bo/{bnum}", method = RequestMethod.GET)
	public String boardModifyForm(@PathVariable int bnum, Model model) throws Exception {
		
		BoardVO article = boardService.selectBoard(bnum);
		
		model.addAttribute("bnum", bnum);
		model.addAttribute("article", article);
		
		return "board/modify";
	}
	
	/**
	 * 글을 수정합니다.
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/boardUpdate.bo/{bnum}", method = RequestMethod.POST)
	public String boardUpdate(@PathVariable int bnum, BoardVO boardVO, Model model) throws Exception {
		
		boardVO.setBnum(bnum);
		boardService.updateBoard(boardVO);
				
		return "redirect:/boardView.bo/" + bnum;
	}
	
	/**
	 * 게시판 삭제폼
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardRemoveForm.bo/{bnum}", method = RequestMethod.GET)
	public String boardRemoveForm(@PathVariable int bnum, Model model) {
		
		model.addAttribute("bnum", bnum);
		
		return "board/delete";
	}
	
	/**
	 * 글을 삭제합니다.
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/boardDelete.bo/{bnum}", method = RequestMethod.POST)
	public String boardDelete(@PathVariable int bnum, Model model) throws Exception {

		boardService.deleteBoard(bnum);
				
		return "redirect:/boardList.bo";
	}
}
