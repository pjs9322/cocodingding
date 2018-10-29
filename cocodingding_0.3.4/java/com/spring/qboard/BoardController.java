package com.spring.qboard;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.qboard.service.BoardService;
import com.spring.qboard.service.ReplyService;
import com.spring.qboard.vo.BoardVO;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.PageVO;
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
	
	// 게시판 리스트 보기
	@RequestMapping(value = "/boardList.bo/{type}", method = RequestMethod.GET)
	public String boardList(@PathVariable String type,
							@RequestParam(defaultValue="1") int page,
							@RequestParam(defaultValue="true") boolean java,
							@RequestParam(defaultValue="true") boolean web,
							@RequestParam(defaultValue="true") boolean db,
							@RequestParam(defaultValue="0") int opt,
							@RequestParam(defaultValue="") String condition, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 현제 로그인한 아이디
			String id = ((MemberVO) session.getAttribute("userInfo")).getId();
			// 전체 게시물 목록
		    List<BoardVO> boardList = boardService.selectBoardList();
		    // 게시판 종류 게시물 목록
		    List<BoardVO> typeList = new ArrayList<BoardVO>();
		    // 나의 게시판일 경우
			if ("my".equals(type)) {
				for (BoardVO article: boardList) {
					// 접속한 아이디와 같은 아이디일 경우의 게시물만을 리스트 객체에 추가
					if (article.getId().equals(id)) {
						typeList.add(article);
					}
				}
			}
			// 질문 게시판일 경우
			if ("ask".equals(type)) {
				for (BoardVO article: boardList) {
					// 문제 코드가 포함된 게시물만을 리스트 객체에 추가
					if (article.getQnum() != 0) {
						typeList.add(article);
					}
				}
			}
			// 전체 게시판일 경우
			if ("all".equals(type)) {
				// 전체 게시물을 리스트 객체에 추가
				typeList = boardList;
			}
			
			// 분야 필터 설정
		    List<BoardVO> fieldList = new ArrayList<BoardVO>();
			if (java) {
				for (BoardVO article: typeList) {
					// 분야가 자바인 게시글을 추가
					if ("JAVA".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (web) {
				for (BoardVO article: typeList) {
					// 분야가 웹인 게시글을 추가
					if ("WEB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (db) {
				for (BoardVO article: typeList) {
					// 분야가 DB인 게시글을 추가
					if ("DB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			
			// 검색 필터 설정
		    List<BoardVO> list = new ArrayList<BoardVO>();
		    switch(opt) {
			    case 0:
					for (BoardVO article: fieldList) {
						// 검색 결과를 포함하는 글만 추가
						if (article.getTitle().contains(condition)) {
							list.add(article);
						}
					}
			    	break;
			    case 1:
					for (BoardVO article: fieldList) {
						// 검색 결과를 포함하는 글만 추가
						if (article.getId().contains(condition)) {
							list.add(article);
						}
					}
					break;
			    case 2:
					for (BoardVO article: fieldList) {
						// 검색 결과를 포함하는 글만 추가
						if (article.getDocument().contains(condition)) {
							list.add(article);
						}
					}
					break;
		    }

			// 페이지 관리 VO 생성
	        PageVO pageVO = new PageVO(list.size(), page);
	        
	        // 각 게시물마다 가상 번호를 부여
	        for (int i = 0; i < list.size(); i++) {
	        	list.get(i).setCurNumber(list.size() - i);
	        }
		    // 모델 객체로 주입
	        
		    model.addAttribute("java", java);
		    model.addAttribute("web", web);
		    model.addAttribute("db", db);
		    model.addAttribute("type", type);
		    model.addAttribute("opt", opt);
		    model.addAttribute("condition", condition);
		    
		    model.addAttribute("list", list);
	        model.addAttribute("pageVO", pageVO);
	
		    return "/board/list";
		} catch (Exception e) {}
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
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
