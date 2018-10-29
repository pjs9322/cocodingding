package com.spring.qboard;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.qboard.service.MemberService;
import com.spring.qboard.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("userInfo")
public class MemberController {
	
	@Resource(name = "MemberService")
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
	
	@RequestMapping(value = "/admin_modForm.me/{id}", method = RequestMethod.GET)
	public String admin_modForm(@PathVariable String id, Model model) throws Exception {
		
		MemberVO memberVO = memberService.selectMember(id);
		
		model.addAttribute("member", memberVO);

		return "admin/admin_modMem";
	}

	@RequestMapping(value = "/admin_modPro.me", method = RequestMethod.POST)
	public String admin_modPro(Model model, MemberVO memberVO) throws Exception {
		
		if (memberVO.getPassword().equals(memberVO.getPasscheck())) {
			memberService.updateMember(memberVO);
			return HomeController.alert(model, "회원 정보가 수정되었습니다.", "/qboard/admin.me");
		}
		
		return HomeController.alert(model, "비밀번호를 다시 확인해 주세요.", "/qboard/admin_modForm.me/" + memberVO.getId());
	}
	
	@RequestMapping(value = "/admin_delete.me/{id}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable String id, Model model) throws Exception {
		
		memberService.deleteMember(id);

		return "admin/admin.me";
	}
	
	@RequestMapping(value = "/logoutPro.me", method = RequestMethod.GET)
	public String logout(Locale locale, SessionStatus session) {
		
		session.setComplete();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/loginPro.me", method = RequestMethod.POST)
	public String login(Model model, MemberVO memberVO) throws Exception {
		
		List<MemberVO> memberList = memberService.selectMemberList();

		for (MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId()) && member.getPassword().equals(memberVO.getPassword())) {
				model.addAttribute("userInfo", member);
				if (member.getAdmin() != 0) {
					return HomeController.alert(model, "관리자 계정으로 로그인하셨습니다.", "/qboard/admin.me");
				} else {
					return HomeController.alert(model, member.getNickname() + " 회원님 환영합니다.", "/qboard/user.me");
				}
			}
		}
		
		return HomeController.alert(model, "일치하는 정보가 없습니다.", "/qboard/loginForm.me");
	}
	
	@RequestMapping(value = "/user.me", method = RequestMethod.GET)
	public String userMain(Model model) throws Exception {
		
		return "user/userMain";
	}
	
	@RequestMapping(value = "/admin.me", method = RequestMethod.GET)
	public String admin(Model model) throws Exception {
		
		List<MemberVO> memberList = memberService.selectMemberList();
		
		model.addAttribute("member", memberList);
		
		return "admin/admin_mem";
	}
	
	@RequestMapping(value = "/joinPro.me", method = RequestMethod.POST)
	public String join(Model model, MemberVO memberVO) throws Exception {
		
		if (!memberVO.getPassword().equals(memberVO.getPasscheck())) {
			return HomeController.alert(model, "비밀번호를 확인해주세요", "/qboard/joinForm.me");
		}
		
		List<MemberVO> memberList = memberService.selectMemberList();
		
		for (MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId()) || member.getEmail().equals(memberVO.getEmail())) {
				return HomeController.alert(model, "중복 계정입니다. 다시 확인해주세요", "/qboard/joinForm.me");
			}
		}
		
		memberService.insertMember(memberVO);
		
		return HomeController.alert(model, "입력하신 정보로 회원가입되셨습니다.", "/qboard/loginForm.me");
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
	public String mod(Model model, MemberVO memberVO, SessionStatus session) throws Exception {
		
		if (memberVO.getPassword().equals(memberVO.getPasscheck())) {
			memberService.updateMember(memberVO);
			session.setComplete();
			return HomeController.alert(model, "변경된 정보로 다시 로그인해주세요.", "/qboard/");
		}
		
		return HomeController.alert(model, "비밀번호를 다시 확인해 주세요.", "/qboard/modForm.me");
	}
}
