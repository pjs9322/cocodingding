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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.qboard.service.GradeService;
import com.spring.qboard.service.IncorrectService;
import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.GradeVO;
import com.spring.qboard.vo.IncorrectVO;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.PageVO;
import com.spring.qboard.vo.QuizVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("testQuiz")
public class QuizController {

	@Resource(name = "QuizService")
	private QuizService quizService;

	// ���� ���񽺸� ���ҽ��� ���
	@Resource(name = "GradeService")
	private GradeService gradeService;

	// Ʋ������ ���񽺸� ���ҽ��� ���	
	@Resource(name = "IncorrectService")
	private IncorrectService incorrectService;
	
	// ������ �������� ������ �̵�
	@RequestMapping(value = "/admin.qu", method = RequestMethod.GET)
	public String admin(@RequestParam(defaultValue="1") int page,
						@RequestParam(defaultValue="true") boolean java,
						@RequestParam(defaultValue="true") boolean web,
						@RequestParam(defaultValue="true") boolean db,
						@RequestParam(defaultValue="0") int opt,
						@RequestParam(defaultValue="") String condition, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ���� ��� ����
				List<QuizVO> quizList = quizService.selectQuizList();

				// �о� ���� ����
			    List<QuizVO> fieldList = new ArrayList<QuizVO>();
				if (java) {
					for (QuizVO article: quizList) {
						// �о߰� �ڹ��� �Խñ��� �߰�
						if ("JAVA".equals(article.getField())) {
							fieldList.add(article);
						}
					}
				}
				if (web) {
					for (QuizVO article: quizList) {
						// �о߰� ���� �Խñ��� �߰�
						if ("WEB".equals(article.getField())) {
							fieldList.add(article);
						}
					}
				}
				if (db) {
					for (QuizVO article: quizList) {
						// �о߰� DB�� �Խñ��� �߰�
						if ("DataBase".equals(article.getField())) {
							fieldList.add(article);
						}
					}
				}

				// �˻� ���� ����
			    List<QuizVO> list = new ArrayList<QuizVO>();
			    switch(opt) {
			    case 0: // �ܿ�
					for (QuizVO article: fieldList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getField().contains(condition)) {
							list.add(article);
						}
					}
			    	break; 
		    	case 1: // ����
					for (QuizVO article: fieldList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (String.valueOf(article.getLevels()).equals(condition)) {
							list.add(article);
						}
					}
			    	break;
			    case 2: // ����
					for (QuizVO article: fieldList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getDocument().contains(condition)) {
							list.add(article);
						}
					}
					break;
			    }
			    
				// ������ ���� VO ����
		        PageVO pageVO = new PageVO(list.size(), page);

				// ���� ���� ���
				for (QuizVO quiz: list) {
					String abbrev = quiz.getDocument();
					if (quiz.getDocument().length() > 20) {
						abbrev = quiz.getDocument().substring(0, 20);
					}
					quiz.setAbbrev(abbrev);
				}
		        
			    // �� ��ü�� ����
			    model.addAttribute("java", java);
			    model.addAttribute("web", web);
			    model.addAttribute("db", db);
			    model.addAttribute("opt", opt);
			    model.addAttribute("condition", condition);
			    
			    model.addAttribute("list", list);
		        model.addAttribute("pageVO", pageVO);
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
				// ���� ���� ����
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
	
	// ���� ���� �������� �̵�
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/select.qu/{field}", method = RequestMethod.GET)
	public String select(@PathVariable String field, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			// ���� ����� ��������
			List<QuizVO> testQuiz;
			if (session.getAttribute("testQuiz") != null) {
				testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
				testQuiz.clear();
			}
			
			// �𵨿� �о� ������ ����
			model.addAttribute("field", field);
			// ���� ���� �������� �̵�
		    return "/quiz/selectQuiz";
		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	// ���� ���� ���������� ���� �޴� �˾�
	@RequestMapping(value = "/selectMenu.qu/{num}/{field}", method = RequestMethod.GET)
	public String selectMenu(@PathVariable int num, @PathVariable String field, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// �𵨿� �о� ������ ����
			model.addAttribute("field", field);
			// ������ �׸� Ȱ��ȭ
		    return "/quiz/item_" + num;
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
					if (quiz.getField().equals(field) && quiz.getLevels() == 1) {
						fieldList.add(quiz);
					}
				}
				
				int qnum = (int) (Math.random() * fieldList.size());
				QuizVO newQuiz = fieldList.get(qnum);

				newQuiz.setCheck("");
				testQuiz.add(newQuiz);
	
				model.addAttribute("testQuiz", testQuiz);
			}
			// �ش� ������ ���� ����� ����Ʈ�� ����
			if (quizVO.getCheck() != null) {
				testQuiz.get(code).setCheck(quizVO.getCheck());
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
				
				newQuiz.setCheck("");
				testQuiz.add(newQuiz);
	
				model.addAttribute("testQuiz", testQuiz);
			}
			// �ش� ������ ���� ����� ����Ʈ�� ����
			if (quizVO.getCheck() != null) {
				testQuiz.get(code).setCheck(quizVO.getCheck());
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
			MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
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
						if ("JAVA".equals(field) && quiz.getLevels() == (userInfo.getJava()+1)) {
							fieldList.add(quiz);
						}
						if ("WEB".equals(field) && quiz.getLevels() == (userInfo.getWeb()+1)) {
							fieldList.add(quiz);
						}
						if ("DataBase".equals(field) && quiz.getLevels() == (userInfo.getDatabase()+1)) {
							fieldList.add(quiz);
						}
					}
				}
				
				int qnum = (int) (Math.random() * fieldList.size());
				QuizVO newQuiz = fieldList.get(qnum);

				newQuiz.setCheck("");
				testQuiz.add(newQuiz);
	
				model.addAttribute("testQuiz", testQuiz);
			}
			// �ش� ������ ���� ����� ����Ʈ�� ����
			if (quizVO.getCheck() != null) {
				testQuiz.get(code).setCheck(quizVO.getCheck());
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
	public String complete(@PathVariable int code, @RequestParam(defaultValue="1") int page, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");

			@SuppressWarnings("unchecked")
			List<QuizVO> testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");

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
	
			int [] newGrade = {0, 0, 0, 0, 0, 0};
			IncorrectVO incorrectVO = new IncorrectVO();
			incorrectVO.setId(userInfo.getId());

			for (QuizVO quiz: testQuiz) {
				if (quiz.getCheck().equals(quiz.getResult())) {

					newGrade[Integer.parseInt(quiz.getPart().substring(4))-1]++;
					correct++;
					
				} else {
					incorrectVO.setQnum(quiz.getQnum());
					
					incorrectService.deleteIncorrect(incorrectVO);
					incorrectService.insertIncorrect(incorrectVO);
				}
			}
			
			// 4. ������ ����
			String success;
			if (correct < 5) {
				success = "����";
			} else {
				success = "����";
			}

			// 5. �׽�Ʈ �о�
			String field = testQuiz.get(0).getField();
			// 6. �׽�Ʈ ����
			int levels = testQuiz.get(0).getLevels();

			GradeVO gradeVO = new GradeVO();
			List<GradeVO> gradeList = gradeService.selectGrade(userInfo.getId());
			for(GradeVO grade: gradeList) {
				if (grade.getField().equals(field) && grade.getLevels() == levels) {
					gradeVO = grade;
				}
			}
			switch (code) {
			case 1: // �Ƿ� ������ ��� �� ���� �Ӽ��� �߰�����
				if (gradeVO.getId() == null) {
					gradeVO.setId(userInfo.getId());
					gradeVO.setField(field);
					gradeVO.setLevels(levels);
					gradeVO.setPart1(newGrade[0]);
					gradeVO.setPart2(newGrade[1]);
					gradeVO.setPart3(newGrade[2]);
					gradeVO.setPart4(newGrade[3]);
					gradeVO.setPart5(newGrade[4]);
					gradeVO.setPart6(newGrade[5]);
					gradeService.insertGrade(gradeVO);
				}
				break;
			case 2: // �ڵ�, ���� ������ �� ���� ������ ������ �߰���
				if (gradeVO.getId().equals(userInfo.getId())) {
					gradeVO.setPart1(compute(gradeVO.getPart1(), newGrade[0]));
					gradeVO.setPart2(compute(gradeVO.getPart2(), newGrade[1]));
					gradeVO.setPart3(compute(gradeVO.getPart3(), newGrade[2]));
					gradeVO.setPart4(compute(gradeVO.getPart4(), newGrade[3]));
					gradeVO.setPart5(compute(gradeVO.getPart5(), newGrade[4]));
					gradeVO.setPart6(compute(gradeVO.getPart6(), newGrade[5]));
					gradeService.updateGrade(gradeVO);
				}
				break;
			case 3: // ���� �� �׽�Ʈ�� ��� ���� ���� +1 ������ ��������
				if (gradeVO.getId() == null) {
					if ("����".equals(success)) {
						gradeVO.setId(userInfo.getId());
						gradeVO.setField(field);
						gradeVO.setLevels(levels);
						gradeVO.setPart1(newGrade[0]);
						gradeVO.setPart2(newGrade[1]);
						gradeVO.setPart3(newGrade[2]);
						gradeVO.setPart4(newGrade[3]);
						gradeVO.setPart5(newGrade[4]);
						gradeVO.setPart6(newGrade[5]);
						gradeService.insertGrade(gradeVO);
					}
				}
				break;
			}
			
			// 7. ����� �ܰ�
			String step;
			if (levels < 4) {
				step = "�ʱ�";
			} else if (levels < 7) {
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
			
			List<QuizVO> list = new ArrayList<QuizVO>();
			
			for (QuizVO quiz: testQuiz) {
				list.add(quiz);
			}
			
			// ������ ���� VO ����
	        PageVO pageVO = new PageVO(list.size(), page);

			// ���� ���� ���
			for (QuizVO quiz: list) {
				String abbrev = quiz.getDocument();
				if (quiz.getDocument().length() > 30) {
					abbrev = quiz.getDocument().substring(0, 30);
				}
				quiz.setAbbrev(abbrev);
			}

			// �� ������� ����Ʈ
			List<GradeVO> myGradeList = gradeService.selectGrade(userInfo.getId());

			int java = 0;
			int web = 0;
			int database = 0;
			
			// �ݺ������� �� �ܰ躰 ���� ���� ����
			for (GradeVO grade: myGradeList) {
				if ("JAVA".equals(grade.getField())) {
					java++;
				}
				if ("WEB".equals(grade.getField())) {
					web++;
				}
				if ("DataBase".equals(grade.getField())) {
					database++;
				}
			}

			userInfo.setJava(java);
			userInfo.setWeb(web);
			userInfo.setDatabase(database);
			
			model.addAttribute("code", code);
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
			
			model.addAttribute("list", list);
	        model.addAttribute("pageVO", pageVO);
	        model.addAttribute("userInfo", userInfo);
	
		    return "/user/evaluation";
		} catch (Exception e) {}
		// �α��� ���°� �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	private int compute(int curGrade, int newGrade) {

		if (curGrade < 3) {
			return curGrade + newGrade; 
		}
		if (curGrade < 5) {
			return curGrade + newGrade/2; 
		}
		if (curGrade < 7) {
			return curGrade + newGrade/3; 
		}
		if (curGrade < 9) {
			return curGrade*3/4 + newGrade/3; 
		}
		
		return newGrade*2/3 + newGrade/3;
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


