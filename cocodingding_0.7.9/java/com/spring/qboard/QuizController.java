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

	// 점수 서비스를 리소스로 사용
	@Resource(name = "GradeService")
	private GradeService gradeService;

	// 틀린문제 서비스를 리소스로 사용	
	@Resource(name = "IncorrectService")
	private IncorrectService incorrectService;
	
	// 관리자 문제관리 페이지 이동
	@RequestMapping(value = "/admin.qu", method = RequestMethod.GET)
	public String admin(@RequestParam(defaultValue="1") int page,
						@RequestParam(defaultValue="true") boolean java,
						@RequestParam(defaultValue="true") boolean web,
						@RequestParam(defaultValue="true") boolean db,
						@RequestParam(defaultValue="0") int opt,
						@RequestParam(defaultValue="") String condition, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 전체 문제 목록 추출
				List<QuizVO> quizList = quizService.selectQuizList();

				// 분야 필터 설정
			    List<QuizVO> fieldList = new ArrayList<QuizVO>();
				if (java) {
					for (QuizVO article: quizList) {
						// 분야가 자바인 게시글을 추가
						if ("JAVA".equals(article.getField())) {
							fieldList.add(article);
						}
					}
				}
				if (web) {
					for (QuizVO article: quizList) {
						// 분야가 웹인 게시글을 추가
						if ("WEB".equals(article.getField())) {
							fieldList.add(article);
						}
					}
				}
				if (db) {
					for (QuizVO article: quizList) {
						// 분야가 DB인 게시글을 추가
						if ("DataBase".equals(article.getField())) {
							fieldList.add(article);
						}
					}
				}

				// 검색 필터 설정
			    List<QuizVO> list = new ArrayList<QuizVO>();
			    switch(opt) {
			    case 0: // 단원
					for (QuizVO article: fieldList) {
						// 검색 결과를 포함하는 글만 추가
						if (article.getField().contains(condition)) {
							list.add(article);
						}
					}
			    	break; 
		    	case 1: // 레벨
					for (QuizVO article: fieldList) {
						// 검색 결과를 포함하는 글만 추가
						if (String.valueOf(article.getLevels()).equals(condition)) {
							list.add(article);
						}
					}
			    	break;
			    case 2: // 본문
					for (QuizVO article: fieldList) {
						// 검색 결과를 포함하는 글만 추가
						if (article.getDocument().contains(condition)) {
							list.add(article);
						}
					}
					break;
			    }
			    
				// 페이지 관리 VO 생성
		        PageVO pageVO = new PageVO(list.size(), page);

				// 문제 본문 요약
				for (QuizVO quiz: list) {
					String abbrev = quiz.getDocument();
					if (quiz.getDocument().length() > 20) {
						abbrev = quiz.getDocument().substring(0, 20);
					}
					quiz.setAbbrev(abbrev);
				}
		        
			    // 모델 객체로 주입
			    model.addAttribute("java", java);
			    model.addAttribute("web", web);
			    model.addAttribute("db", db);
			    model.addAttribute("opt", opt);
			    model.addAttribute("condition", condition);
			    
			    model.addAttribute("list", list);
		        model.addAttribute("pageVO", pageVO);
				// 관리자 페이지로 이동
				return "admin/admin_quiz";
			}
		} catch (Exception e) {}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	// 문제 생성 기능
	@RequestMapping(value = "/admin_make.qu", method = RequestMethod.POST)
	public String admin_make(Model model, QuizVO quizVO, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 문제 생성
				quizService.insertQuiz(quizVO);
				// 삭제 완료 후 관리자 페이지로 이동
				return HomeController.alert(model, "문제가 추가되었습니다.", "/qboard/admin.qu");
			}
		} catch (Exception e) {}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}
	
	// 문제 수정 기능
	@RequestMapping(value = "/admin_modPro.qu", method = RequestMethod.POST)
	public String admin_modPro(Model model, QuizVO quizVO, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 선택 문제 갱신
				quizService.updateQuiz(quizVO);
				// 갱신 완료 후 관리자 페이지로 이동
				return HomeController.alert(model, "문제가 수정되었습니다.", "/qboard/admin.qu");
			}
		} catch (Exception e) {}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}
	
	// 문제 삭제 기능
	@RequestMapping(value = "/admin_delete.qu/{qnum}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable int qnum, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 선택 사용자 삭제
				quizService.deleteQuiz(qnum);
				// 삭제 완료 후 관리자 페이지로 이동
				return HomeController.alert(model, "문제가 삭제되었습니다.", "/qboard/admin.qu");
			}
		} catch (Exception e) {}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}
	
	// 문제 선택 페이지로 이동
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/select.qu/{field}", method = RequestMethod.GET)
	public String select(@PathVariable String field, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			
			// 퀴즈 목록을 사전삭제
			List<QuizVO> testQuiz;
			if (session.getAttribute("testQuiz") != null) {
				testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
				testQuiz.clear();
			}
			
			// 모델에 분야 정보를 주입
			model.addAttribute("field", field);
			// 문제 선택 페이지로 이동
		    return "/quiz/selectQuiz";
		} catch (Exception e) {}
		// 로그인 상태가 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}
	
	// 문제 선택 페이지에서 세부 메뉴 팝업
	@RequestMapping(value = "/selectMenu.qu/{num}/{field}", method = RequestMethod.GET)
	public String selectMenu(@PathVariable int num, @PathVariable String field, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 모델에 분야 정보를 주입
			model.addAttribute("field", field);
			// 선택한 항목 활성화
		    return "/quiz/item_" + num;
		} catch (Exception e) {}
		// 로그인 상태가 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}
	
	// 실력 진단 페이지
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/diagno.qu/{field}/{code}")
	public String diagno(@PathVariable String field, @PathVariable int code, QuizVO quizVO, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 실력 진단 문제는 10개로 제한
			if (code < 0) { code = 0; }
			if (code > 9) { code = 9; }
			// 우측 폼 기록 담당 리스트
			List<QuizVO> testQuiz;
			// 기존 리스트가 존재하지 않을 경우 새로 생성함
			if (session.getAttribute("testQuiz") != null) {
				testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
			} else {
				testQuiz = new ArrayList<QuizVO>();
			}
			// 새로운 문제 번호로 이동했을 경우 랜덤한 문제 추가
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
			// 해당 문제의 선택 결과를 리스트에 갱신
			if (quizVO.getCheck() != null) {
				testQuiz.get(code).setCheck(quizVO.getCheck());
			}
			// 모델 객체로 주입
			model.addAttribute("testType", 1);
			model.addAttribute("code", code);

			return "/quiz/examQuiz";

		} catch (Exception e) {}
		// 로그인 상태가 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/study.qu/{field}/{levels}/{code}")
	public String study(@PathVariable String field, @PathVariable int levels, @PathVariable int code, QuizVO quizVO, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// 학습하기는 문제 수의 제한이 없음
			if (code < 0) { code = 0; }
			// 우측 폼 기록 담당 리스트
			List<QuizVO> testQuiz;
			// 기존 리스트가 존재하지 않을 경우 새로 생성함
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
			// 새로운 문제 번호로 이동했을 경우 랜덤한 문제 추가
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
			// 해당 문제의 선택 결과를 리스트에 갱신
			if (quizVO.getCheck() != null) {
				testQuiz.get(code).setCheck(quizVO.getCheck());
			}
			
			// 모델 객체로 주입
			model.addAttribute("testType", 2);
			model.addAttribute("code", code);

			return "/quiz/examQuiz";

		} catch (Exception e) {}
		// 로그인 상태가 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/levelUp.qu/{field}/{code}")
	public String levelUp(@PathVariable String field, @PathVariable int code, QuizVO quizVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
			// 레벨 업 테스트 문제는 10개로 제한
			if (code < 0) { code = 0; }
			if (code > 9) { code = 9; }
			// 우측 폼 기록 담당 리스트
			List<QuizVO> testQuiz;
			// 기존 리스트가 존재하지 않을 경우 새로 생성함
			if (session.getAttribute("testQuiz") != null) {
				testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");
			} else {
				testQuiz = new ArrayList<QuizVO>();
			}
			// 새로운 문제 번호로 이동했을 경우 랜덤한 문제 추가
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
			// 해당 문제의 선택 결과를 리스트에 갱신
			if (quizVO.getCheck() != null) {
				testQuiz.get(code).setCheck(quizVO.getCheck());
			}
			// 모델 객체로 주입
			model.addAttribute("testType", 3);
			model.addAttribute("code", code);

			return "/quiz/examQuiz";

		} catch (Exception e) {}
		// 로그인 상태가 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}

	@RequestMapping(value = "/complete.qu/{code}")
	public String complete(@PathVariable int code, @RequestParam(defaultValue="1") int page, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");

			@SuppressWarnings("unchecked")
			List<QuizVO> testQuiz = (List<QuizVO>) session.getAttribute("testQuiz");

			// 1. 테스트의 종류
			String testType = null;
			switch (code) {
				case 1: testType = "실력 진단";		break;
				case 2: testType = "테스트";		break;
				case 3: testType = "레벨 업 테스트";	break;
			}
			
			// 2. 푼 문제 갯수
			int total = testQuiz.size();
			// 3. 맞춘 문제 갯수
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
			
			// 4. 레벨업 여부
			String success;
			if (correct < 5) {
				success = "실패";
			} else {
				success = "성공";
			}

			// 5. 테스트 분야
			String field = testQuiz.get(0).getField();
			// 6. 테스트 레벨
			int levels = testQuiz.get(0).getLevels();

			GradeVO gradeVO = new GradeVO();
			List<GradeVO> gradeList = gradeService.selectGrade(userInfo.getId());
			for(GradeVO grade: gradeList) {
				if (grade.getField().equals(field) && grade.getLevels() == levels) {
					gradeVO = grade;
				}
			}
			switch (code) {
			case 1: // 실력 진단의 경우 새 점수 속성을 추가해줌
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
			case 2: // 자동, 수동 문제일 때 현재 레벨에 점수가 추가됨
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
			case 3: // 레벨 업 테스트의 경우 현재 레벨 +1 레벨을 생성해줌
				if (gradeVO.getId() == null) {
					if ("성공".equals(success)) {
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
			
			// 7. 사용자 단계
			String step;
			if (levels < 4) {
				step = "초급";
			} else if (levels < 7) {
				step = "중급";
			} else {
				step = "고급";
			}
			
			// 8. 진단문구 1
			String evalText1;
			if (correct < 4) {
				evalText1 = "기초적인 수준";
			} else if (correct < 7) {
				evalText1 = "제한적인 수준";
			} else {
				evalText1 = "능숙한 수준";
			}
			// 9. 진단문구 2
			String evalText2;
			if (correct < 4) {
				evalText2 = "기본적인 개념 이해가";
			} else if (correct < 7) {
				evalText2 = "확실한 개념 숙지가";
			} else {
				evalText2 = "응용능력 향상이";
			}
			// 10. 진단일자
			Date today = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			String date = dateFormat.format(today);
			
			List<QuizVO> list = new ArrayList<QuizVO>();
			
			for (QuizVO quiz: testQuiz) {
				list.add(quiz);
			}
			
			// 페이지 관리 VO 생성
	        PageVO pageVO = new PageVO(list.size(), page);

			// 문제 본문 요약
			for (QuizVO quiz: list) {
				String abbrev = quiz.getDocument();
				if (quiz.getDocument().length() > 30) {
					abbrev = quiz.getDocument().substring(0, 30);
				}
				quiz.setAbbrev(abbrev);
			}

			// 내 점수기록 리스트
			List<GradeVO> myGradeList = gradeService.selectGrade(userInfo.getId());

			int java = 0;
			int web = 0;
			int database = 0;
			
			// 반복문으로 각 단계별 현재 레벨 추출
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
		// 로그인 상태가 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
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


