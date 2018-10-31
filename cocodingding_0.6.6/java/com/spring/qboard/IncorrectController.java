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

import com.spring.qboard.service.IncorrectService;
import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.IncorrectVO;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IncorrectController {

	@Resource(name = "IncorrectService")
	private IncorrectService incorrectService;
	
	@Resource(name = "QuizService")
	private QuizService quizService;
	

	// Ʋ������ ����Ʈ ����
	@RequestMapping(value = "/incorrectList.ic", method = RequestMethod.GET)
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
		    List<IncorrectVO> incorrectList = incorrectService.selectIncorrectList();

		    // �� ID�� ���� �Ӽ��� �и�
			List<IncorrectVO> myList = new ArrayList<IncorrectVO>();
			for (IncorrectVO article: incorrectList) {
				if (article.getId().equals(userInfo.getId())) {
					myList.add(article);
				}
			}
			
			List<IncorrectVO> Quizlist = new ArrayList<IncorrectVO>();
			for (IncorrectVO article: myList) {
				Quizlist.add(new IncorrectVO(quizService.selectQuiz(article.getQnum())));
				Quizlist.get(myList.indexOf(article)).setId(article.getId());
			}
			
			// �о� ���� ����
		    List<IncorrectVO> fieldList = new ArrayList<IncorrectVO>();
			if (java) {
				for (IncorrectVO article: Quizlist) {
					// �о߰� �ڹ��� �Խñ��� �߰�
					if ("JAVA".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (web) {
				for (IncorrectVO article: Quizlist) {
					// �о߰� ���� �Խñ��� �߰�
					if ("WEB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (db) {
				for (IncorrectVO article: Quizlist) {
					// �о߰� DB�� �Խñ��� �߰�
					if ("DataBase".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			
			// �˻� ���� ����
		    List<IncorrectVO> searchList = new ArrayList<IncorrectVO>();
		    switch(opt) {
		    case 0: // �ܿ�
				for (IncorrectVO article: fieldList) {
					// �˻� ����� �����ϴ� �۸� �߰�
					if (article.getField().contains(condition)) {
						searchList.add(article);
					}
				}
		    	break; 
	    	case 1: // ����
				for (IncorrectVO article: fieldList) {
					// �˻� ����� �����ϴ� �۸� �߰�
					if (String.valueOf(article.getLevels()).equals(condition)) {
						searchList.add(article);
					}
				}
		    	break;
		    case 2: // ����
				for (IncorrectVO article: fieldList) {
					// �˻� ����� �����ϴ� �۸� �߰�
					if (article.getDocument().contains(condition)) {
						searchList.add(article);
					}
				}
				break;
		    }
		    
		    for (IncorrectVO article: searchList) {
		    	
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
	
		    return "/user/userIncorrect";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	
	// Ʋ������ ���� �Ϸ�
	@RequestMapping(value = "/incorrectDelete.ic/{qnum}", method = RequestMethod.GET)
	public String boardDelete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			MemberVO user = (MemberVO) session.getAttribute("userInfo");
			
			IncorrectVO incorrectVO = new IncorrectVO();
			incorrectVO.setId(user.getId());
			incorrectVO.setQnum(qnum);

			incorrectService.deleteIncorrect(incorrectVO);
					
			return "redirect:/incorrectList.ic";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
}
