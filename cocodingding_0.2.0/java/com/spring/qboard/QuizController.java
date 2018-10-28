package com.spring.qboard;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.QuizVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("quizCheck")
public class QuizController {


	@Resource(name = "QuizService")
	private QuizService quizService;

	@RequestMapping(value = "/study.qu", method = RequestMethod.GET)
	public String study(Model model) throws Exception {
		
		List<QuizVO> quizCheck = new ArrayList<QuizVO>();
		
		model.addAttribute("quizCheck", quizCheck);
		
	    return "/quiz/solveQuiz";
	}
	
	@RequestMapping(value = "/check.qu", method = RequestMethod.POST)
	public String check(QuizVO quizVO, Model model, HttpSession session) throws Exception {
		
		@SuppressWarnings("unchecked")
		List<QuizVO> quizCheck = (List<QuizVO>) session.getAttribute("quizCheck");
		
		quizVO.setQnum(quizCheck.size()+1);
		
		quizCheck.add(quizVO);
		model.addAttribute("quizCheck", quizCheck);

	    return "/quiz/solveQuiz";
	}
	
	@RequestMapping(value = "/quizInsert.qu", method = RequestMethod.POST)
	public String quizInsert(QuizVO quizVO, Model model) throws Exception {
		
		quizService.insertQuiz(quizVO);
		

	    return "/quiz/solveQuiz";
	}
	
}
