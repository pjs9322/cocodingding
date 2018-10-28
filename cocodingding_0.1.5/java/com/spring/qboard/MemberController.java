package com.spring.qboard;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.qboard.vo.LoginVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "member/join";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String findMem(Locale locale, Model model) {
		
		return "member/findMember";
	}
	
	@RequestMapping(value = "/mod", method = RequestMethod.GET)
	public String modMem(Locale locale, Model model) {

		return "member/modMember";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, LoginVO loginInfo) {
		
		if (loginInfo.getId().equals("admin")) {
			return "member/admin";
		}
		
		return "redirect:findMember";
	}
}
