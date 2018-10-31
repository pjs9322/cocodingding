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
	

	// 장바구니 리스트 보기
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
			// 전체 장바구니 목록 (id와 qnum만 보유)
		    List<BookMarkVO> bookMarkList = bookMarkService.selectBookMarkList();

		    // 내 ID와 같은 속성만 분리
			List<BookMarkVO> myList = new ArrayList<BookMarkVO>();
			for (BookMarkVO article: bookMarkList) {
				if (article.getId().equals(userInfo.getId())) {
					myList.add(article);
				}
			}

			// 장바구니 목록에 문제 내용 추가
			List<BookMarkVO> Quizlist = new ArrayList<BookMarkVO>();
			for (BookMarkVO article: myList) {
				Quizlist.add(new BookMarkVO(quizService.selectQuiz(article.getQnum())));
				Quizlist.get(myList.indexOf(article)).setId(article.getId());
			}
			
			// 분야 필터 설정
		    List<BookMarkVO> fieldList = new ArrayList<BookMarkVO>();
			if (java) {
				for (BookMarkVO article: Quizlist) {
					// 분야가 자바인 게시글을 추가
					if ("JAVA".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (web) {
				for (BookMarkVO article: Quizlist) {
					// 분야가 웹인 게시글을 추가
					if ("WEB".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			if (db) {
				for (BookMarkVO article: Quizlist) {
					// 분야가 DB인 게시글을 추가
					if ("DataBase".equals(article.getField())) {
						fieldList.add(article);
					}
				}
			}
			
			// 검색 필터 설정
		    List<BookMarkVO> searchList = new ArrayList<BookMarkVO>();
		    switch(opt) {
		    case 0: // 단원
				for (BookMarkVO article: fieldList) {
					// 검색 결과를 포함하는 글만 추가
					if (article.getField().contains(condition)) {
						searchList.add(article);
					}
				}
		    	break; 
	    	case 1: // 레벨
				for (BookMarkVO article: fieldList) {
					// 검색 결과를 포함하는 글만 추가
					if (String.valueOf(article.getLevels()).equals(condition)) {
						searchList.add(article);
					}
				}
		    	break;
		    case 2: // 본문
				for (BookMarkVO article: fieldList) {
					// 검색 결과를 포함하는 글만 추가
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
	
		    return "/user/userBookMark";
		} catch (Exception e) {}
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	

	// 장바구니 추가
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
				case 1:	return HomeController.alert(model, "장바구니에 추가되었습니다.", "/qboard/diagno.qu/" + field + "/" + code);
				case 2:	return HomeController.alert(model, "장바구니에 추가되었습니다.", "/qboard/study.qu/" + field + "/" + levels + "/" + code);
				case 3:	return HomeController.alert(model, "장바구니에 추가되었습니다.", "/qboard/levelUp.qu/" + field + "/" + code);
			}

		} catch (Exception e) {}
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	// 장바구니 문제 삭제 완료
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
		// 올바른 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
}
