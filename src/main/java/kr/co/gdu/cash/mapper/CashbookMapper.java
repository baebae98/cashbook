package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

/*
 * @Mapper란 : @ = 어노테이션이라 함. 검색해서 알아보기
 *controller, @ Service, @Mapper , @Repository :  전문용어로 스테레오타입이라 불림.
*/
@Mapper
public interface CashbookMapper {
	// 인수(Map) : beginRow , rowPerPage
	List<Cashbook> selectCashbookListByPage(Map<String,Object>map); // cashbookList를 전체 출력해보기 위해
	//전체 CASHBOOKlIST ->엑셀파일
	List<Cashbook> selectCashbookListAll();
	
	Cashbook selectCashbookOne(int cashbookId); //상세보기(내용)
	int deleteCashbook(int cashbookid); //삭제
	int updateCashbook(Cashbook cashbook);//수정
	int insertCashbook(Cashbook cashbook) ;//입력
	 List<Map<String, Object>> selectCashInOutList();
	 Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	 List<Map<String,Object>> selectCashListByMonth(Map<String,Object>map);
	 List<Cashbook> selectCashBookListByDay(Map<String,Object>map);
	 //count
	 int selectCashbookCount();
}
