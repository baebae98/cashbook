package kr.co.gdu.cash.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;//http 를 사용하면 실제 세션의 변수를 받아옴.

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Member;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class LoginController {
	@Autowired private NoticeService noticeService;
	@Autowired private MemberService memberService;
	
	@PostMapping("/login")
	public String login(Member member,HttpSession session) {//로그인 액션 역할
		Member loginMember = memberService.getMemberById(member);
		if(loginMember == null) {
			return "redirect:/login";
		}
		session.setAttribute("loginId", loginMember.getId());
		return "redirect:/admin/index";
	}
	
	@GetMapping(value = {"/","/login"})//그냥 요청하거나 로그인으로 요청하면
	public String login(Model model,HttpSession session) {//로그인 폼으로 이동하는 역할
		
		if(session.getAttribute("loginId")!=null) { // x_y 스네이크방식, xy 카넬방식,
			return "redirect:/admin/index";
		}
		
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		//request.setAttribute("noticeList", noticeList);
		return "login";
	}
	
	

	@GetMapping("/admin/logout")
	public String logout(HttpSession session) { //Httpsession을 사용한 이유는 여러가지의 방법이 있지만 현재는 배운내용 중 편해서 사용함.
		session.invalidate();
		return "redirect:/";
	}
	
}
