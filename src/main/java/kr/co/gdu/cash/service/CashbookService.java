package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashBookMapper;
	public int getCountCashbook() {
		return cashBookMapper.selectCashbookCount();
	}
	public List<Cashbook> getCashbookListAll(){
		return cashBookMapper.selectCashbookListAll();
	}
	
	//cashbook 전체목록(페이징)
	public List<Cashbook> getCashbookListByPage(int currentPage,int rowPerPage){
		Map<String,Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage",rowPerPage);
		return cashBookMapper.selectCashbookListByPage(map);
	}
	
	//cashbook 삭제
	public void removeCashbook(int cashbookId) {
		cashBookMapper.deleteCashbook(cashbookId);
	}
	
	//cashbook 수정
	public int modifyCashbook(Cashbook cashbook) {
		return cashBookMapper.updateCashbook(cashbook);
	}
	//cashbook 상세보기
	public Cashbook getCashbookOne(int cashbookId) {
		Cashbook cashbook = cashBookMapper.selectCashbookOne(cashbookId);
		return cashbook;
	}
	
	public int addCashbook(Cashbook cashbook) {
		return cashBookMapper.insertCashbook(cashbook);
	}
	//cashbook 일별 보기(페이징)
	public List<Cashbook> getCashbookListByDay(int currentYear,int currentMonth,int currentDay ){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		return cashBookMapper.selectCashBookListByDay(map);
	}
	
	public int getSumCashbookPriceByInOut(String cashbookKind,int currentYear,int currentMonth) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		Integer sum = cashBookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
	
	//vo 와 같다.(필드 값,필드 값) = map <String,o...>
	public List<Map<String,Object>> getCashListByMonth(int currentYear,int currentMonth){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth",currentMonth);		
		return cashBookMapper.selectCashListByMonth(map);
	}
}