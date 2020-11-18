package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashStatsRestMapper {
	
	public List<Map<String,Object>> selectTotalInByYear(); //년도별 총 수입
	public List<Map<String,Object>> selectTotalOutByYear(); //년도별 총 지출
	public List<Map<String,Object>> selectAverageInAndOutByYear();//년도별 수익(수입-지출)
	public Map<String,Object> selectTotalMonthlyInByYear(int year);//각 년도에 따른 월별 총 수입
	public Map<String,Object> selectTotalMothlyOutByYear(int year);//각 년도에 따른 월별 총 지출
	public List<Map<String,Object>> selectTotalAverageInAndOutByYear(int year); //각 년도에 따른 월별 총 수익
	public List<Map<String,Object>> selectMaxMonthByYear();//년도별 가장 많이 번 월 수입
	public List<Map<String,Object>> selectMinMonthByYear();//년도별 가장 적게 번 월 수입
	public List<Map<String,Object>> selectMaxOutMonthByYear();//년도별 가장 많이 쓴 월 지출
	public List<Map<String,Object>> selectMinOutMonthByYear();//년도별 가장 적게 쓴 월 지출
}
