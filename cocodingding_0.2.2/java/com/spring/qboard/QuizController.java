package com.spring.qboard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.qboard.service.QuizService;
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
	public String admin(Model model) throws Exception {
		
		List<QuizVO> quizList = quizService.selectQuizList();
		
		model.addAttribute("quiz", quizList);
		
		return "admin/admin_quiz";
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
	
	@RequestMapping(value = "/deleteQuiz.qu/{qnum}", method = RequestMethod.GET)
	public String deleteQuiz(@PathVariable int qnum, Model model) throws Exception {
		
		quizService.deleteQuiz(qnum);

		return HomeController.alert(model, "문제가 삭제되었습니다.", "/qboard/admin.qu");
	}
	
}
