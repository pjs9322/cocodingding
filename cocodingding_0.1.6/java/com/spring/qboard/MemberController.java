package com.spring.qboard;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.qboard.service.MemberService;
import com.spring.qboard.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@Resource(name = "boardService")
	private MemberService memberService;
	
	@RequestMapping(value = "/loginForm.me", method = RequestMethod.GET)
	public String loginFrom(Locale locale, Model model) {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/joinForm.me", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "member/join";
	}
	
	@RequestMapping(value = "/findForm.me", method = RequestMethod.GET)
	public String findForm(Locale locale, Model model) {
		
		return "member/findMem";
	}
	
	@RequestMapping(value = "/modForm.me", method = RequestMethod.GET)
	public String modForm(Locale locale, Model model) {

		return "member/modMem";
	}
	
	@RequestMapping(value = "/logoutPro.me", method = RequestMethod.GET)
	public String logout(Locale locale) {
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/loginPro.me", method = RequestMethod.POST)
	public String login(Model model, MemberVO loginVO) {
		
		if (loginVO.getId().equals("admin")) {
			return "userMain/admin";
		}
		
		return HomeController.alert(model, "일치하는 정보가 없습니다.", "/qboard/loginForm.me");

	}
	
	@RequestMapping(value = "/joinPro.me", method = RequestMethod.POST)
	public String join(Model model, MemberVO loginVO) {
		
		return HomeController.alert(model, "중복 계정입니다. 다시 확인해주세요", "/qboard/joinForm.me");
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
	public String mod(Model model, MemberVO memberVO) {
		
		return HomeController.alert(model, "지금은 회원 정보를 수정할 수 없습니다.", "/qboard/modForm.me");
	}
}
