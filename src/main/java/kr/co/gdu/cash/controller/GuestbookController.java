package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.service.GuestbookService;
import kr.co.gdu.cash.vo.Guestbook;

@Controller
public class GuestbookController {
	@Autowired private GuestbookService guestbookService;
	
	// 방명록 목록
	@GetMapping("/admin/guestbookList/{currentPage}")
	public String guestbookList(Model model,
			@PathVariable(value = "currentPage",required = true) int currentPage) {
		int rowPerPage = 10;
		
		
		List<Guestbook> guestbookList = guestbookService.getGuestbookListPage(currentPage, rowPerPage);
		System.out.println("Debug: " + guestbookList);
		int totalCount = guestbookService.getCountGuestbook(); //전체 데이터
		int lastPage = totalCount/rowPerPage; //마지막페이지
		
		if(totalCount % rowPerPage != 0) {//10개 미만의 개수의 데이터가 있는 페이지 표시
			lastPage +=1;
		}
		if(lastPage == 0) { //전체 페이지가 0개이면 현재 페이지도 0으로 표시함.
			currentPage = 0;
		}
		model.addAttribute("guestbookList", guestbookList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage",lastPage);
		return "guestbookList";
	}
	
	// 방명록 입력 Form
	@GetMapping("/admin/addGuestbook")
	public String addGuestbook() {
		
		return "addGuestbook";
	}
	
	// 방명록 입력 Action
	@PostMapping("/admin/addGuestbook")
	public String addGuestbook(Guestbook guestbook) {
		System.out.println("Debug: " + guestbook);
		
		guestbookService.addGuestbook(guestbook);
		
		return "redirect:/admin/guestbookList/1";
	}
	
	// 방명록 삭제
	@GetMapping("/admin/removeGuestbook/{guestbookId}")
	public String removeGuestbook(Model model,
			@PathVariable(value = "guestbookId") int guestbookId) {
		
		System.out.println("Debug: guestbookId[" + guestbookId + "] 삭제");
		
		guestbookService.removeGuestbook(guestbookId);
		
		return "redirect:/admin/guestbookList/1";
	}
	
	// 방명록 수정 Form
	@GetMapping("/admin/modifyGuestbook/{guestbookId}")
	public String modifyGuestbook(Model model, 
			@PathVariable(value = "guestbookId") int guestbookId) {
	
		Guestbook guestbook = guestbookService.getGuestbookOne(guestbookId);
		System.out.println("Debug: " + guestbookId);
		
		model.addAttribute("guestbook", guestbook);
		
		return "modifyGuestbook";
	}
	
	// 방명록 수정 Action
	@PostMapping("/admin/modifyGuestbook")
	public String modifyGuestbook(Guestbook guestbook) {
		System.out.println("Debug: " + guestbook);
		
		guestbookService.modifyGuestbook(guestbook);
		
		return "redirect:/admin/guestbookList/1";
	}
}
