package com.spring.qboard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.qboard.service.MemberService;
import com.spring.qboard.vo.MemberVO;

@Controller
@SessionAttributes("userInfo")
public class MemberController {
	
	// 맴버 서비스를 리소스로 사용
	@Resource(name = "MemberService")
	private MemberService memberService;
	
	// 사용자 메인 페이지로 이동
	@RequestMapping(value = "/user.me", method = RequestMethod.GET)
	public String userMain(Model model) throws Exception {
		// 사용자 메인 페이지로 이동
		return "user/userMain";
	}
	
	// 관리자 메인 페이지로 이동
	@RequestMapping(value = "/admin.me", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		if (session.getAttribute("userInfo") != null) {
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 전체 사용자 목록 추출
				List<MemberVO> memberList = memberService.selectMemberList();
				// 모델 객체로 주입
				model.addAttribute("memberList", memberList);
				// 관리자 페이지로 이동
				return "admin/admin_mem";
			}
		}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");
	}
	
	// 계정 찾기 페이지로 이동
	@RequestMapping(value = "/findForm.me", method = RequestMethod.GET)
	public String findForm(Model model) {
		// 계정 찾기 페이지로 이동
		return "member/findMem";
	}
	
	// 로그인 기능 실행
	@RequestMapping(value = "/loginPro.me", method = RequestMethod.POST)
	public String login(Model model, MemberVO memberVO) throws Exception {
		// 전체 사용자 목록 추출
		List<MemberVO> memberList = memberService.selectMemberList();
		// 입력 정보 판별을 위해 반복문
		for (MemberVO member: memberList) {
			// ID와 비밀번호가 전부 일치하는 경우
			if (member.getId().equals(memberVO.getId()) && member.getPassword().equals(memberVO.getPassword())) {
				// 세션 및 모델 객체에 사용자 정보 주입
				model.addAttribute("userInfo", member);
				// 관리자 등급에 따라 이동할 페이지를 분류함
				if (member.getAdmin() != 0) {
					// 관리자 메인 페이지로 이동
					return HomeController.alert(model, "관리자 계정으로 로그인하셨습니다.", "/qboard/admin.me");
				} else {
					// 사용자 메인 페이지로 이동
					return HomeController.alert(model, member.getNickname() + " 회원님 환영합니다.", "/qboard/user.me");
				}
			}
		}
		// 일치 정보가 없을 경우 되돌아감
		return HomeController.alert(model, "일치하는 정보가 없습니다.", "/qboard");
	}
	
	// 로그아웃 기능 실행
	@RequestMapping(value = "/logoutPro.me", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 세션 객체의 데이터 제거
		session.removeAttribute("userInfo");
		// 홈페이지로 이동
		return "redirect:/";
	}
	
	// 회원가입 기능 실행
	@RequestMapping(value = "/joinPro.me", method = RequestMethod.POST)
	public String join(Model model, MemberVO memberVO) throws Exception {
		// 입력 데이터 무결성 확인
		if (!memberVO.getPassword().equals(memberVO.getPasscheck())) {
			return HomeController.alert(model, "비밀번호를 확인해주세요", "/qboard");
		}
		// 전체 사용자 목록 추출
		List<MemberVO> memberList = memberService.selectMemberList();
		// 중복되는 계정이 있는지 확인
		for (MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId()) || member.getEmail().equals(memberVO.getEmail())) {
				return HomeController.alert(model, "중복 계정입니다. 다시 확인해주세요", "/qboard");
			}
		}
		// 데이터베이스에 새로운 유저 정보 등록
		memberService.insertMember(memberVO);
		// 로그인 화면으로 이동
		return HomeController.alert(model, "입력하신 정보로 회원가입되셨습니다.", "/qboard");
	}
	
	
	
	
	
	
	
	// 관리자 수정 시작 기능
	@RequestMapping(value = "/admin_modForm.me/{id}", method = RequestMethod.GET)
	public String admin_modForm(@PathVariable String id, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		if (session.getAttribute("userInfo") != null) {
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 전체 사용자 목록 추출
				List<MemberVO> memberList = memberService.selectMemberList();
				// 선택 사용자 목록 추출
				MemberVO memberVO = memberService.selectMember(id);
				// 모델 객체로 주입
				model.addAttribute("member", memberVO);
				model.addAttribute("memberList", memberList);
				// 관리자 페이지로 이동
				return "admin/admin_mem";
			}
		}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}

	@RequestMapping(value = "/admin_modPro.me", method = RequestMethod.POST)
	public String admin_modPro(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		if (session.getAttribute("userInfo") != null) {
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 선택 사용자 존재 확인
				if (memberVO.getId() != "") {
					// 선택 사용자 정보 수정
					memberService.updateMember(memberVO);
					// 수정 성공 및 관리자 페이지로 이동
					return HomeController.alert(model, "회원 정보가 수정되었습니다.", "/qboard/admin.me");
				}
				return HomeController.alert(model, "올바른 회원 정보를 선택해 주세요", "/qboard/admin.me");
			}
		}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	
	}
	
	@RequestMapping(value = "/admin_delete.me/{id}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable String id, Model model, HttpSession session) throws Exception {
		// 사용자 세션 존재 확인 (로그인 여부 확인)
		if (session.getAttribute("userInfo") != null) {
			// 현재 접속 계정이 관리자 계정인지 확인
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// 선택 사용자 삭제
				memberService.deleteMember(id);
				// 삭제 완료 후 관리자 페이지로 이동
				return HomeController.alert(model, "회원 정보가 삭제되었습니다.", "/qboard/admin.me");
			}
		}
		// 관리자 접근이 아닐 경우 경고 출력
		return HomeController.alert(model, "올바른 접근이 아닙니다.", "/qboard");	

	}
	
	@RequestMapping(value = "/findIdPro.me", method = RequestMethod.POST)
	public String findId(Model model, MemberVO memberVO) {
		
		return HomeController.alert(model, "일치하는 정보가 없습니다.", "/qboard/findForm.me");

	}
	
	@RequestMapping(value = "/findPassPro.me", method = RequestMethod.POST)
	public String findPass(Model model, MemberVO memberVO) {
		
		return HomeController.alert(model, "일치하는 정보가 없습니다.", "/qboard/findForm.me");
	}
	
	@RequestMapping(value = "/modPro.me", method = RequestMethod.POST)
	public String mod(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		
		if (memberVO.getPassword().equals(memberVO.getPasscheck())) {
			memberService.updateMember(memberVO);
			session.removeAttribute("userInfo");
			return HomeController.alert(model, "변경된 정보로 다시 로그인해주세요.", "/qboard");
		}
		
		return HomeController.alert(model, "비밀번호를 다시 확인해 주세요.", "/qboard/modForm.me");
	}
}
