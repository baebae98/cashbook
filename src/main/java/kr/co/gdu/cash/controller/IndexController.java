package kr.co.gdu.cash.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.NoticeService;

@Controller
public class IndexController {
	
	//객체를 
	@Autowired private NoticeService noticeService;
	
	
	@GetMapping(value="/admin/index") // /admin/index로 요청했을때만 들어올 수 있음.
	public String index(Model model) { // model은 현재 request.getAttribute(); 역할을 함.
		Map<String,Object> map = noticeService.getNoticeAndInOutList();
		model.addAttribute("noticeList",map.get("noticeList"));
		model.addAttribute("inOutList",map.get("inOutList"));
		return "index";
		
	}
}
