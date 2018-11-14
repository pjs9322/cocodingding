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

import com.spring.qboard.service.GradeService;
import com.spring.qboard.service.MemberService;
import com.spring.qboard.vo.GradeVO;
import com.spring.qboard.vo.MemberVO;
import com.spring.qboard.vo.PageVO;

@Controller
@SessionAttributes("userInfo")
public class MemberController {

	// �ɹ� ���񽺸� ���ҽ��� ���
	@Resource(name = "MemberService")
	private MemberService memberService;

	// ���� ���񽺸� ���ҽ��� ���
	@Resource(name = "GradeService")
	private GradeService gradeService;
	
	// ����� ���� �������� �̵�
	@RequestMapping(value = "/user.me", method = RequestMethod.GET)
	public String userMain(
						@RequestParam(defaultValue="JAVA") String field,
						@RequestParam(defaultValue="0") int levels, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			// ���� �α����� ���̵�
			MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
			// ��ü ������� ����Ʈ
			List<GradeVO> gradeList = gradeService.selectGradeList();
			// �� ������� ����Ʈ
			List<GradeVO> myGradeList = gradeService.selectGrade(userInfo.getId());
			
			// ���� ������ �о�, �ܰ��� ��� ����� ���
			List<GradeVO> averageList = new ArrayList<GradeVO>();
			// �� ���� �о�, �ܰ��� ��������
			GradeVO myGrade = new GradeVO();

			int java = 0;
			int web = 0;
			int database = 0;
			
			// �ݺ������� �� �ܰ躰 ���� ���� ����
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
			
			// �Ķ���� ������ 0�̸� �ִ� ������ ǥ��, �� �ܿ��� ������ ������ ǥ��
			if (levels == 0) {
				// �ݺ������� ���� �о� �� �ܰ迡���� ���� ���� ����
				for (GradeVO grade: myGradeList) {
					if (grade.getField().equals(field) && myGrade.getLevels() < grade.getLevels()) {
						myGrade = grade;
					}
				}
			} else {
				// �ݺ������� ���� �о� �� �ܰ迡���� ���� ���� ����
				for (GradeVO grade: myGradeList) {
					if (grade.getField().equals(field) && grade.getLevels() == levels) {
						myGrade = grade;
					}
				}
			}
			

			// �ݺ������� ���� �о� �� �ܰ��� ��� ȸ�� ���������� ����
			for (GradeVO grade: gradeList) {
				if (grade.getField().equals(field) && myGrade.getLevels() == grade.getLevels()) {
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

			int correct = myGrade.getPart1()
						+ myGrade.getPart2()
						+ myGrade.getPart3()
						+ myGrade.getPart4()
						+ myGrade.getPart5()
						+ myGrade.getPart6();
			
			// ���ܹ��� 1
			String evalText1;
			if (correct < 24) {
				evalText1 = "�������� ����";
			} else if (correct < 42) {
				evalText1 = "�������� ����";
			} else {
				evalText1 = "�ɼ��� ����";
			}
			// ���ܹ��� 2
			String evalText2;
			if (correct < 24) {
				evalText2 = "�⺻���� ���� ���ذ�";
			} else if (correct < 42) {
				evalText2 = "Ȯ���� ���� ������";
			} else {
				evalText2 = "����ɷ� �����";
			}

			if ("JAVA".equals(field)) {
				model.addAttribute("levels", java);
			}
			if ("WEB".equals(field)) {
				model.addAttribute("levels", web);
			}
			if ("DataBase".equals(field)) {
				model.addAttribute("levels", database);
			}
			model.addAttribute("field", field);
			model.addAttribute("grade", myGrade);
			model.addAttribute("evalText1", evalText1);
			model.addAttribute("evalText2", evalText2);
			model.addAttribute("userInfo", userInfo);
			
			return "user/userMain";
		} catch (Exception e) {}
		// �ùٸ� ������ �ƴ� ��� ��� ���
		return HomeController.alert(model, "�ùٸ� ������ �ƴմϴ�.", "/qboard");
	}
	
	// ������ ���� �������� �̵�
	@RequestMapping(value = "/admin.me", method = RequestMethod.GET)
	public String admin(@RequestParam(defaultValue="1") int page,
						@RequestParam(defaultValue="0") int opt,
						@RequestParam(defaultValue="") String condition, Model model, HttpSession session) throws Exception {
		// ����� ���� ���� Ȯ�� (�α��� ���� Ȯ��)
		try {
			model.addAttribute("userInfo", (MemberVO) session.getAttribute("userInfo"));
			// ���� ���� ������ ������ �������� Ȯ��
			if (((MemberVO) session.getAttribute("userInfo")).getAdmin() != 0) {
				// ��ü ����� ��� ����
				List<MemberVO> memberList = memberService.selectMemberList();

				// �˻� ���� ����
			    List<MemberVO> list = new ArrayList<MemberVO>();
			    switch(opt) {
			    case 0: // ID
					for (MemberVO article: memberList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getId().contains(condition)) {
							list.add(article);
						}
					}
			    	break; 
		    	case 1: // �г���
					for (MemberVO article: memberList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getNickname().contains(condition)) {
							list.add(article);
						}
					}
			    	break;
			    case 2: // �̸���
					for (MemberVO article: memberList) {
						// �˻� ����� �����ϴ� �۸� �߰�
						if (article.getEmail().contains(condition)) {
							list.add(article);
						}
					}
					break;
			    }
			    
				// ������ ���� VO ����
		        PageVO pageVO = new PageVO(list.size(), page);

		        
			    // �� ��ü�� ����
			    model.addAttribute("opt", opt);
			    model.addAttribute("condition", condition);
			    model.addAttribute("list", list);
		        model.addAttribute("pageVO", pageVO);
		        
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
					return HomeController.alert(model, member.getNickname() + " ȸ���� ȯ���մϴ�.", "/qboard/user.me");
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
/*		for (MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId()) || member.getEmail().equals(memberVO.getEmail())) {
				return HomeController.alert(model, "�ߺ� �����Դϴ�. �ٽ� Ȯ�����ּ���", "/qboard");
			}
		}
*/
		// �ߺ��Ǵ� ������ �ִ��� Ȯ��
		for (MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId())){
				return HomeController.alert(model, "���̵� �ߺ��Դϴ�. �ٽ� Ȯ�����ּ���", "/qboard");
			} else if (member.getNickname().equals(memberVO.getNickname())) {
				return HomeController.alert(model, "�г��� �ߺ��Դϴ�. �ٽ� Ȯ�����ּ���", "/qboard");
			} else if (member.getEmail().equals(memberVO.getEmail())) {
				return HomeController.alert(model, "�̸��� �ߺ��Դϴ�. �ٽ� Ȯ�����ּ���", "/qboard");
			}
		}
		// �����ͺ��̽��� ���ο� ���� ���� ���
		memberService.insertMember(memberVO);
		// �α��� ȭ������ �̵�
		return HomeController.alert(model, "�Է��Ͻ� ������ ȸ�����ԵǼ̽��ϴ�.", "/qboard");
	}
	
	// ���̵� ã��
	@RequestMapping(value = "/idsearch.me", method = RequestMethod.POST)
	public String idsearch(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		
		List<MemberVO> memberList = memberService.selectMemberList();
		
		for(MemberVO member: memberList) {
			if (member.getEmail().equals(memberVO.getEmail())) {
				return HomeController.alert(model, "ȸ������ ID�� [" + member.getId() + "] �Դϴ�.", "/qboard");
			}
		}

		return HomeController.alert(model, "��ġ�ϴ� ȸ�� ������ �����ϴ�.", "/qboard");
	}
	
	// ��й�ȣ ã��
	@RequestMapping(value = "/pwsearch.me", method = RequestMethod.POST)
	public String pwsearch(Model model, MemberVO memberVO, HttpSession session) throws Exception {
		
		List<MemberVO> memberList = memberService.selectMemberList();
		
		int newPW = 0;
		
		for(MemberVO member: memberList) {
			if (member.getId().equals(memberVO.getId()) && member.getEmail().equals(memberVO.getEmail())) {
				newPW = (int) (Math.random() * 9000 + 1000);
				
				member.setPassword(String.valueOf(newPW));
				memberService.updateMember(member);
				
				return HomeController.alert(model, "���ο� ��й�ȣ [" + member.getPassword() + "] �� �����Ǿ����ϴ�.�α��� �� ��й�ȣ�� �������ּ���.", "/qboard");
			}
		}

		return HomeController.alert(model, "��ġ�ϴ� ȸ�� ������ �����ϴ�.", "/qboard");
	}
	
	// �������� ����
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
