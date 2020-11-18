package kr.co.gdu.cash.restservice;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashStatsRestMapper;

@Service
@Transactional
public class CashStatsRestService {
	@Autowired
	CashStatsRestMapper cashStatsRestMapper;
	
	//년도별 총 수입
	public List<Map<String, Object>> getTotalInByYear(){
		return cashStatsRestMapper.selectTotalInByYear();
	}
	//년도별 총 지출
	public List<Map<String,Object>> getTotalOutByYear(){
		return cashStatsRestMapper.selectTotalOutByYear();
	}
	//년도별 수익(수입 - 지출)
	public List<Map<String,Object>> getAverageInAndOutByYear(){
		return cashStatsRestMapper.selectAverageInAndOutByYear();
	}
	//각 년도에 따른 월별 총 수입
	public Map<String,Object> getTotalMonthlyInByYear(int year){
		return cashStatsRestMapper.selectTotalMonthlyInByYear(year);
	}
	//각 년도에 따른 월별 총 지출
	public Map<String,Object> getTotalMonthlyOutByYear(int year){
		return cashStatsRestMapper.selectTotalMothlyOutByYear(year);
	}
	//각 년도에 따른 월별 수익(수입 - 지출)
	public List<Map<String, Object>> getTotalAverageInAndOutByYear(int year){
		return cashStatsRestMapper.selectTotalAverageInAndOutByYear(year);
	}
	//년도별 가장 많이 번 월 수입
	public List<Map<String,Object>> getMaxMonthByYear(){
		return cashStatsRestMapper.selectMaxMonthByYear();
	}
	//년도별 가장 적게 번 월 수입
	public List<Map<String,Object>> getMinMonthByYear(){
		return cashStatsRestMapper.selectMinMonthByYear();
	}
	//년도별 가장 많이 쓴 월 지출
	public List<Map<String,Object>> getMaxOutMonthByYear(){
		return cashStatsRestMapper.selectMaxOutMonthByYear();
	}
	//년도별 가장 적게 쓴 월 지출
	public List<Map<String,Object>> getMinOutMonthByYear(){
		return cashStatsRestMapper.selectMinOutMonthByYear();
	}
}
