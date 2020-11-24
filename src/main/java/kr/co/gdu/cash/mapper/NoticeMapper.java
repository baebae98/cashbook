package kr.co.gdu.cash.mapper;

import java.util.*;


import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper //이 mapper는 예)public class NoticeMapperImple...{} 이러한 클래스가만들어짐.
public interface NoticeMapper {
	// 인덱스화면에 최근 5개 공지를 보여주는 메서드
	int insertNotice(Notice notice);//입력
	int updateNotice(Notice notice);//수정
	int deleteNotice(int noticeId);//삭제
	int selectNoticeCount();//공지사항 카운트
	Notice selectNoticeOne(int noticeId);//상세보기
	List<Notice> selectLastestNoticeList();//목록
	List<Notice> selectNoticeListByPage(Map<String,Integer>map);
}
