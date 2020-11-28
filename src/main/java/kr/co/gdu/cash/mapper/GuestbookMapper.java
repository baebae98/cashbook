package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Guestbook;

@Mapper
public interface GuestbookMapper {
		// 방명록에서 목록 페이징
		List<Guestbook> selectGuestbookListByPage(Map<String, Integer> map);
		
		// 방명록 페이지 카운트
		int countGuestbook();
		
		// 방명록 내용
		Guestbook selectGuestbookOne(int guestbookId);
		
		// 방명록 입력
		int insertGuestbook(Guestbook guestbook);
		
		// 방명록 수정
		int updateGuestbook(Guestbook guestbook);
		
		// 방명록 삭제
		int deleteGuestbook(int guestbookId);
}
