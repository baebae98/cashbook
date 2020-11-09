package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;


@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	// 공지 목록
		@SuppressWarnings("unchecked")
		@GetMapping("/admin/noticeList/{currentPage}")
		public String noticeList(Model model,
							@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
							@RequestParam(value = "rowPerPage", defaultValue = "5") int rowPerPage) {
							//@PathVariable(value = "currentPage") int currentPage,
							//@PathVariable(value = "rowPerPage") int rowPerPage) {
							Map<String, Object> map = noticeService.getNoticeListByPage(currentPage, rowPerPage);
			
			List<Notice> noticeList = (List<Notice>)map.get("noticeList");
			int lastPage = (int)map.get("lastPage");
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("lastPage", lastPage);
			return "noticeList";
		}
	// 공지 입력 폼
	@GetMapping("/admin/addNotice")
	public String addNotice(Model model) {
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		return "addNotice";
	}
	// 공지 입력 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice) {
		noticeService.addNotice(notice);
		return "redirect:/admin/noticeList/1";
	}
	// 공지 상세 보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model, 
			//@RequestParam(value = "noticeId") int noticeId) {
			 @PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice",notice);
		return "noticeOne";
	}
	// 공지 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(
			//@RequestParam(value = "noticeId") int noticeId) {
			@PathVariable(value = "noticeId") int noticeId) {
		noticeService.removeNotice(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	// 공지 수정 폼
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, 
			//@RequestParam(value = "noticeId") int noticeId) {
			@PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}
	// 공지 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		noticeService.modifyNotice(notice);
		return "redirect:/admin/noticeOne/"+notice.getNoticeId();
	}
}
