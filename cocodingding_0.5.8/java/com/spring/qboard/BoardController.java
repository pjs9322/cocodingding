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
import org.springframework.web.bind.annotation.SessionAttributes;

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
@SessionAttributes("type")
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
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� �α����� �г���
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
					if ("DataBase".equals(article.getField())) {
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
						if (article.getNickname().contains(condition)) {
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

		    model.addAttribute("type", type);
		    model.addAttribute("java", java);
		    model.addAttribute("web", web);
		    model.addAttribute("db", db);
		    model.addAttribute("opt", opt);
		    model.addAttribute("condition", condition);
		    
		    model.addAttribute("list", list);
	        model.addAttribute("pageVO", pageVO);
	
		    return "/board/list";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �Խù� ��� ������ �̵�
	@RequestMapping(value = "/boardWriteForm.bo", method = RequestMethod.GET)
	public String boardWriteForm(Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
		
			return "board/write";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �Խñ� ��� �Ϸ�
	@RequestMapping(value = "/boardInsert.bo", method = RequestMethod.POST)
	public String boardInsert(BoardVO boardVO, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
		    
			boardService.insertBoard(boardVO);
			
			return "redirect:/boardList.bo/" + session.getAttribute("type");
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �Խñ� Ȯ��
	@RequestMapping(value = "/boardView.bo/{bnum}", method = RequestMethod.GET)
	public String boardView(@PathVariable int bnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			boardService.viewsRise(bnum);
			BoardVO article = boardService.selectBoard(bnum);
			List<ReplyVO> replylist = replyService.selectReplyList(bnum);
			
			model.addAttribute("bnum", bnum);
			model.addAttribute("article", article);
			model.addAttribute("replylist", replylist);
			
			return "board/view";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ��� ���
	@RequestMapping(value = "/replyInsert.bo/{bnum}", method = RequestMethod.POST)
	public String replyInsert(@PathVariable int bnum, ReplyVO replyVO, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			replyService.insertReply(replyVO);
			
			return "redirect:/boardView.bo/" + bnum;
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ��� ����
	@RequestMapping(value = "/replyDelete.bo/{bnum}/{rnum}", method = RequestMethod.GET)
	public String replyDelete(@PathVariable int bnum, @PathVariable int rnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			MemberVO user = (MemberVO) session.getAttribute("userInfo");
			ReplyVO reply = replyService.selectReply(rnum);

			if (!user.getId().equals(reply.getId()) && user.getAdmin() == 0) {
				return HomeController.alert(model, "������ �����ϴ�.", "/qboard/boardView.bo/" + bnum);
			}
			
			replyService.deleteReply(rnum);
			
			return "redirect:/boardView.bo/" + bnum;
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �Խñ� ���� ������ �̵�
	@RequestMapping(value = "/boardModifyForm.bo/{bnum}", method = RequestMethod.GET)
	public String boardModifyForm(@PathVariable int bnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));

			MemberVO user = (MemberVO) session.getAttribute("userInfo");
			BoardVO article = boardService.selectBoard(bnum);
			
			if (!user.getId().equals(article.getId()) && user.getAdmin() == 0) {
				return HomeController.alert(model, "������ �����ϴ�.", "/qboard/boardView.bo/" + bnum);
			}
			
			model.addAttribute("bnum", bnum);
			model.addAttribute("article", article);
			
			return "board/modify";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �Խñ� ���� �Ϸ�
	@RequestMapping(value = "/boardUpdate.bo/{bnum}", method = RequestMethod.POST)
	public String boardUpdate(@PathVariable int bnum, BoardVO boardVO, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			//boardVO.setBnum(bnum);
			boardService.updateBoard(boardVO);
					
			return "redirect:/boardView.bo/" + bnum;
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �Խñ� ���� �Ϸ�
	@RequestMapping(value = "/boardDelete.bo/{bnum}", method = RequestMethod.GET)
	public String boardDelete(@PathVariable int bnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));

			MemberVO user = (MemberVO) session.getAttribute("userInfo");
			BoardVO article = boardService.selectBoard(bnum);
			
			if (!user.getId().equals(article.getId()) && user.getAdmin() == 0) {
				return HomeController.alert(model, "������ �����ϴ�.", "/qboard/boardView.bo/" + bnum);
			}

			boardService.deleteBoard(bnum);
					
			return "redirect:/boardList.bo/" + session.getAttribute("type");
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
}
