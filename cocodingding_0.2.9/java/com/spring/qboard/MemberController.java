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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.qboard.service.GradeService;
import com.spring.qboard.service.MemberService;
import com.spring.qboard.vo.GradeVO;
import com.spring.qboard.vo.MemberVO;

@Controller
@SessionAttributes("userInfo")
public class MemberController {

	// �ɹ� ���񽺸� ���ҽ��� ���
	@Resource(name = "MemberService")
	private MemberService memberService;

	// �ɹ� ���񽺸� ���ҽ��� ���
	@Resource(name = "GradeService")
	private GradeService gradeService;
	
	// ����� ���� �������� �̵�
	@RequestMapping(value = "/user.me/{field}", method = RequestMethod.GET)
	public String userMain(@PathVariable String field, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));

			// ���� �α����� ���̵�
			String id = ((MemberVO) session.getAttribute("userInfo")).getId();
			
			// ��ü ������� ����Ʈ
			List<GradeVO> gradeList = gradeService.selectGradeList();
			// �� ������� ����Ʈ
			List<GradeVO> myGradeList = gradeService.selectGrade(id);
			
			// ���� ������ �о�, �ܰ��� ��� ����� ���
			List<GradeVO> averageList = new ArrayList<GradeVO>();
			// �� ���� ���, �ܰ��� ��������
			GradeVO myGrade = new GradeVO();
			
			// �ݺ������� ���� �о� �� �ܰ迡���� ���� ���� ����
			for (GradeVO grade: myGradeList) {
				if (grade.getField().equals(field) && myGrade.getLevels().charAt(3) < grade.getLevels().charAt(3)) {
					myGrade = grade;
				}
			}

			// �ݺ������� ���� �о� �� �ܰ��� ��� ȸ�� ���������� ����
			for (GradeVO grade: gradeList) {
				if (grade.getField().equals(field) && myGrade.getLevels().equals(grade.getLevels())) {
					averageList.add(grade);
				}
			}

			// �ش� �о� �� �ܰ��� ����� �����Ͽ� �����Ѵ�.
			for (GradeVO grade: averageList) {
				myGrade.setSet1(myGrade.getSet1() + grade.getPart1());
				myGrade.setSet2(myGrade.getSet2() + grade.getPart2());
				myGrade.setSet3(myGrade.getSet3() + grade.getPart3());
				myGrade.setSet4(myGrade.getSet4() + grade.getPart4());
				myGrade.setSet5(myGrade.getSet5() + grade.getPart5());
				myGrade.setSet6(myGrade.getSet6() + grade.getPart6());
			}

			if (averageList.size() > 0) {
				myGrade.setSet1(myGrade.getSet1() / averageList.size());
				myGrade.setSet2(myGrade.getSet2() / averageList.size());
				myGrade.setSet3(myGrade.getSet3() / averageList.size());
				myGrade.setSet4(myGrade.getSet4() / averageList.size());
				myGrade.setSet5(myGrade.getSet5() / averageList.size());
				myGrade.setSet6(myGrade.getSet6() / averageList.size());
			}
			
			model.addAttribute("grade", myGrade);
			
			return "user/userMain";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ������ ���� �������� �̵�
	@RequestMapping(value = "/admin.me", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ����� ��� ����
				List<MemberVO> memberList = memberService.selectMemberList();
				// �� ��ü�� ����
				model.addAttribute("memberList", memberList);
				// ������ �������� �̵�
				return "admin/admin_mem";
			}
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
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
					return HomeController.alert(model, member.getNickname() + " ȸ���� ȯ���մϴ�.", "/qboard/user.me/Java");
				}
			}
		}
		// ��ġ ������ ���� ��� �ǵ��ư�
		return HomeController.alert(model, "��ġ�ϴ� ������ �����ϴ�.", "/qboard");
	}
	
	// �α׾ƿ� ��� ����
	@RequestMapping(value = "/logoutPro.me", method = RequestMethod.GET)
	public String logout(Model model) {
		// ���� ��ü�� ������ ����
		model.addAttribute("userInfo", false);
		// Ȩ�������� �̵�
		return HomeController.alert(model, "�α׾ƿ� �ϼ̽��ϴ�.", "/qboard");
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
	
	// �������� ���� �������� �̵�
	@RequestMapping(value = "/modForm.me", method = RequestMethod.GET)
	public String modForm(Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// �������� ���� �������� �̵�
			return "member/modMem";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// �������� ���� �������� �̵�
	@RequestMapping(value = "/modPro.me", method = RequestMethod.POST)
	public String modPro(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ����� ���� ���� ���
			memberService.updateMember(memberVO);
			// ���� ��ü�� ������ ����
			model.addAttribute("userInfo", false);
			// Ȩ�������� �̵�
			return HomeController.alert(model, "����� ������ �ٽ� �α����� �ּ���", "/qboard");
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ������ ���� ���� ���
	@RequestMapping(value = "/admin_modForm.me/{id}", method = RequestMethod.GET)
	public String admin_modForm(@PathVariable String id, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
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
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}

	@RequestMapping(value = "/admin_modPro.me", method = RequestMethod.POST)
	public String admin_modPro(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
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
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	
	}
	
	@RequestMapping(value = "/admin_delete.me/{id}", method = RequestMethod.GET)
	public String admin_delete(@PathVariable String id, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ���� ����� ����
				memberService.deleteMember(id);
				// ���� �Ϸ� �� ������ �������� �̵�
				return HomeController.alert(model, "ȸ�� ������ �����Ǿ����ϴ�.", "/qboard/admin.me");
			}
		} catch (Exception e) {}
		// ������ ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");	

	}
	
}
