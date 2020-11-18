package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashStatsRestService;

@RestController
public class CashStatsRestController {
	@Autowired CashStatsRestService cashStatsRestService;
	
	//년도별 총 수입
	@GetMapping("/admin/totalInByYear")
	public List<Map<String, Object>> totalInByYear(){
		return cashStatsRestService.getTotalInByYear();
	}
	//년도별 총 지출
	@GetMapping("/admin/totalOutByYear")
	public List<Map<String,Object>> totalOutByYear(){
		return cashStatsRestService.getTotalOutByYear();
	}
	//년도별 총 수익(수입-지출)
	@GetMapping("/admin/averageInAndOutByYear")
	public List<Map<String,Object>> averageInAndOutByYear(){
		return cashStatsRestService.getAverageInAndOutByYear();
	}
	//각 년도에 따른 월별 총 수입
	@GetMapping("/admin/totalMonthlyInByYear/{year}")
	public Map<String,Object>totalMonthlyInByYear(@PathVariable(name="year")int year){
		return cashStatsRestService.getTotalMonthlyInByYear(year);
	}
	//각 년도에 따른 월별 총 지출
	@GetMapping("/admin/totalMonthlyOutByYear/{year}")
	public Map<String,Object>totalMonthlyOutByYear(@PathVariable(name="year")int year){
		return cashStatsRestService.getTotalMonthlyOutByYear(year);
	}
	//각 년도에 따른 월별 수익(수입-지출)
	@GetMapping("/admin/totalAverageInAndOutByYear/{year}")
	public List<Map<String, Object>> totalAverageInAndOutByYear(@PathVariable(name="year")int year){
		return cashStatsRestService.getTotalAverageInAndOutByYear(year);
	}
	//년도별 가장 많이 번 월 수입
	@GetMapping("/admin/maxMonthByYear")
	public List<Map<String,Object>> MaxMonthByYear(){
		return cashStatsRestService.getMaxMonthByYear();
	}
	//년도별 가장 적게 번 월 수입
	@GetMapping("/admin/minMonthByYear")
	public List<Map<String,Object>> MinMonthByYear(){
		return cashStatsRestService.getMinMonthByYear();
	}
	//년도별 가장 많이 쓴 월 지출
	@GetMapping("/admin/maxOutMonthByYear")
	public List<Map<String,Object>> MaxOutMonthByYear(){
		return cashStatsRestService.getMaxOutMonthByYear();
	}
	//년도별 가장 적게 쓴 월 지출
	@GetMapping("/admin/minOutMonthByYear")
	public List<Map<String,Object>> MinOutMonthByYear(){
		return cashStatsRestService.getMinOutMonthByYear();
	}
}
