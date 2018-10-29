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
	
	// �Խ��� ����Ʈ ����
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
			// ���� �α����� ���̵�
			String id = ((MemberVO) session.getAttribute("userInfo")).getId();
			// ��ü �Խù� ���
		    List<BoardVO> boardList = boardService.selectBoardList();
		    // �Խ��� ���� �Խù� ���
		    List<BoardVO> typeList = new ArrayList<BoardVO>();
		    // ���� �Խ����� ���
			if ("my".equals(type)) {
				for (BoardVO article: boardList) {
					// ������ ���̵�� ���� ���̵��� ����� �Խù����� ����Ʈ ��ü�� �߰�
					if (article.getId().equals(id)) {
						typeList.add(article);
					}
				}
			}
			// ���� �Խ����� ���
			if ("ask".equals(type)) {
				for (BoardVO article: boardList) {
					// ���� �ڵ尡 ���Ե� �Խù����� ����Ʈ ��ü�� �߰�
					if (article.getQnum() != 0) {
						typeList.add(article);
					}
				}
			}
			// ��ü �Խ����� ���
			if ("all".equals(type)) {
				// ��ü �Խù��� ����Ʈ ��ü�� �߰�
				typeList = boardList;
			}
			
			// �о� ���� ����
		    List<BoardVO> fieldList = new ArrayList<BoardVO>();
			if (java) {
				for (BoardVO article: typeList) {
					// �о߰� �ڹ��� �Խñ��� �߰�
					if ("JAVA".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (web) {
				for (BoardVO article: typeList) {
					// �о߰� ���� �Խñ��� �߰�
					if ("WEB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (db) {
				for (BoardVO article: typeList) {
					// �о߰� DB�� �Խñ��� �߰�
					if ("DB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			
			// �˻� ���� ����
		    List<BoardVO> list = new ArrayList<BoardVO>();
		    switch(opt) {
			    case 0:
					for (BoardVO article: fieldList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getTitle().contains(condition)) {
							list.add(article);
						}
					}
			    	break;
			    case 1:
					for (BoardVO article: fieldList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getId().contains(condition)) {
							list.add(article);
						}
					}
					break;
			    case 2:
					for (BoardVO article: fieldList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getDocument().contains(condition)) {
							list.add(article);
						}
					}
					break;
		    }

			// ������ ���� VO ����
	        PageVO pageVO = new PageVO(list.size(), page);
	        
	        // �� �Խù����� ���� ��ȣ�� �ο�
	        for (int i = 0; i < list.size(); i++) {
	        	list.get(i).setCurNumber(list.size() - i);
	        }
		    // �� ��ü�� ����
	        
		    model.addAttribute("java", java);
		    model.addAttribute("web", web);
		    model.addAttribute("db", db);
		    model.addAttribute("type", type);
		    model.addAttribute("list", list);
	        model.addAttribute("pageVO", pageVO);
	
		    return "/board/list";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	/**
	 * �Խ��� �����
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardWriteForm.bo", method = RequestMethod.GET)
	public String boardWriteForm(Model model) throws Exception {

	    return "board/write";
	}
	
	/**
	 * ���� ����մϴ�.
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
	 * ���� Ȯ���մϴ�.
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
	 * ����� ����մϴ�.
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
	 * ����� �����մϴ�.
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
	 * �Խ��� ������
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
	 * ���� �����մϴ�.
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
	 * �Խ��� ������
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardRemoveForm.bo/{bnum}", method = RequestMethod.GET)
	public String boardRemoveForm(@PathVariable int bnum, Model model) {
		
		model.addAttribute("bnum", bnum);
		
		return "board/delete";
	}
	
	/**
	 * ���� �����մϴ�.
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
