package com.spring.qboard;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.QuizVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("testQuiz")
public class QuizController {

	@Resource(name = "QuizService")
	private QuizService quizService;
	
	// ������ �������� ������ �̵�
	@RequestMapping(value = "/admin.qu", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ���� ��� ����
				List<QuizVO> quizList = quizService.selectQuizList();
				// ���� ���� ���
				for (QuizVO quiz: quizList) {
					if (quiz.getDocument().length() > 10) {
						String reduction = quiz.getDocument().substring(0, 10);
						quiz.setDocument(reduction);
					}
				}
				// �� ��ü�� ����
				model.addAttribute("quizList", quizList);
				// ������ �������� �̵�
				return "admin/admin_quiz";
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ���� ���� ���
	@RequestMapping(value = "/admin_make.qu", method = RequestMethod.POST)
	public String admin_make(Model model, QuizVO quizVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				quizService.insertQuiz(quizVO);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "������ �߰��Ǿ����ϴ�.", "/qboard/admin.qu");
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� ���� ���
	@RequestMapping(value = "/admin_modPro.qu", method = RequestMethod.POST)
	public String admin_modPro(Model model, QuizVO quizVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				quizService.updateQuiz(quizVO);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "������ �����Ǿ����ϴ�.", "/qboard/admin.qu");
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� ���� ���
	@RequestMapping(value = "/admin_delete.qu/{qnum}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				quizService.deleteQuiz(qnum);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "������ �����Ǿ����ϴ�.", "/qboard/admin.qu");
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� �غ� �������� �̵�
	@RequestMapping(value = "/testPrep.qu/{field}/{code}", method = RequestMethod.GET)
	public String testPrep(@PathVariable String field, @PathVariable int code, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// �ش��ϴ� �������� �̵���
			String testType;
			
			// �ڵ尡 1�̸� ���� ��, 0�̸� ����Ǯ�� �������� �̵���
			if (code != 0) {
				testType = "lvUp";
			} else {
				testType = "test";
			}
			
		    return "/quiz/" + testType + field;
		}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/diagno.qu/{code}")
	public String diagno(@PathVariable int code, QuizVO quizVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		if (code < 0) { code = 0; }
		
		List<QuizVO> testQuiz;
		
		if (session.getAttribute("testQuiz") != null) {
			testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
		} else {
			testQuiz = new ArrayList<QuizVO>();
		}
		
		for (QuizVO test: testQuiz) {
			if (test.getQnum() == quizVO.getQnum()) {
				test.setResult(quizVO.getResult());
			}
		}
		
		if (code < testQuiz.size()) {
			model.addAttribute("code", code);
		} else {
			List<QuizVO> quizList = quizService.selectQuizList();
			int qnum = (int) (Math.random() * quizList.size());
			QuizVO newQuiz = quizList.get(qnum);
			
			newQuiz.setResult("");
			testQuiz.add(newQuiz);

			model.addAttribute("code", code);
			model.addAttribute("testQuiz", testQuiz);
		}
		request.setAttribute("result", testQuiz.get(code).getResult());

	    return "/quiz/solveQuiz";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/study.qu/{code}")
	public String study(@PathVariable int code, QuizVO quizVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		if (code < 0) { code = 0; }
		
		List<QuizVO> testQuiz;
		
		if (session.getAttribute("testQuiz") != null) {
			testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
		} else {
			testQuiz = new ArrayList<QuizVO>();
		}
		
		for (QuizVO test: testQuiz) {
			if (test.getQnum() == quizVO.getQnum()) {
				test.setResult(quizVO.getResult());
			}
		}
		
		if (code < testQuiz.size()) {
			model.addAttribute("code", code);
		} else {
			List<QuizVO> quizList = quizService.selectQuizList();
			int qnum = (int) (Math.random() * quizList.size());
			QuizVO newQuiz = quizList.get(qnum);
			
			newQuiz.setResult("");
			testQuiz.add(newQuiz);

			model.addAttribute("code", code);
			model.addAttribute("testQuiz", testQuiz);
		}
		request.setAttribute("result", testQuiz.get(code).getResult());

	    return "/quiz/solveQuiz";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/levelUp.qu/{code}")
	public String levelUp(@PathVariable int code, QuizVO quizVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		if (code < 0) { code = 0; }
		
		List<QuizVO> testQuiz;
		
		if (session.getAttribute("testQuiz") != null) {
			testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
		} else {
			testQuiz = new ArrayList<QuizVO>();
		}
		
		for (QuizVO test: testQuiz) {
			if (test.getQnum() == quizVO.getQnum()) {
				test.setResult(quizVO.getResult());
			}
		}
		
		if (code < testQuiz.size()) {
			model.addAttribute("code", code);
		} else {
			List<QuizVO> quizList = quizService.selectQuizList();
			int qnum = (int) (Math.random() * quizList.size());
			QuizVO newQuiz = quizList.get(qnum);
			
			newQuiz.setResult("");
			testQuiz.add(newQuiz);

			model.addAttribute("code", code);
			model.addAttribute("testQuiz", testQuiz);
		}
		request.setAttribute("result", testQuiz.get(code).getResult());

	    return "/quiz/solveQuiz";
	}
	
	@RequestMapping(value = "/complete.qu")
	public String complete(Model model, HttpSession session) throws Exception {
		
		@SuppressWarnings("unchecked")
		List<QuizVO> testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
		testQuiz.clear();
		
		session.removeAttribute("testQuiz");

	    return "/user/evaluation";
	}
}