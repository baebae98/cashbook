package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper
public interface NoticeMapper {
	// 인덱스화면에 최근 5개 공지를 보여주는 메서드
	List<Notice> selectLastestNoticeList();
}
