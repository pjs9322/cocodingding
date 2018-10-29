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
	
	@RequestMapping(value = "/admin.qu", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		if (session.getAttribute("userInfo") != null) {
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 전체 문제 목록 추출
				List<QuizVO> quizList = quizService.selectQuizList();
				// 문제 본문 요약
				/*
				for (QuizVO quiz: quizList) {
					String reduction = quiz.getDocument().substring(0, 5);
					quiz.setDocument(reduction);
				}
				*/
				// 모델 객체로 주입
				model.addAttribute("quizList", quizList);
				// 관리자 페이지로 이동
				return "admin/admin_quiz";
			}
		}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	@RequestMapping(value = "/admin_delete.qu/{qnum}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		if (session.getAttribute("userInfo") != null) {
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 선택 사용자 삭제
				quizService.deleteQuiz(qnum);
				// 삭제 완료 후 관리자 페이지로 이동
				return HomeController.alert(model, "문제가 삭제되었습니다.", "/qboard/admin.qu");
			}
		}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	

	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/makeQuizForm.qu", method = RequestMethod.GET)
	public String makeQuizForm(Model model) {

	    return "/quiz/makeQuiz";
	}
	
	@RequestMapping(value = "/quizInsert.qu", method = RequestMethod.POST)
	public String quizInsert(QuizVO quizVO, Model model) throws Exception {
		
		quizService.insertQuiz(quizVO);

		return HomeController.alert(model, "문제 추가가 완료되었습니다.", "/qboard/admin.qu");
	}
	
	@RequestMapping(value = "/modQuizForm.qu/{qnum}", method = RequestMethod.GET)
	public String modQuizForm(@PathVariable int qnum, Model model, HttpServletRequest request) throws Exception {
		
		QuizVO quizVO = quizService.selectQuiz(qnum);
		
		request.setAttribute("result", String.valueOf(quizVO.getResult()));
		model.addAttribute("quiz", quizVO);

	    return "/quiz/modQuiz";
	}
	
	@RequestMapping(value = "/updateQuiz.qu/{qnum}", method = RequestMethod.POST)
	public String updateQuiz(@PathVariable int qnum, QuizVO quizVO, Model model) throws Exception {
		
		quizVO.setQnum(qnum);
		quizService.updateQuiz(quizVO);
		
		return HomeController.alert(model, "문제 정보가 수정되었습니다.", "/qboard/admin.qu");
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
