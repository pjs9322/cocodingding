package com.spring.qboard;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ���� ��� ����
				List<QuizVO> quizList = quizService.selectQuizList();
				// ���� ���� ���
				for (QuizVO quiz: quizList) {
					String abbrev = quiz.getDocument();
					if (quiz.getDocument().length() > 10) {
						abbrev = quiz.getDocument().substring(0, 10);
					}
					quiz.setAbbrev(abbrev);
				}
				// �� ��ü�� ����
				model.addAttribute("quizList", quizList);
				// ������ �������� �̵�
				return "admin/admin_quiz";
			}
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ���� ���� ���
	@RequestMapping(value = "/admin_make.qu", method = RequestMethod.POST)
	public String admin_make(Model model, QuizVO quizVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����
				quizService.insertQuiz(quizVO);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "������ �߰��Ǿ����ϴ�.", "/qboard/admin.qu");
			}
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� ���� ���
	@RequestMapping(value = "/admin_modPro.qu", method = RequestMethod.POST)
	public String admin_modPro(Model model, QuizVO quizVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				quizService.updateQuiz(quizVO);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "������ �����Ǿ����ϴ�.", "/qboard/admin.qu");
			}
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� ���� ���
	@RequestMapping(value = "/admin_delete.qu/{qnum}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				quizService.deleteQuiz(qnum);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "������ �����Ǿ����ϴ�.", "/qboard/admin.qu");
			}
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// �Ƿ����� �������� �̵�
	@RequestMapping(value = "/diagn.qu", method = RequestMethod.GET)
	public String diagn(Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// �Ƿ� ���� �������� �̵�
		    return "/quiz/diagn";
		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� �غ� �������� �̵�
	@RequestMapping(value = "/testPrep.qu/{field}/{code}", method = RequestMethod.GET)
	public String testPrep(@PathVariable String field, @PathVariable int code, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// �ش��ϴ� �������� �̵���
			String testType;
			
			// �ڵ尡 1�̸� ���� ��, 0�̸� ����Ǯ�� �������� �̵���
			if (code != 0) {
				testType = "lvUp";
			} else {
				testType = "test";
			}
			
		    return "/quiz/" + testType + field;
		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// �Ƿ� ���� ������
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/diagno.qu/{field}/{code}")
	public String diagno(@PathVariable String field, @PathVariable int code, QuizVO quizVO, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// �Ƿ� ���� ������ 10���� ����
			if (code < 0) { code = 0; }
			if (code > 9) { code = 9; }
			// ���� �� ��� ��� ����Ʈ
			List<QuizVO> testQuiz;
			// ���� ����Ʈ�� �������� ���� ��� ���� ������
			if (session.getAttribute("testQuiz") != null) {
				testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
			} else {
				testQuiz = new ArrayList<QuizVO>();
			}
			// ���ο� ���� ��ȣ�� �̵����� ��� ������ ���� �߰�
			if (code >= testQuiz.size()) {
				
				List<QuizVO> quizList = quizService.selectQuizList();
				List<QuizVO> fieldList = new ArrayList<QuizVO>();
	
				for (QuizVO quiz: quizList) {
					if (quiz.getField().equals(field)) {
						fieldList.add(quiz);
					}
				}
				
				int qnum = (int) (Math.random() * fieldList.size());
				QuizVO newQuiz = fieldList.get(qnum);
				
				newQuiz.setResult("");
				testQuiz.add(newQuiz);
	
				model.addAttribute("testQuiz", testQuiz);
			}
			// �ش� ������ ���� ����� ����Ʈ�� ����
			if (quizVO.getResult() != null) {
				testQuiz.get(code).setResult(quizVO.getResult());
			}
			// �� ��ü�� ����
			model.addAttribute("testType", 1);
			model.addAttribute("code", code);

			return "/quiz/examQuiz";

		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/study.qu/{field}/{levels}/{code}")
	public String study(@PathVariable String field, @PathVariable int levels, @PathVariable int code, QuizVO quizVO, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// �н��ϱ�� ���� ���� ������ ����
			if (code < 0) { code = 0; }
			// ���� �� ��� ��� ����Ʈ
			List<QuizVO> testQuiz;
			// ���� ����Ʈ�� �������� ���� ��� ���� ������
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
			// ���ο� ���� ��ȣ�� �̵����� ��� ������ ���� �߰�
			if (code >= testQuiz.size()) {
				
				List<QuizVO> quizList = quizService.selectQuizList();
				List<QuizVO> fieldList = new ArrayList<QuizVO>();
				
				for (QuizVO quiz: quizList) {
					if (quiz.getField().equals(field) && quiz.getLevels() == levels) {
						fieldList.add(quiz);
					}
				}
				
				int qnum = (int) (Math.random() * fieldList.size());
				QuizVO newQuiz = fieldList.get(qnum);
				
				newQuiz.setResult("");
				testQuiz.add(newQuiz);
	
				model.addAttribute("testQuiz", testQuiz);
			}
			// �ش� ������ ���� ����� ����Ʈ�� ����
			if (quizVO.getResult() != null) {
				testQuiz.get(code).setResult(quizVO.getResult());
			}
			// �� ��ü�� ����
			model.addAttribute("testType", 2);
			model.addAttribute("code", code);

			return "/quiz/examQuiz";

		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/levelUp.qu/{field}/{code}")
	public String levelUp(@PathVariable String field, @PathVariable int code, QuizVO quizVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� �� �׽�Ʈ ������ 10���� ����
			if (code < 0) { code = 0; }
			if (code > 9) { code = 9; }
			// ���� �� ��� ��� ����Ʈ
			List<QuizVO> testQuiz;
			// ���� ����Ʈ�� �������� ���� ��� ���� ������
			if (session.getAttribute("testQuiz") != null) {
				testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
			} else {
				testQuiz = new ArrayList<QuizVO>();
			}
			// ���ο� ���� ��ȣ�� �̵����� ��� ������ ���� �߰�
			if (code >= testQuiz.size()) {
				
				List<QuizVO> quizList = quizService.selectQuizList();
				List<QuizVO> fieldList = new ArrayList<QuizVO>();
	
				for (QuizVO quiz: quizList) {
					if (quiz.getField().equals(field)) {
						fieldList.add(quiz);
					}
				}
				
				int qnum = (int) (Math.random() * fieldList.size());
				QuizVO newQuiz = fieldList.get(qnum);
				
				newQuiz.setResult("");
				testQuiz.add(newQuiz);
	
				model.addAttribute("testQuiz", testQuiz);
			}
			// �ش� ������ ���� ����� ����Ʈ�� ����
			if (quizVO.getResult() != null) {
				testQuiz.get(code).setResult(quizVO.getResult());
			}
			// �� ��ü�� ����
			model.addAttribute("testType", 3);
			model.addAttribute("code", code);

			return "/quiz/examQuiz";

		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}

	@RequestMapping(value = "/complete.qu/{code}")
	public String complete(@PathVariable int code, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
		
			@SuppressWarnings("unchecked")
			List<QuizVO> testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
			List<QuizVO> quizList = quizService.selectQuizList();
			
			// 1. �׽�Ʈ�� ����
			String testType = null;
			switch (code) {
				case 1: testType = "�Ƿ� ����";		break;
				case 2: testType = "�׽�Ʈ";		break;
				case 3: testType = "���� �� �׽�Ʈ";	break;
			}
			
			// 2. Ǭ ���� ����
			int total = testQuiz.size();
			// 3. ���� ���� ����
			int correct = 0;
	
			for (QuizVO quiz: testQuiz) {
				for (QuizVO quizSample: quizList) {
					if (quiz.getQnum() == quizSample.getQnum() && quiz.getResult().equals(quizSample.getResult())) {
						correct++;
					}
				}
			}
			
			// 4. ������ ����
			String success;
			if (correct < 5) {
				success = "����";
			} else {
				success = "����";
			}
			// 5. ���� �о�
			String field = testQuiz.get(0).getField();
			// 6. ���� ����
			String levels = "Lv " + testQuiz.get(0).getLevels();
			// 7. ����� �ܰ�
			String step;
			if (levels.charAt(3) < 52) {
				step = "�ʱ�";
			} else if (levels.charAt(3) < 55) {
				step = "�߱�";
			} else {
				step = "���";
			}
			
			// 8. ���ܹ��� 1
			String evalText1;
			if (correct < 4) {
				evalText1 = "�������� ����";
			} else if (correct < 7) {
				evalText1 = "�������� ����";
			} else {
				evalText1 = "�ɼ��� ����";
			}
			// 9. ���ܹ��� 2
			String evalText2;
			if (correct < 4) {
				evalText2 = "�⺻���� ���� ���ذ�";
			} else if (correct < 7) {
				evalText2 = "Ȯ���� ���� ������";
			} else {
				evalText2 = "����ɷ� �����";
			}
			// 10. ��������
			Date today = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			String date = dateFormat.format(today);

			
			model.addAttribute("testType", testType);
			model.addAttribute("total", total);
			model.addAttribute("correct", correct);
			model.addAttribute("success", success);
			model.addAttribute("field", field);
			model.addAttribute("levels", levels);
			model.addAttribute("step", step);
			model.addAttribute("evalText1", evalText1);
			model.addAttribute("evalText2", evalText2);
			model.addAttribute("date", date);

			
			testQuiz.clear();
	
		    return "/user/evaluation";
		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	@RequestMapping(value = "/cancel.qu")
	public String cancel(Model model, HttpSession session) throws Exception {
		
		@SuppressWarnings("unchecked")
		List<QuizVO> testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
		testQuiz.clear();
		
		session.removeAttribute("testQuiz");

	    return "/user/userMain";
	}
}
