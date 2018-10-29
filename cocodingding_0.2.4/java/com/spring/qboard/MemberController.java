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
	
	// �ɹ� ���񽺸� ���ҽ��� ���
	@Resource(name = "MemberService")
	private MemberService memberService;
	
	// ����� ���� �������� �̵�
	@RequestMapping(value = "/user.me", method = RequestMethod.GET)
	public String userMain(Model model) throws Exception {
		// ����� ���� �������� �̵�
		return "user/userMain";
	}
	
	// ������ ���� �������� �̵�
	@RequestMapping(value = "/admin.me", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ����� ��� ����
				List<MemberVO> memberList = memberService.selectMemberList();
				// �� ��ü�� ����
				model.addAttribute("memberList", memberList);
				// ������ �������� �̵�
				return "admin/admin_mem";
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ���� ã�� �������� �̵�
	@RequestMapping(value = "/findForm.me", method = RequestMethod.GET)
	public String findForm(Model model) {
		// ���� ã�� �������� �̵�
		return "member/findMem";
	}
	
	// �α��� ��� ����
	@RequestMapping(value = "/loginPro.me", method = RequestMethod.POST)
	public String login(Model model, MemberVO memberVO) throws Exception {
		// ��ü ����� ��� ����
		List<MemberVO> memberList = memberService.selectMemberList();
		// �Է� ���� �Ǻ��� ���� �ݺ���
		for (MemberVO member: memberList) {
			// ID�� ��й�ȣ�� ���� ��ġ�ϴ� ���
			if (member.getId().equals(memberVO.getId()) && member.getPassword().equals(memberVO.getPassword())) {
				// ���� �� �� ��ü�� ����� ���� ����
				model.addAttribute("userInfo", member);
				// ������ ��޿� ���� �̵��� �������� �з���
				if (member.getAdmin() != 0) {
					// ������ ���� �������� �̵�
					return HomeController.alert(model, "������ �������� �α����ϼ̽��ϴ�.", "/qboard/admin.me");
				} else {
					// ����� ���� �������� �̵�
					return HomeController.alert(model, member.getNickname() + " ȸ���� ȯ���մϴ�.", "/qboard/user.me");
				}
			}
		}
		// ��ġ ������ ���� ��� �ǵ��ư�
		return HomeController.alert(model, "��ġ�ϴ� ������ �����ϴ�.", "/qboard");
	}
	
	// �α׾ƿ� ��� ����
	@RequestMapping(value = "/logoutPro.me", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// ���� ��ü�� ������ ����
		session.removeAttribute("userInfo");
		// Ȩ�������� �̵�
		return "redirect:/";
	}
	
	// ȸ������ ��� ����
	@RequestMapping(value = "/joinPro.me", method = RequestMethod.POST)
	public String join(Model model, MemberVO memberVO) throws Exception {
		// �Է� ������ ���Ἲ Ȯ��
		if (!memberVO.getPassword().equals(memberVO.getPasscheck())) {
			return HomeController.alert(model, "��й�ȣ�� Ȯ�����ּ���", "/qboard");
		}
		// ��ü ����� ��� ����
		List<MemberVO> memberList = memberService.selectMemberList();
		// �ߺ��Ǵ� ������ �ִ��� Ȯ��
		for (MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId()) || member.getEmail().equals(memberVO.getEmail())) {
				return HomeController.alert(model, "�ߺ� �����Դϴ�. �ٽ� Ȯ�����ּ���", "/qboard");
			}
		}
		// �����ͺ��̽��� ���ο� ���� ���� ���
		memberService.insertMember(memberVO);
		// �α��� ȭ������ �̵�
		return HomeController.alert(model, "�Է��Ͻ� ������ ȸ�����ԵǼ̽��ϴ�.", "/qboard");
	}
	
	
	
	
	
	
	
	// ������ ���� ���� ���
	@RequestMapping(value = "/admin_modForm.me/{id}", method = RequestMethod.GET)
	public String admin_modForm(@PathVariable String id, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ����� ��� ����
				List<MemberVO> memberList = memberService.selectMemberList();
				// ���� ����� ��� ����
				MemberVO memberVO = memberService.selectMember(id);
				// �� ��ü�� ����
				model.addAttribute("member", memberVO);
				model.addAttribute("memberList", memberList);
				// ������ �������� �̵�
				return "admin/admin_mem";
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}

	@RequestMapping(value = "/admin_modPro.me", method = RequestMethod.POST)
	public String admin_modPro(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ���� Ȯ��
				if (memberVO.getId() != "") {
					// ���� ����� ���� ����
					memberService.updateMember(memberVO);
					// ���� ���� �� ������ �������� �̵�
					return HomeController.alert(model, "ȸ�� ������ �����Ǿ����ϴ�.", "/qboard/admin.me");
				}
				return HomeController.alert(model, "�ùٸ� ȸ�� ������ ������ �ּ���", "/qboard/admin.me");
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	@RequestMapping(value = "/admin_delete.me/{id}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable String id, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		if (session.getAttribute("userInfo") != null) {
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				memberService.deleteMember(id);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "ȸ�� ������ �����Ǿ����ϴ�.", "/qboard/admin.me");
			}
		}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	

	}
	
	@RequestMapping(value = "/findIdPro.me", method = RequestMethod.POST)
	public String findId(Model model, MemberVO memberVO) {
		
		return HomeController.alert(model, "��ġ�ϴ� ������ �����ϴ�.", "/qboard/findForm.me");

	}
	
	@RequestMapping(value = "/findPassPro.me", method = RequestMethod.POST)
	public String findPass(Model model, MemberVO memberVO) {
		
		return HomeController.alert(model, "��ġ�ϴ� ������ �����ϴ�.", "/qboard/findForm.me");
	}
	
	@RequestMapping(value = "/modPro.me", method = RequestMethod.POST)
	public String mod(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		
		if (memberVO.getPassword().equals(memberVO.getPasscheck())) {
			memberService.updateMember(memberVO);
			session.removeAttribute("userInfo");
			return HomeController.alert(model, "����� ������ �ٽ� �α������ּ���.", "/qboard");
		}
		
		return HomeController.alert(model, "��й�ȣ�� �ٽ� Ȯ���� �ּ���.", "/qboard/modForm.me");
	}
}
