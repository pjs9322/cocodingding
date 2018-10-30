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

import com.spring.qboard.service.IncorrectService;
import com.spring.qboard.service.QuizService;
import com.spring.qboard.vo.IncorrectVO;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("incorrectList")
public class IncorrectController {

	@Resource(name = "IncorrectService")
	private IncorrectService incorrectService;
	
	@Resource(name = "QuizService")
	private QuizService quizService;
	

	// 틀린문제 리스트 보기
	@RequestMapping(value = "/incorrectList.ic", method = RequestMethod.GET)
	public String boardList(@RequestParam(defaultValue="1") int page,
							@RequestParam(defaultValue="true") boolean java,
							@RequestParam(defaultValue="true") boolean web,
							@RequestParam(defaultValue="true") boolean db,
							@RequestParam(defaultValue="0") int opt,
							@RequestParam(defaultValue="") String condition, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 전체 장바구니 목록 (id와 qnum만 보유)
		    List<IncorrectVO> incorrectList = incorrectService.selectIncorrectList();
		    // 문제 전체 목록
			List<IncorrectVO> Quizlist = new ArrayList<IncorrectVO>();

			for (IncorrectVO article: incorrectList) {
				Quizlist.add(new IncorrectVO(quizService.selectQuiz(article.getQnum())));
				Quizlist.get(incorrectList.indexOf(article)).setId(article.getId());
			}
			
			// 분야 필터 설정
		    List<IncorrectVO> fieldList = new ArrayList<IncorrectVO>();
			if (java) {
				for (IncorrectVO article: Quizlist) {
					// 분야가 자바인 게시글을 추가
					if ("JAVA".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (web) {
				for (IncorrectVO article: Quizlist) {
					// 분야가 웹인 게시글을 추가
					if ("WEB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (db) {
				for (IncorrectVO article: Quizlist) {
					// 분야가 DB인 게시글을 추가
					if ("DataBase".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			
			// 검색 필터 설정
		    List<IncorrectVO> searchList = new ArrayList<IncorrectVO>();
		    switch(opt) {
		    case 0: // 단원
				for (IncorrectVO article: fieldList) {
					// 검색 결과를 포함하는 글만 추가
					if (article.getField().contains(condition)) {
						searchList.add(article);
					}
				}
		    	break; 
	    	case 1: // 레벨
				for (IncorrectVO article: fieldList) {
					// 검색 결과를 포함하는 글만 추가
					if (String.valueOf(article.getLevels()).equals(condition)) {
						searchList.add(article);
					}
				}
		    	break;
		    case 2: // 본문
				for (IncorrectVO article: fieldList) {
					// 검색 결과를 포함하는 글만 추가
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

			// 페이지 관리 VO 생성
	        PageVO pageVO = new PageVO(searchList.size(), page);
	        
	        // 각 게시물마다 가상 번호를 부여
	        for (int i = 0; i < searchList.size(); i++) {
	        	searchList.get(i).setCurNumber(searchList.size() - i);
	        }
		    // 모델 객체로 주입

		    model.addAttribute("java", java);
		    model.addAttribute("web", web);
		    model.addAttribute("db", db);
		    model.addAttribute("opt", opt);
		    model.addAttribute("condition", condition);
		    
		    model.addAttribute("list", searchList);
	        model.addAttribute("pageVO", pageVO);
	
		    return "/user/userIncorrect";
		} catch (Exception e) {}
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	

	// 틀린문제 추가
	@RequestMapping(value = "/incorrectInsert.ic/{type}/{field}/{levels}/{code}/{qnum}")
	public String boardInsert(@PathVariable int type, @PathVariable String field, @PathVariable int levels, @PathVariable int code, @PathVariable int qnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			String id = ((MemberVO) session.getAttribute("userInfo")).getId();
			
			IncorrectVO incorrectVO = new IncorrectVO();
			incorrectVO.setId(id);
			incorrectVO.setQnum(qnum);
			
			incorrectService.deleteIncorrect(incorrectVO);
			incorrectService.insertIncorrect(incorrectVO);

			switch(type) {
				case 1:	return "redirect:/diagno.qu/" + field + "/" + code;
				case 2:	return "redirect:/study.qu/" + field + "/" + levels + "/" + code;
				case 3:	return "redirect:/levelUp.qu/" + field + "/" + code;
			}

		} catch (Exception e) {}
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	// 틀린문제 삭제 완료
	@RequestMapping(value = "/incorrectDelete.ic/{qnum}", method = RequestMethod.GET)
	public String boardDelete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			MemberVO user = (MemberVO) session.getAttribute("userInfo");
			
			IncorrectVO incorrectVO = new IncorrectVO();
			incorrectVO.setId(user.getId());
			incorrectVO.setQnum(qnum);

			incorrectService.deleteIncorrect(incorrectVO);
					
			return "redirect:/incorrectList.bm";
		} catch (Exception e) {}
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
}
