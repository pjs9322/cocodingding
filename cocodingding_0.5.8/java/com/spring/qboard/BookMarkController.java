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

import com.spring.qboard.service.BookMarkService;
import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.BookMarkVO;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("bookMarkList")
public class BookMarkController {

	@Resource(name = "BookMarkService")
	private BookMarkService bookMarkService;
	
	@Resource(name = "QuizService")
	private QuizService quizService;
	

	// ��ٱ��� ����Ʈ ����
	@RequestMapping(value = "/bookMarkList.bm", method = RequestMethod.GET)
	public String boardList(@RequestParam(defaultValue="1") int page,
							@RequestParam(defaultValue="true") boolean java,
							@RequestParam(defaultValue="true") boolean web,
							@RequestParam(defaultValue="true") boolean db,
							@RequestParam(defaultValue="0") int opt,
							@RequestParam(defaultValue="") String condition, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
			// ��ü ��ٱ��� ��� (id�� qnum�� ����)
		    List<BookMarkVO> bookMarkList = bookMarkService.selectBookMarkList();

		    // �� ID�� ���� �Ӽ��� �и�
			List<BookMarkVO> myList = new ArrayList<BookMarkVO>();
			for (BookMarkVO article: bookMarkList) {
				if (article.getId().equals(userInfo.getId())) {
					myList.add(article);
				}
			}

			// ��ٱ��� ��Ͽ� ���� ���� �߰�
			List<BookMarkVO> Quizlist = new ArrayList<BookMarkVO>();
			for (BookMarkVO article: myList) {
				Quizlist.add(new BookMarkVO(quizService.selectQuiz(article.getQnum())));
				Quizlist.get(myList.indexOf(article)).setId(article.getId());
			}
			
			// �о� ���� ����
		    List<BookMarkVO> fieldList = new ArrayList<BookMarkVO>();
			if (java) {
				for (BookMarkVO article: Quizlist) {
					// �о߰� �ڹ��� �Խñ��� �߰�
					if ("JAVA".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (web) {
				for (BookMarkVO article: Quizlist) {
					// �о߰� ���� �Խñ��� �߰�
					if ("WEB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (db) {
				for (BookMarkVO article: Quizlist) {
					// �о߰� DB�� �Խñ��� �߰�
					if ("DataBase".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			
			// �˻� ���� ����
		    List<BookMarkVO> searchList = new ArrayList<BookMarkVO>();
		    switch(opt) {
		    case 0: // �ܿ�
				for (BookMarkVO article: fieldList) {
					// �˻� ����� �����ϴ� �۸� �߰�
					if (article.getField().contains(condition)) {
						searchList.add(article);
					}
				}
		    	break; 
	    	case 1: // ����
				for (BookMarkVO article: fieldList) {
					// �˻� ����� �����ϴ� �۸� �߰�
					if (String.valueOf(article.getLevels()).equals(condition)) {
						searchList.add(article);
					}
				}
		    	break;
		    case 2: // ����
				for (BookMarkVO article: fieldList) {
					// �˻� ����� �����ϴ� �۸� �߰�
					if (article.getDocument().contains(condition)) {
						searchList.add(article);
					}
				}
				break;
		    }
		    
		    for (BookMarkVO article: searchList) {
		    	
				String abbrev = article.getDocument();
				if (article.getDocument().length() > 30) {
					abbrev = article.getDocument().substring(0, 30);
				}
				article.setAbbrev(abbrev);
			}

			// ������ ���� VO ����
	        PageVO pageVO = new PageVO(searchList.size(), page);
	        
	        // �� �Խù����� ���� ��ȣ�� �ο�
	        for (int i = 0; i < searchList.size(); i++) {
	        	searchList.get(i).setCurNumber(searchList.size() - i);
	        }
		    // �� ��ü�� ����

		    model.addAttribute("java", java);
		    model.addAttribute("web", web);
		    model.addAttribute("db", db);
		    model.addAttribute("opt", opt);
		    model.addAttribute("condition", condition);
		    
		    model.addAttribute("list", searchList);
	        model.addAttribute("pageVO", pageVO);
	
		    return "/user/userBookMark";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	

	// ��ٱ��� �߰�
	@RequestMapping(value = "/bookMarkInsert.bm/{type}/{field}/{levels}/{code}/{qnum}")
	public String boardInsert(@PathVariable int type, @PathVariable String field, @PathVariable int levels, @PathVariable int code, @PathVariable int qnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			String id = ((MemberVO) session.getAttribute("userInfo")).getId();
			
			BookMarkVO bookMarkVO = new BookMarkVO();
			bookMarkVO.setId(id);
			bookMarkVO.setQnum(qnum);
			
			bookMarkService.deleteBookMark(bookMarkVO);
			bookMarkService.insertBookMark(bookMarkVO);

			switch(type) {
				case 1:	return HomeController.alert(model, "��ٱ��Ͽ� �߰��Ǿ����ϴ�.", "/qboard/diagno.qu/" + field + "/" + code);
				case 2:	return HomeController.alert(model, "��ٱ��Ͽ� �߰��Ǿ����ϴ�.", "/qboard/study.qu/" + field + "/" + levels + "/" + code);
				case 3:	return HomeController.alert(model, "��ٱ��Ͽ� �߰��Ǿ����ϴ�.", "/qboard/levelUp.qu/" + field + "/" + code);
			}

		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ��ٱ��� ���� ���� �Ϸ�
	@RequestMapping(value = "/bookMarkDelete.bm/{qnum}", method = RequestMethod.GET)
	public String boardDelete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			MemberVO user = (MemberVO) session.getAttribute("userInfo");
			
			BookMarkVO bookMarkVO = new BookMarkVO();
			bookMarkVO.setId(user.getId());
			bookMarkVO.setQnum(qnum);

			bookMarkService.deleteBookMark(bookMarkVO);
					
			return "redirect:/bookMarkList.bm";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
}
