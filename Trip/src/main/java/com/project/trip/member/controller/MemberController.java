package com.project.trip.member.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trip.admin.service.AdminService;
import com.project.trip.buy.service.BuyService;
import com.project.trip.item.service.ItemService;
import com.project.trip.member.service.MemberService;
import com.project.trip.member.vo.MemberVO;
import com.project.trip.member.vo.TempMemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
		
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "itemService")
	private ItemService itemService;

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "buyService")
	private BuyService buyService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/loginForm")
	public String loginForm(Model model) {
		//최상단 메뉴 리스트 보내기
		return "member/login";
	}
	@PostMapping("/joinForm")
	public String joinForm(MemberVO memberVO, String memEmail, Model model) {
		memberVO.setMemId(memberVO.getMemId() + "@" + memEmail);
		model.addAttribute("joinInfo", memberVO);
		return "member/join";
	}
	@GetMapping("/certiJoinForm")
	public String certiJoinForm(Model model) {
		return "member/certification_join";
	}
	
	@GetMapping("/loginTempForm")
	public String loginTempForm(Model model) {
		return "member/login_temp";
	}
	
	@ResponseBody
	@PostMapping("/findTempMember")
	public int findTempMember(TempMemberVO tempMemberVO) {
		return memberService.findTempMember(tempMemberVO);
	}
	
	@PostMapping("/loginTemp")
	public String loginTemp(Model model, TempMemberVO tempMemberVO) {
		model.addAttribute("tempMemberInfo", memberService.selectTempMember(tempMemberVO));
		model.addAttribute("tempMemberBookInfo", buyService.selectTempMemberBookInfo(tempMemberVO));
		return "member/temp_reservation_info";
	}
	
	@GetMapping("/findIdForm")
	public String findIdForm(Model model) {
		return "member/find_id";
	}
	
	@GetMapping("/findPwForm")
	public String findPwForm(Model model) {
		return "member/find_pw";
	}
	
	@GetMapping("/changeMemberInfoForm")
	public String changeMemberInfoForm(Model model) {
		return "member/change_member_info";
	}
	
	@PostMapping("/join")
	public String join(MemberVO memberVO, Model model) {
		memberService.join(memberVO);
		model.addAttribute("joinInfo", memberVO);
		return "member/result_join";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpSession session) {
		MemberVO result = memberService.login(memberVO);
		MemberVO deactivate = memberService.findDeactivateMember(memberVO);
		if(result != null) {
			if(deactivate != null) {
				return "deactivate";
			}else {			
				session.setAttribute("loginInfo", result);
				return result.getMemName();
			}
		}else {
			return "";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/member/loginForm";
	}
	
	@ResponseBody
	@PostMapping("/selectId")
	public boolean selectId(MemberVO memberVO) {
		String result = memberService.selectId(memberVO);
		return result == null ? false : true;
	}
	
	@ResponseBody
	@PostMapping("/selectTell")
	public String selectTell(MemberVO memberVO) {
		MemberVO result = memberService.selectTell(memberVO);
		return result == null ? "" : result.getMemTell(); 
	}
	
	@ResponseBody
	@PostMapping("/findId")
	public String findId(MemberVO memberVO) {
		MemberVO result = memberService.findId(memberVO);
		MemberVO deactivate = memberService.findDeactivateMember(result);
		if(result != null) {
			if(deactivate != null) {
				return "deactivate";
			}else{
			return result.getMemId();
			}
		}else {
			return "";
		}
	}
	
	@ResponseBody
	@PostMapping("/findPwSendMail")
	public void findPwSendMail(MemberVO memberVO, HttpServletResponse response) {
		String memEmail = memberService.selectId(memberVO);
		List<String> memNames = memberService.selectName(memberVO);
		String memName = memNames.get(0);
		String memCertiNum = getCertiNum();
		
		Cookie cookie = new Cookie("certiNum", memCertiNum);
		cookie.setMaxAge(60 * 3);//초단위
		response.addCookie(cookie);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;
				
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("ayb0675@gmail.com");
			messageHelper.setTo(memEmail);
			messageHelper.setSubject("인증번호");
			messageHelper.setText(memName + "님의 인증번호는 " + memCertiNum + "입니다."  );

			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@PostMapping("/joinSendMail")
	public void joinSendMail(MemberVO memberVO, HttpServletResponse response) {
		String memEmail = memberVO.getMemId();
		String memName = memberVO.getMemName();
		String memCertiNum = getCertiNum();
		
		Cookie cookie = new Cookie("certiNum", memCertiNum);
		cookie.setMaxAge(60 * 3);//초단위
		response.addCookie(cookie);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;
			
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("ayb0675@gmail.com");
			messageHelper.setTo(memEmail);
			messageHelper.setSubject("인증번호");
			messageHelper.setText(memName + "님의 인증번호는 " + memCertiNum + "입니다."  );
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/myInfo")
	public String myInfo(HttpSession session, MemberVO memberVO, Model model) {
		memberVO = (MemberVO)session.getAttribute("loginInfo");
		String memId = memberVO.getMemId();
		
		model.addAttribute("memInfo", adminService.selectMemberDetail(memberVO));
		model.addAttribute("buyList", memberService.selectBookList(memId));
		return "member/my_info";
	}
	
	public String getCertiNum() {
		String lowerCase = "abcdefghijklmnopqrstuvwxyz";
		String upperCase = lowerCase.toUpperCase();
		String number = "0123456789"; 
		String baseStr = lowerCase + upperCase + number;
		
		
		StringBuilder certiNum = new StringBuilder();
		
		for(int i = 0 ; i < 8 ; i++) {
			SecureRandom rand = new SecureRandom();
			int index = rand.nextInt(baseStr.length());
			char c = baseStr.charAt(index);
			certiNum.append(String.valueOf(c));
		}
		
		return certiNum.toString();
	}
	@ResponseBody
	@PostMapping("/certification")
	public boolean certification(HttpServletRequest request, String memCertiNum) {
		Cookie[] cookies = request.getCookies();
		String certNum = null;
		if(cookies!=null){
	        for (Cookie c : cookies) {
	            String name = c.getName(); // 쿠키 이름 가져오기
	            String value = c.getValue(); // 쿠키 값 가져오기
	            if (name.equals("certiNum")) {
	            	certNum = value;
	            }
	        }
	    }
		
		if(certNum.equals(memCertiNum) ) {
			return true;
		}
		else {
			return false;
		}

	}
	
	@GetMapping("/resultFindIdForm")
	public String resultFindIdForm(Model model, String memId, MemberVO memberVO) {
		memberVO.setMemId(memId);
		MemberVO result = memberService.findPw(memberVO);
		model.addAttribute("findIdInfo", result);
		return "member/result_find_id";
	}
	@PostMapping("/resultFindPwForm")
	public String resultFindPwForm(Model model, MemberVO memberVO) {
		MemberVO result = memberService.findPw(memberVO);
		model.addAttribute("findPwInfo", result);
		return "member/result_find_pw";
	}
	@PostMapping("/changePwForm")
	public String changePwForm(Model model, MemberVO memberVO) {
		model.addAttribute("findPwInfo", memberVO);
		return "member/change_pw";
	}
	@ResponseBody
	@PostMapping("/changePw")
	public void changePw(MemberVO memberVO, HttpSession session) {
		memberService.changePw(memberVO);
		MemberVO result = memberService.login(memberVO);
		session.setAttribute("loginInfo", result);
	}
	@ResponseBody
	@PostMapping("/deactivateMember")
	public void deactivateMember(MemberVO memberVO, HttpSession session) {
		memberService.deactivateMember(memberVO);
		session.removeAttribute("loginInfo");
	}
	@ResponseBody
	@PostMapping("/changeMemberInfo")
	public void changeMemberInfo(MemberVO memberVO, HttpSession session) {
		memberService.changeMemberInfo(memberVO);
		session.setAttribute("loginInfo", memberVO);
	}
}
