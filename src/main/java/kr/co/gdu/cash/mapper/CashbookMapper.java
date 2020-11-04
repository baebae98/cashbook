package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/*
 * @Mapper란 : @ = 어노테이션이라 함. 검색해서 알아보기
 *controller, @ Service, @Mapper , @Repository :  전문용어로 스테레오타입이라 불림.
*/
@Mapper
public interface CashbookMapper {
	 List<Map<String, Object>> selectCashInOutList();
	 Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	
	 List<Map<String,Object>> selectCashListByMonth(Map<String,Object>map);
}
