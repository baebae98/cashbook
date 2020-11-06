package kr.co.gdu.cash.controller;


import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class CashBookController {
	/*@Autowired
	private NoticeService indexService; // new IndexService랑 똑같음*/
	
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	
	//cashbook 삭제
	@GetMapping("/admin/removeCashbook")
	public String removeCashbook(@RequestParam(value="cashbookId")int cashbookId) {
		cashbookService.removeCashbook(cashbookId);
		return "redirect:/admin/cashbookByMonth";
	}
	
	//cashbook 수정 액션
	@PostMapping("/admin/modifyCashbook")
	public String modifyCashbook(Cashbook cashbook) {
		cashbookService.modifyCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth?cashbookId="+cashbook.getCashbookId();
	}
	
	//cashbook 수정 폼
	@GetMapping("/admin/modifyCashbook")
	public String modifyNotice(Model model, 
			@RequestParam(value = "cashbookId") int cashbookId) {
		Cashbook cashbook = cashbookService.getCashbookOne(cashbookId);
		List<Category> categoryList = categoryService.getCategoryList();
		
		model.addAttribute("cashbook",cashbook);
		model.addAttribute("categoryList",categoryList);
		
		return "modifyCashbook";
	}
	/*//casgbook 상세보기
	@GetMapping("/admin/cashbookOne")
	public String cashbookOne(Model model,@RequestParam(value="cashbookId")int cashbookId) {
		Cashbook cashbook = cashbookService.getCashbookOne(cashbookId);
		model.addAttribute("cashbook",cashbook);
		return "cashbookOne";
	}*/
	
	//cashbook 입력액션
	@PostMapping("/admin/addCashbook") //session값이 없으면 들어오지 못함.
	public String addCashbook(Cashbook cashbook) { //커맨드객체
		System.out.println(cashbook);
		//System.out.println("cashbook 입력 :");
		cashbookService.addCashbook(cashbook);//입력하면
		return "redirect:/admin/cashbookByMonth"; //response.sendRedirecr()역할. -> /admin/cashbookByDay
	}
	
	// cashbook 입력 폼
	@GetMapping("/admin/addCashbook") //value 생략가능
	public String addCashbook(Model model,
			@RequestParam(name = "currentYear",required = true)int currentYear,
			@RequestParam(name = "currentMonth",required = true)int currentMonth,
			@RequestParam(name = "currentDay",required = true)int currentDay) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList",categoryList);
		return "addCashbook"; //포워딩 역할을 함.
	}
	
	
	//cashbook 상세보기 페이지
	@GetMapping("/admin/cashbookByDay") // value 생략가능
	public String cashbookByDay(Model model, 
			@RequestParam(name="target",defaultValue = "") String target,		//pre, next
			@RequestParam(name = "currentYear",required = true)int currentYear, // request.getParameter("currentYear", currentYear);와 동일한 코드
			@RequestParam(name = "currentMonth",required = true)int currentMonth,
			@RequestParam(name = "currentDay",required = true)int currentDay) {
		
			Calendar targetDay = Calendar.getInstance();
			targetDay.set(Calendar.YEAR,currentYear);
			targetDay.set(Calendar.MONTH, currentMonth-1);
			targetDay.set(Calendar.DATE, currentDay);
			if(target.equals("pre")){
				targetDay.add(Calendar.DATE, -1);//-
			}else if(target.equals("next")) {
				targetDay.add(Calendar.DATE, 1);//+
			}
			
			List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONTH)+1, targetDay.get(Calendar.DATE));
			model.addAttribute("cashbookList", cashbookList);
			model.addAttribute("currentYear",targetDay.get(Calendar.YEAR));
			model.addAttribute("currentMonth",targetDay.get(Calendar.MONTH)+1);
			model.addAttribute("currentDay",targetDay.get(Calendar.DATE));
		return "cashbookByDay";
	}
	
	//
	@GetMapping(value ="/admin/cashbookByMonth" )
	//requestparam으로 paramMonth가 null이면 0으로 바꿔라(int로 형변환을 해야하기 떄문에) = ("request.getParamater("paramMonth");) 
	public String cashbookByMonth(Model model,
			@RequestParam(name = "currentYear",defaultValue = "-1")int currentYear,
			@RequestParam(name="currentMonth",defaultValue = "-1") int currentMonth) {
		
		//1. 요청분석
		/*
		 *
		 */
		Calendar currentDay = Calendar.getInstance();// 2020년 11월 2일.
		//currentYear 넘어오고, currentMonth도  넘어오면 
		//CalendarAPI 수정해야함 - > currentDay.add(Calendar.Month를 -1 or +1 )
		if(currentYear != -1 && currentMonth != -1) {
			if(currentMonth == 0) {
				currentMonth = 12; //currentMonth가 0이면 12월로 바뀌고
				currentYear -=1;  //년도가 1년 빠짐.
			}
			if(currentMonth == 13) {//month가 13월 되면
				currentMonth = 1;  // 1월로 바뀌고
				currentYear +=1;  // 년도는 1년 올라간다.
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		currentDay.set(Calendar.DATE, 1); // 2020년 11월1일
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth= currentDay.get(Calendar.MONTH) + 1; //월
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		//----------------------------------------------------------------
		int sumIn = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		int sumOut= cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		
		//----------------------------------------------------------------
		List<Map<String,Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		//----------------------------------------------------------------

		//디버깅
		//System.out.println(currentMonth+"<--month");
		//System.out.println(lastDay+"<--lastDay");
		
	
		
		// 2.서비스 호출
		//List<Notice> list = indexService.getLastestNoticeList();
		//System.out.println("list.size(5)-->" + (list.size() == 5));
		
		// 3. 뷰 연결(모델 추가)
		/*
		 * 1) 월, 마지막 일(30 or 31 , 윤달이 껴서 ..29일인지...), 1일 요일
		 * 공지사항 목록
		 */
		model.addAttribute("currentYear",currentYear); //년
		model.addAttribute("currentMonth", currentMonth);//월
		model.addAttribute("lastDay",lastDay);//마지막 일
		model.addAttribute("firstDayOfWeek",firstDayOfWeek); //1일의 요일
		
		model.addAttribute("sumIn",sumIn);
		model.addAttribute("sumOut",sumOut);
		
		model.addAttribute("cashList",cashList);
		//model.addAttribute("list", list);
		return "cashbookByMonth";
	}
}
