package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper //이 mapper는 예)public class NoticeMapperImple...{} 이러한 클래스가만들어짐.
public interface NoticeMapper {
	// 인덱스화면에 최근 5개 공지를 보여주는 메서드
	List<Notice> selectLastestNoticeList();
}
